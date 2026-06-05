function rho_FCF_RIS_rng_nor = rho_FCF_RIS_GBSM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, eta_azi_R, ...
                                                    t, x_m_sub, y_m_sub, z_m_sub, D_0, H_0, P, Q, p, q, ...
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

            d_m_sub = [x_m_sub, y_m_sub, z_m_sub];


            [xi_T_m_sub_t, xi_R_m_sub_t, nu_t, p_q_term_t] = rho_FCF_RIS_time_GBSM(v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                eta_azi_R, t, d_m_sub, D_0, H_0, P, Q, p, q, lambda_fc, ...
                                                psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);
            
            [xi_T_m_sub_tt, xi_R_m_sub_tt, nu_tt, p_q_term_tt] = rho_FCF_RIS_time_GBSM(v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                eta_azi_R, t, d_m_sub, D_0, H_0, P, Q, p, q, lambda_fcc, ...
                                                psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);


            rho_FCF_VLoS_RIS_same_delta_f_c = rho_FCF_VLoS_RIS_same_delta_f_c + chi_m_sub^2 * exp(j*varphi_m_sud)...
                                        * exp(j*(2*pi)/lambda_fc * nu_t)...
                                        * exp(-j*(2*pi)/lambda_fcc * nu_tt)...
                                        * exp(j*(2*pi)/lambda_fc * (- xi_T_m_sub_t - xi_R_m_sub_t))...
                                        * exp(j*(2*pi)/lambda_fcc * (xi_T_m_sub_tt + xi_R_m_sub_tt))...
                                        * exp(j*(2*pi)/lambda_fc * p_q_term_t)...
                                        * exp(-j*(2*pi)/lambda_fcc * p_q_term_tt);
        end
    end
        rho_FCF_RIS_rng(id_1) = rho_FCF_VLoS_RIS_same_delta_f_c;

        if id_1 == 1
            rho_FCF_RIS_nor = rho_FCF_RIS_rng(id_1);
        end
        rho_FCF_RIS_rng_nor(id_1) = rho_FCF_RIS_rng(id_1)/rho_FCF_RIS_nor;
end   % end the loop for delta_R   

end