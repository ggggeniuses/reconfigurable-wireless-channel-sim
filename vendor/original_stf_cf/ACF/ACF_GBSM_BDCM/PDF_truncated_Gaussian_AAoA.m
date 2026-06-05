function [pdf_AAoA] = PDF_truncated_Gaussian_AAoA(AAoA, mu_AAoA, sigma_AAoA)


% derive the pdf of truncated_Gaussian AOA from Standard normal distribution
%%
%  called by function "rho_CCF_NLoS_wave_cluster"
%%


AAoA_up = mu_AAoA + sigma_AAoA;
AAoA_low = mu_AAoA - sigma_AAoA;

f_pdf_temp = (1/sqrt(2*pi*sigma_AAoA^2))*exp(-(AAoA - mu_AAoA)^2 / (2*sigma_AAoA^2) );

% erf(¡¤) Gaussian error function. This expression is used in "Random_cluster.pdf", which is wrong but didnot affect the final results
% f_cdf_temp_up = 0.5*(1 + erf((AoA_up - mu_AoA)/sigma_AoA));
% f_cdf_temp_low = 0.5*(1 + erf((AoA_low - mu_AoA)/sigma_AoA));


%  Update 2020.08.01  
%  erf(¡¤) Gaussian error function  
%  the aforementioned Gausian error function lacks sqrt(2), the following expression updates it. The aforementioned results
%                                                                                   are normalized thus the results are not affected
f_cdf_temp_up = 0.5*(1 + erf((AAoA_up - mu_AAoA)/(sigma_AAoA*sqrt(2))));
f_cdf_temp_low = 0.5*(1 + erf((AAoA_low - mu_AAoA)/(sigma_AAoA*sqrt(2))));

pdf_AAoA = f_pdf_temp/(f_cdf_temp_up - f_cdf_temp_low);


end

