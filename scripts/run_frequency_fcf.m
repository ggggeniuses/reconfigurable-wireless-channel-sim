projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(genpath(fullfile(projectRoot, 'src')));
addpath(vendor_stf_cf_path('FCF'));

cfg = default_ris_v2v_config();
ensure_output_dirs(cfg);

j = sqrt(-1);
f_c = 5e9;
c = 3e8;
v_T = 20;
v_R = 20;
eta_azi_T = pi/2;
eta_ver_T = 0;
eta_azi_R = pi/2;

P = 30;
Q = 40;
p = 1;
p_p = 1;
q = 1;
q_q = 1;
psi_azi_T = pi/3;
psi_ver_T = pi/4;
psi_azi_R = pi/3;
psi_ver_R = pi/4;

x_m_sub = 80;
y_m_sub = 30;
z_m_sub = 20;
chi_m_sub = 1;
varphi_m_sud = 1;

xi_R_n_0 = 200;
mu_AAoA = 2*pi/3;
sigma_AAoA = 10/180*pi;
mu_EAoA = pi/6;
sigma_EAoA = 5/180*pi;

H_0 = 0;
D_0 = 100;
K = 1;
t = 2;
delta_f_c = 0:0.15:30;

rho_FCF_NLoS_cluster_GBSM = rho_FCF_cluster_GBSM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, ...
    eta_azi_R, t, xi_R_n_0, D_0, H_0, P, Q, p, q, ...
    mu_AAoA, sigma_AAoA, mu_EAoA, sigma_EAoA, ...
    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);

rho_FCF_VLoS_RIS_GBSM = rho_FCF_RIS_GBSM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, eta_azi_R, ...
    t, x_m_sub, y_m_sub, z_m_sub, D_0, H_0, P, Q, p, q, ...
    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, chi_m_sub, varphi_m_sud);

rho_FCF_cluster_RIS_GBSM = (1)/(K+1)*rho_FCF_NLoS_cluster_GBSM + (K)/(K+1)*rho_FCF_VLoS_RIS_GBSM;

% The original Frequency_FCF.m comments out BDCM plotting, but the original
% BDCM rho-functions are present. This wrapper computes them to keep the same
% six-curve comparison used by CCF/ACF.
rho_FCF_NLoS_cluster_BDCM = rho_FCF_cluster_BDCM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, ...
    eta_azi_R, t, xi_R_n_0, D_0, H_0, P, Q, p, q, p_p, q_q, ...
    mu_AAoA, sigma_AAoA, mu_EAoA, sigma_EAoA, ...
    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);

rho_FCF_VLoS_RIS_BDCM = rho_FCF_RIS_BDCM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, eta_azi_R, ...
    t, x_m_sub, y_m_sub, z_m_sub, D_0, H_0, P, Q, p, q, p_p, q_q, ...
    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, chi_m_sub, varphi_m_sud);

rho_FCF_cluster_RIS_BDCM = (1)/(K+1)*rho_FCF_NLoS_cluster_BDCM + (K)/(K+1)*rho_FCF_VLoS_RIS_BDCM;

fig = figure('Color', 'w', 'Position', [100, 100, 760, 560]); hold on;
plot(delta_f_c, abs(rho_FCF_NLoS_cluster_GBSM), 'k-+', 'LineWidth', 1.25, 'MarkerSize', 6);
plot(delta_f_c, abs(rho_FCF_NLoS_cluster_BDCM), 'k-d', 'LineWidth', 1.25, 'MarkerSize', 6);
plot(delta_f_c, abs(rho_FCF_VLoS_RIS_GBSM), 'b-', 'LineWidth', 1.25);
plot(delta_f_c, abs(rho_FCF_VLoS_RIS_BDCM), 'b-*', 'LineWidth', 1.25, 'MarkerSize', 6);
plot(delta_f_c, abs(rho_FCF_cluster_RIS_GBSM), 'm--', 'LineWidth', 1.25);
plot(delta_f_c, abs(rho_FCF_cluster_RIS_BDCM), 'm--o', 'LineWidth', 1.25, 'MarkerSize', 6);
axis([0 10 0 1]);
xlabel('Frequency difference, $\Delta f$, [MHz]', 'Interpreter', 'latex');
ylabel('Normalized FCFs', 'Interpreter', 'latex');
title('Strict frequency FCF reproduction from original STF-CF functions');
legend({'NLoS, GBSM', 'NLoS, BDCM', 'VLoS, GBSM', 'VLoS, BDCM', ...
    'NLoS + VLoS, GBSM', 'NLoS + VLoS, BDCM'}, 'Interpreter', 'latex', 'FontSize', 10);
apply_plot_style(gca);

result = struct('axis', delta_f_c, ...
    'nlos_gbsm', abs(rho_FCF_NLoS_cluster_GBSM), ...
    'nlos_bdcm', abs(rho_FCF_NLoS_cluster_BDCM), ...
    'vlos_gbsm', abs(rho_FCF_VLoS_RIS_GBSM), ...
    'vlos_bdcm', abs(rho_FCF_VLoS_RIS_BDCM), ...
    'combined_gbsm', abs(rho_FCF_cluster_RIS_GBSM), ...
    'combined_bdcm', abs(rho_FCF_cluster_RIS_BDCM));
data = struct('cfg', cfg, 'result', result, 'source', 'vendor/original_stf_cf/FCF/FCF_GBSM_BDCM', ...
    'note', 'Original Frequency_FCF.m comments out BDCM plots; this wrapper uses original BDCM rho-functions.');
save_experiment_outputs(fig, cfg, 'frequency_fcf_gbsm_bdcm_strict', data);
