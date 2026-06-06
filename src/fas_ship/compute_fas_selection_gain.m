function result = compute_fas_selection_gain(cfg)
%COMPUTE_FAS_SELECTION_GAIN Evaluate best-port capacity versus port count.
H = generate_correlated_fas_channel(cfg, cfg.Q_total, cfg.num_realizations);
snrLinear = 10 ^ (cfg.snr_db / 10);
capacityMean = zeros(size(cfg.Qsub_list));
selectedPowerMean = zeros(size(cfg.Qsub_list));

for k = 1:numel(cfg.Qsub_list)
    Qsub = cfg.Qsub_list(k);
    selectedPower = max(abs(H(:, 1:Qsub)) .^ 2, [], 2);
    selectedPowerMean(k) = mean(selectedPower);
    capacityMean(k) = mean(log2(1 + snrLinear * selectedPower));
end

result.Qsub_list = cfg.Qsub_list;
result.capacity_mean = capacityMean;
result.capacity_gain = capacityMean - capacityMean(1);
result.selection_gain_db = 10 * log10(selectedPowerMean / selectedPowerMean(1));
result.snr_db = cfg.snr_db;
assert_numeric_finite(capacityMean, 'FAS selection capacity');
end
