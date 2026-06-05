function assert_no_invalid_values(result, label)
%ASSERT_NO_INVALID_VALUES Lightweight smoke checks for experiment outputs.
fields = {'nlos_gbsm', 'nlos_bdcm', 'vlos_gbsm', 'vlos_bdcm', 'combined_gbsm', 'combined_bdcm'};
for k = 1:numel(fields)
    value = result.(fields{k});
    if isempty(value)
        error('%s: %s is empty.', label, fields{k});
    end
    if any(~isfinite(value(:)))
        error('%s: %s contains NaN or Inf.', label, fields{k});
    end
    if min(value(:)) < -1e-9 || max(value(:)) > 1 + 1e-9
        error('%s: %s is outside [0, 1].', label, fields{k});
    end
end
end
