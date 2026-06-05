clear variables; close all; clc

Begin_time = datestr(now);
disp('Begin: ');
disp(Begin_time);


j = sqrt(-1);

f_c = 5*1e9;                                  % carrier frequency 
c = 3.0*1e8;                                  % speed of light
% lambda = c/f_c;                               % wavelength

% velocity parameters
v_T = 20;                                       % UAV velocity                             
v_R = 20;                                       % GR velocity
eta_azi_T = pi*1/2;                               % UAV motion direction
eta_ver_T = 0;
eta_azi_R = pi*1/2;                                 % GR motion direction


% antenna
P = 30;                                        % number of transmit antennas, UAV   
Q = 40;
p = 1;
p_p = 1;
q = 1;
q_q = 1;
% delta_T = lambda/2;                           % antenna spacing at UAV 
% delta_R = lambda/2;                           % antenna spacing at GR
% angles of antennas
psi_azi_T = pi/3;
psi_ver_T = pi/4;
psi_azi_R = pi/3;
psi_ver_R = pi/4;


% RIS
x_RIS = 80;                                   % x-axis of RIS
y_RIS = 30;                                   % y-axis of RIS   
z_RIS = 20;                                   % z-axis of RIS
x_m_sub = 80;                                 % O --> m_sub-th sub-array in RIS
y_m_sub = 30;                                     
z_m_sub = 20;                                   
M_x = 20;                                    % number of columns, M_x
M_z = 20;                                    % number of rows, M_z
% d_mx = lambda/4;                              % 沿列方向的单位尺寸
% d_mz = lambda/4;                              % 沿行方向的单位尺寸
chi_m_sub = 1;
varphi_m_sud = 1;


% cluster
L = 20;                                       % number of rays in one cluster
xi_R_n_0 = 200;
% tau_cluster_0 = 2*sqrt(D_0^2 + H_0^2)/c;
mu_AAoA = 2*pi/3;
sigma_AAoA = 10/180*pi;                       % AAoA spread, [rad] 20 degrees, 
mu_EAoA = pi/6;
sigma_EAoA = 5/180*pi;                        % EAoA spread, [rad] 10 degrees


% other reconfigurable parameters setting
H_0 = 0;
D_0 = 100;
K = 1;                                    % Rice factor
t = 2;
tt = 0;

    
%%

delta_f_c = 0 : 0.15 : 30;

rho_FCF_NLoS_cluster_GBSM = rho_FCF_cluster_GBSM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, ...
                                                    eta_azi_R, t, xi_R_n_0, D_0, H_0, P, Q, p, q, ...
                                                    mu_AAoA, sigma_AAoA, mu_EAoA, sigma_EAoA, ...
                                                    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);

rho_FCF_VLoS_RIS_GBSM = rho_FCF_RIS_GBSM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, eta_azi_R, ...
                                                    t, x_m_sub, y_m_sub, z_m_sub, D_0, H_0, P, Q, p, q, ...
                                                    psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, chi_m_sub, varphi_m_sud);

rho_FCF_cluster_RIS_GBSM = (1)/(K+1)*rho_FCF_NLoS_cluster_GBSM + (K)/(K+1)*rho_FCF_VLoS_RIS_GBSM;


% rho_FCF_NLoS_cluster_BDCM = rho_FCF_cluster_BDCM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, ...
%                                                     eta_azi_R, t, xi_R_n_0, D_0, H_0, P, Q, p, q, p_p, q_q, ...
%                                                     mu_AAoA, sigma_AAoA, mu_EAoA, sigma_EAoA, ...
%                                                     psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R);
% 
% rho_FCF_VLoS_RIS_BDCM = rho_FCF_RIS_BDCM(j, c, f_c, delta_f_c, v_T, v_R, eta_ver_T, eta_azi_T, eta_azi_R, ...
%                                                     t, x_m_sub, y_m_sub, z_m_sub, D_0, H_0, P, Q, p, q, p_p, q_q, ...
%                                                     psi_ver_T, psi_azi_T, psi_ver_R, psi_azi_R, chi_m_sub, varphi_m_sud);
% 
% rho_FCF_cluster_RIS_BDCM = (1)/(K+1)*rho_FCF_NLoS_cluster_BDCM + (K)/(K+1)*rho_FCF_VLoS_RIS_BDCM;




plot(delta_f_c, abs(rho_FCF_NLoS_cluster_GBSM), 'k-+', 'LineWidth', 1.25, 'MarkerSize', 6, 'MarkerEdgeColor', 'k', 'MarkerIndices', [1:1:floor(0.5*length(delta_f_c)),  floor(0.5*length(delta_f_c))+1 : 4 : length(delta_f_c) ]);
hold on
% plot(delta_f_c, abs(rho_FCF_NLoS_cluster_BDCM), 'k-d', 'LineWidth', 1.25, 'MarkerSize', 6, 'MarkerEdgeColor', 'k', 'MarkerIndices', [1:1:floor(0.5*length(delta_f_c)),  floor(0.5*length(delta_f_c))+1 : 4 : length(delta_f_c) ]);
% hold on
plot(delta_f_c, abs(rho_FCF_VLoS_RIS_GBSM), 'b-', 'LineWidth', 1.25, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerIndices', [1:1:floor(0.5*length(delta_f_c)),  floor(0.5*length(delta_f_c))+1 : 4 : length(delta_f_c) ]);
hold on
% plot(delta_f_c, abs(rho_FCF_VLoS_RIS_BDCM), 'b--*', 'LineWidth', 1.25, 'MarkerSize', 6, 'MarkerEdgeColor', 'b', 'MarkerIndices', [1:1:floor(0.5*length(delta_f_c)),  floor(0.5*length(delta_f_c))+1 : 4 : length(delta_f_c) ]);
% hold on
plot(delta_f_c, abs(rho_FCF_cluster_RIS_GBSM), 'm--', 'LineWidth', 1.25, 'MarkerSize', 6, 'MarkerEdgeColor', 'm', 'MarkerIndices', [1:1:floor(0.5*length(delta_f_c)),  floor(0.5*length(delta_f_c))+1 : 4 : length(delta_f_c) ]);
hold on
% plot(delta_f_c, abs(rho_FCF_cluster_RIS_BDCM), 'm--o', 'LineWidth', 1.25, 'MarkerSize', 6, 'MarkerEdgeColor', 'm', 'MarkerIndices', [1:1:floor(0.5*length(delta_f_c)),  floor(0.5*length(delta_f_c))+1 : 4 : length(delta_f_c) ]);
% hold on



axis([0 10 0 1])
xlab = xlabel('');
set(xlab, 'Interpreter', 'latex', 'string',{'Frequency difference, $\Delta f$, [MHz]'}, 'Fontsize', 12);
ylab = ylabel('');
set(ylab, 'Interpreter', 'latex', 'string',{'Normalized FCFs'}, 'Fontsize', 12);
grid on
legend('Interpreter', 'latex', 'string', {'NLoS, GBSM', 'NLoS, BDCM', 'VLoS, GBSM', 'VLoS, BDCM', 'NLoS + VLoS, GBSM', 'NLoS + VLoS, BDCM'}, 'Fontsize', 10);



