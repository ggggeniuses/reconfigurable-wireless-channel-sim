function fig = plot_correlation_result(result, xLabelText, yLabelText, titleText, xLimits)
%PLOT_CORRELATION_RESULT Plot NLoS/VLoS/combined GBSM and BDCM curves.
fig = figure('Color', 'w', 'Position', [100, 100, 760, 560]);
hold on;

plot(result.axis, result.nlos_gbsm, 'k-+', 'LineWidth', 1.25, 'MarkerSize', 5, 'DisplayName', 'NLoS, GBSM');
plot(result.axis, result.nlos_bdcm, 'k-d', 'LineWidth', 1.25, 'MarkerSize', 5, 'DisplayName', 'NLoS, BDCM');
plot(result.axis, result.vlos_gbsm, 'b-', 'LineWidth', 1.35, 'DisplayName', 'VLoS, GBSM');
plot(result.axis, result.vlos_bdcm, 'b-*', 'LineWidth', 1.25, 'MarkerSize', 5, 'DisplayName', 'VLoS, BDCM');
plot(result.axis, result.combined_gbsm, 'm--', 'LineWidth', 1.45, 'DisplayName', 'NLoS + VLoS, GBSM');
plot(result.axis, result.combined_bdcm, 'm--o', 'LineWidth', 1.25, 'MarkerSize', 5, 'DisplayName', 'NLoS + VLoS, BDCM');

xlabel(xLabelText, 'Interpreter', 'latex');
ylabel(yLabelText, 'Interpreter', 'latex');
title(titleText, 'Interpreter', 'none');
if nargin >= 5 && ~isempty(xLimits)
    xlim(xLimits);
end
ylim([0, 1.03]);
legend('Location', 'northeast', 'Interpreter', 'latex', 'FontSize', 9);
apply_plot_style(gca);
end
