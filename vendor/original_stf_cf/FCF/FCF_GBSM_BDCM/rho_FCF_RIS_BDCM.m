function rho_FCF_RIS_rng_nor = rho_FCF_RIS_BDCM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, eta_azi_R, ...
                                                    t, x_m_sub, y_m_sub, z_m_sub, D_0, H_0, P, Q, p, q, p_p, q_q, ...
                                                    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, chi_m_sub, varphi_m_sud)
M_x = 30;
M_z = 30;
rho_FCF_RIS_rng = zeros(1, length(delta_f_c));
rho_FCF_RIS_rng_nor = zeros(1, length(delta_f_c));
for id_1 = 1 : length(delta_f_c)   

    f_cc = f_c + delta_f_c(id_1) * 10^6;
    lambda_fc = c/f_c;
    lambda_fcc = c/f_cc;

    rho_FCF_VLoS_RIS_same_delta_f_c = 0;
    for mx = 1 : 1 : M_x
        for mz = 1 : 1 : M_z
%             x_mxmz = X_RIS - (M_x/2 - mx + 0.5)*d_mx;       % (m_x,m_z)坐标
%             y_mxmz = Y_RIS;
%             z_mxmz = Z_RIS - (M_z/2 - mz + 0.5)*d_mz;

            d_m_sub = [x_m_sub, y_m_sub, z_m_sub];

            theta_p = (2*p-1)/(2*P) - 0.5;
            theta_q = (2*q-1)/(2*Q) - 0.5;
            theta_p_p = (2*p_p-1)/(2*P) - 0.5;
            theta_q_q = (2*q_q-1)/(2*Q) - 0.5;

            [xi_T_m_sub_t, xi_R_m_sub_t, nu_t, theta_T_ver_mxmz_t, theta_T_azi_mxmz_t, theta_R_ver_mxmz_t, theta_R_azi_mxmz_t] = rho_FCF_RIS_time_BDCM(v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                eta_azi_R, t, d_m_sub, D_0, H_0, P, Q, p, q, ...
                                                psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, lambda_fc);
            
            [xi_T_m_sub_tt, xi_R_m_sub_tt, nu_tt, theta_T_ver_mxmz_tt, theta_T_azi_mxmz_tt, theta_R_ver_mxmz_tt, theta_R_azi_mxmz_tt] = rho_FCF_RIS_time_BDCM(v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                eta_azi_R, t, d_m_sub, D_0, H_0, P, Q, p_p, q_q, ...
                                                psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, lambda_fcc);

            sum_p_P = 0;
            sum_q_Q = 0;    
            sum_p_p_P = 0;
            sum_q_q_Q = 0;
            for x = 1 : 1 : P
                sum_p_P = sum_p_P + exp(j*pi * (P-2*x+1)*(theta_T_ver_mxmz_t + theta_T_azi_mxmz_t - theta_p));
            end
            for y = 1 : 1 : Q
                sum_q_Q = sum_q_Q + exp(j*pi * (Q-2*y+1)*(theta_R_ver_mxmz_t + theta_R_azi_mxmz_t - theta_q));
            end
            for x = 1 : 1 : P
                sum_p_p_P = sum_p_p_P + exp(-j*pi * (P-2*x+1)*(theta_T_ver_mxmz_tt + theta_T_azi_mxmz_tt - theta_p_p));
            end
            for y = 1 : 1 : Q
                sum_q_q_Q = sum_q_q_Q + exp(-j*pi * (Q-2*y+1)*(theta_R_ver_mxmz_tt + theta_R_azi_mxmz_tt - theta_q_q));
            end

            rho_FCF_VLoS_RIS_same_delta_f_c = rho_FCF_VLoS_RIS_same_delta_f_c + chi_m_sub^2 * exp(j*varphi_m_sud)...
                                        * exp(j*(2*pi)/lambda_fc * nu_t)...
                                        * exp(-j*(2*pi)/lambda_fcc * nu_tt)...
                                        * exp(j*(2*pi)/lambda_fc * (- xi_T_m_sub_t - xi_R_m_sub_t))...
                                        * exp(j*(2*pi)/lambda_fcc * (xi_T_m_sub_tt + xi_R_m_sub_tt))...
                                        * sum_p_P * sum_q_Q * sum_p_p_P * sum_q_q_Q;
        end
    end
        rho_FCF_RIS_rng(id_1) = rho_FCF_VLoS_RIS_same_delta_f_c;

        if id_1 == 1
            rho_FCF_RIS_nor = rho_FCF_RIS_rng(id_1);
        end
        rho_FCF_RIS_rng_nor(id_1) = rho_FCF_RIS_rng(id_1)/rho_FCF_RIS_nor;
end   % end the loop for delta_R   

end