function apply_plot_style(ax)
%APPLY_PLOT_STYLE Shared publication-style axes formatting.
if nargin < 1 || isempty(ax)
    ax = gca;
end
grid(ax, 'on');
box(ax, 'on');
set(ax, 'FontName', 'Times New Roman', 'FontSize', 11, 'LineWidth', 0.8);
end
