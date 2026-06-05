function [xi_T_n_t, xi_R_n_t, nu_t, theta_ver_T_n_t, theta_azi_T_n_t, theta_ver_R_n_t, theta_azi_R_n_t] = rho_ACF_cluster_time_BDCM(v_T, v_R,...
                                                                 eta_ver_T, eta_azi_T, eta_azi_R, t, d_n, D_0, H_0, P, Q, p, q, delta_T, delta_R, ...
                                                                 psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, lambda)

V_T = [v_T*cos(eta_ver_T)*cos(eta_azi_T), v_T*cos(eta_ver_T)*sin(eta_azi_T), v_T*sin(eta_ver_T)];
V_R = [v_R*cos(eta_azi_R), v_R*sin(eta_azi_R), 0];

d_Tx_t = v_T * t * cos(eta_ver_T) * cos(eta_azi_T);
d_Ty_t = v_T * t * cos(eta_ver_T) * sin(eta_azi_T);
d_Tz_t = v_T * t * sin(eta_ver_T);
d_T_t = [d_Tx_t, d_Ty_t, d_Tz_t + H_0];

d_Rx_t = v_R * t * cos(eta_azi_R);
d_Ry_t = v_R * t * sin(eta_azi_R);
d_Rz_t = 0;
d_R_t = [D_0 + d_Rx_t, d_Ry_t, d_Rz_t];

d_T_p = (P-2*p+1)/(2)*delta_T * [cos(psi_ver_T)*cos(psi_azi_T), cos(psi_ver_T)*sin(psi_azi_T), sin(psi_ver_T)];
d_R_q = (Q-2*q+1)/(2)*delta_R * [cos(psi_ver_R)*cos(psi_azi_R), cos(psi_ver_R)*sin(psi_azi_R), sin(psi_ver_R)];

xi_T_n_t = norm(d_n - d_T_t);
xi_R_n_t = norm(d_n - d_R_t);

alpha_T_n_t = atan((d_n(2) - d_Ty_t)/ (d_n(1) - d_Tx_t));
beta_T_n_t = atan((d_n(3) - d_Tz_t) / sqrt((d_n(1) - d_Tx_t)^2 + (d_n(2) - d_Ty_t)^2));
alpha_R_n_t = atan((d_n(2) - d_Ry_t)/ (d_n(1) - d_Rx_t));
beta_R_n_t = atan((d_n(3) - d_Rz_t) / sqrt((d_n(1) - d_Rx_t)^2 + (d_n(2) - d_Ry_t)^2));

e_T_n_t = [cos(beta_T_n_t)*cos(alpha_T_n_t), cos(beta_T_n_t)*sin(alpha_T_n_t), sin(beta_T_n_t)];
e_R_n_t = [cos(beta_R_n_t)*cos(alpha_R_n_t), cos(beta_R_n_t)*sin(alpha_R_n_t), sin(beta_R_n_t)];

nu_t = dot(V_T*t, e_T_n_t) + dot(V_R*t, e_R_n_t);

theta_azi_T_n_t = delta_T/lambda * cos(beta_T_n_t)*cos(psi_ver_T)*cos(alpha_T_n_t - psi_azi_T);
theta_ver_T_n_t = delta_T/lambda * sin(beta_T_n_t)*sin(psi_ver_T);
theta_azi_R_n_t = delta_R/lambda * cos(beta_R_n_t)*cos(psi_ver_R)*cos(alpha_R_n_t - psi_azi_R);
theta_ver_R_n_t = delta_R/lambda * sin(beta_R_n_t)*sin(psi_ver_R);

end

