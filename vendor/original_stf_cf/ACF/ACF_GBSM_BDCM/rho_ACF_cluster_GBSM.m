function rho_ACF_NLoS_cluster_rng_nor = rho_ACF_cluster_GBSM(j, lambda, v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                    eta_azi_R, t, delta_t, xi_R_n_0, D_0, H_0, P, Q, p, q, p_p, q_q,  ...
                                                    delta_T, delta_R, mu_AAoA, sigma_AAoA, mu_EAoA, sigma_EAoA, ...
                                                    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R)

% AAoA
AAoA_step = pi/360;
AAoA_low = mu_AAoA - sigma_AAoA;
AAoA_up = mu_AAoA + sigma_AAoA;
% EAoA
EAoA_step = pi/360;                          
EAoA_low = mu_EAoA - sigma_EAoA;
EAoA_up = mu_EAoA + sigma_EAoA;

rho_ACF_NLoS_cluster_rng = zeros(1, length(delta_t));
rho_ACF_NLoS_cluster_rng_nor = zeros(1, length(delta_t));
for id_1 = 1 : length(delta_t)   

    tt = delta_t(id_1);
    rho_ACF_NLoS_cluster_same_delta_t = 0;
    Angle_PDF = 0;
    for alpha_R_n = AAoA_low : AAoA_step : AAoA_up             % sum with AAoA
        for beta_R_n = EAoA_low : EAoA_step : EAoA_up          % sum with EAoA
            
            % Call the function to claculate the PDF value
            pdf_AAoA = PDF_truncated_Gaussian_AAoA(alpha_R_n, mu_AAoA, sigma_AAoA);
            pdf_EAoA = PDF_truncated_Gaussian_EAoA(beta_R_n, mu_EAoA, sigma_EAoA);
            pdf_AAoA_EAoA = pdf_AAoA*pdf_EAoA;                 % joint PDF, assume AAoA and EAoA are independent 
            
            x_n = D_0-xi_R_n_0*cos(beta_R_n)*cos(alpha_R_n);
            y_n = xi_R_n_0*cos(beta_R_n)*sin(alpha_R_n);
            z_n = xi_R_n_0*sin(beta_R_n);
            d_n = [x_n, y_n, z_n];
            
            [xi_T_n_t, xi_R_n_t, nu_t, p_q_term_t] = rho_ACF_cluster_time_GBSM(v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                    eta_azi_R, t, d_n, D_0, H_0, P, Q, p, q, delta_T, delta_R, ...
                                                    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);
            
            [xi_T_n_tt, xi_R_n_tt, nu_tt, p_q_term_tt] = rho_ACF_cluster_time_GBSM(v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                    eta_azi_R, t+tt, d_n, D_0, H_0, P, Q, p_p, q_q, delta_T, delta_R, ...
                                                    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);
            
                        
            
            rho_ACF_NLoS_cluster_same_delta_t = rho_ACF_NLoS_cluster_same_delta_t ...
                                                   + exp(j*(2*pi)/lambda * (nu_t - nu_tt))...
                                                   * exp(j*(2*pi)/lambda * (xi_T_n_tt + xi_R_n_tt - xi_T_n_t - xi_R_n_t)) ...
                                                   * exp(j*(2*pi)/lambda * (p_q_term_t - p_q_term_tt)) ...
                                                   *pdf_AAoA_EAoA*AAoA_step*EAoA_step;
            Angle_PDF = Angle_PDF + 1*pdf_AAoA_EAoA*AAoA_step*EAoA_step;

        end  % end the loop for EAoA
        
    end  % end the loop for AAoA
    rho_ACF_NLoS_cluster_rng(id_1) = rho_ACF_NLoS_cluster_same_delta_t/Angle_PDF;
    if id_1 == 1         % used for normalization
        rho_ACF_NLoS_nor = rho_ACF_NLoS_cluster_rng(id_1);
    end
    rho_ACF_NLoS_cluster_rng_nor(id_1) = rho_ACF_NLoS_cluster_rng(id_1)/rho_ACF_NLoS_nor;
end   % end the loop for delta_R

end

