projectRoot = fileparts(fileparts(mfilename('fullpath')));
addpath(genpath(fullfile(projectRoot, 'src')));

cfg = default_ris_v2v_config();
requiredData = { ...
    'spatial_ccf_gbsm_bdcm_strict.mat', ...
    'temporal_acf_gbsm_bdcm_strict.mat', ...
    'frequency_fcf_gbsm_bdcm_strict.mat', ...
    'ris_parameter_sweep_temporal_acf_extension.mat', ...
    'ris_spacing_sweep_temporal_acf_extension.mat', ...
    'motion_state_sweep_temporal_acf_extension.mat'};

fprintf('\nRunning smoke checks...\n');
for k = 1:numel(requiredData)
    matPath = fullfile(cfg.output.dataDir, requiredData{k});
    if ~exist(matPath, 'file')
        error('Missing expected data output: %s', matPath);
    end
    s = load(matPath);
    if isfield(s, 'result')
        assert_result_struct(s.result, requiredData{k});
    elseif isfield(s, 'curves')
        if isempty(s.curves) || any(~isfinite(s.curves(:)))
            error('Invalid extension curves in %s', requiredData{k});
        end
    else
        error('Unexpected output shape in %s', requiredData{k});
    end
end
fprintf('Smoke checks passed.\n');

function assert_result_struct(result, label)
fields = {'nlos_gbsm', 'nlos_bdcm', 'vlos_gbsm', 'vlos_bdcm', 'combined_gbsm', 'combined_bdcm'};
for i = 1:numel(fields)
    if ~isfield(result, fields{i})
        error('%s missing field %s', label, fields{i});
    end
    values = result.(fields{i});
    if isempty(values) || any(~isfinite(values(:)))
        error('%s field %s is empty or invalid', label, fields{i});
    end
end
end
