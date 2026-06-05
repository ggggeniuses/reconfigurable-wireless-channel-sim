function rho_ACF_RIS_on_UAV_optimal_rng_nor = rho_ACF_RIS_GBSM(j, lambda, v_T, v_R, eta_ver_T, eta_azi_T, eta_azi_R, delta_T,...
                                                    delta_R, t, delta_t, x_m_sub, y_m_sub, z_m_sub, D_0, H_0, P, Q, p, q, p_p, q_q, ...
                                                    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, chi_m_sub, varphi_m_sud)
M_x = 30;
M_z = 30;
rho_ACF_RIS_on_UAV_optimal_rng = zeros(1, length(delta_t));
rho_ACF_RIS_on_UAV_optimal_rng_nor = zeros(1, length(delta_t));
for id_1 = 1 : length(delta_t)   
    
    tt = delta_t(id_1);
    rho_ACF_VLoS_RIS_same_delta_t = 0;
    for mx = 1 : 1 : M_x
        for mz = 1 : 1 : M_z
%             x_mxmz = X_RIS - (M_x/2 - mx + 0.5)*d_mx;       % (m_x,m_z)坐标
%             y_mxmz = Y_RIS;
%             z_mxmz = Z_RIS - (M_z/2 - mz + 0.5)*d_mz;

            d_m_sub = [x_m_sub, y_m_sub, z_m_sub];


            [xi_T_m_sub_t, xi_R_m_sub_t, nu_t, p_q_term_t] = rho_ACF_RIS_time_GBSM(v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                eta_azi_R, t, d_m_sub, D_0, H_0, P, Q, p, q, delta_T, delta_R, ...
                                                psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);
            
            [xi_T_m_sub_tt, xi_R_m_sub_tt, nu_tt, p_q_term_tt] = rho_ACF_RIS_time_GBSM(v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                eta_azi_R, t+tt, d_m_sub, D_0, H_0, P, Q, p_p, q_q, delta_T, delta_R, ...
                                                psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);


            rho_ACF_VLoS_RIS_same_delta_t = rho_ACF_VLoS_RIS_same_delta_t + chi_m_sub^2 * exp(j*varphi_m_sud)...
                                        * exp(j*(2*pi)/lambda * (nu_t - nu_tt))...
                                        * exp(j*(2*pi)/lambda * (xi_T_m_sub_tt + xi_R_m_sub_tt - xi_T_m_sub_t - xi_R_m_sub_t))...
                                        * exp(j*(2*pi)/lambda * (p_q_term_t - p_q_term_tt));
        end
    end
        rho_ACF_RIS_on_UAV_optimal_rng(id_1) = rho_ACF_VLoS_RIS_same_delta_t;

        if id_1 == 1
            rho_ACF_RIS_nor = rho_ACF_RIS_on_UAV_optimal_rng(id_1);
        end
        rho_ACF_RIS_on_UAV_optimal_rng_nor(id_1) = rho_ACF_RIS_on_UAV_optimal_rng(id_1)/rho_ACF_RIS_nor;
end   % end the loop for delta_R   

end