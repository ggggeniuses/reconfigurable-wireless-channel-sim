function [pdf_EAoA] = PDF_truncated_Gaussian_EAoA(EAoA, mu_EAoA, sigma_EAoA)


% derive the pdf of truncated_Gaussian AOA from Standard normal distribution
%%
%  called by function "rho_CCF_NLoS_wave_cluster"
%%


EAoA_up = mu_EAoA + sigma_EAoA;
EAoA_low = mu_EAoA - sigma_EAoA;

f_pdf_temp = (1/sqrt(2*pi*sigma_EAoA^2))*exp(-(EAoA - mu_EAoA)^2 / (2*sigma_EAoA^2) );

% erf(¡¤) Gaussian error function. This expression is used in "Random_cluster.pdf", which is wrong but didnot affect the final results
% f_cdf_temp_up = 0.5*(1 + erf((AoA_up - mu_AoA)/sigma_AoA));
% f_cdf_temp_low = 0.5*(1 + erf((AoA_low - mu_AoA)/sigma_AoA));

%  Update 2020.08.01  
%  erf(¡¤) Gaussian error function  
%  the aforementioned Gausian error function lacks sqrt(2), the following expression updates it. The aforementioned results
%    
f_cdf_temp_up = 0.5*( 1 + erf( (EAoA_up - mu_EAoA)/(sigma_EAoA*sqrt(2)) ) );
f_cdf_temp_low = 0.5*( 1 + erf( (EAoA_low - mu_EAoA)/(sigma_EAoA*sqrt(2)) ) );

pdf_EAoA = f_pdf_temp/(f_cdf_temp_up - f_cdf_temp_low);


end

