function p = vendor_stf_cf_path(kind)
%VENDOR_STF_CF_PATH Path to the imported original STF-CF code.
root = project_root();
switch upper(kind)
    case 'CCF'
        p = fullfile(root, 'vendor', 'original_stf_cf', 'CCF', 'CCF_GBSM_BDCM');
    case 'ACF'
        p = fullfile(root, 'vendor', 'original_stf_cf', 'ACF', 'ACF_GBSM_BDCM');
    case 'FCF'
        p = fullfile(root, 'vendor', 'original_stf_cf', 'FCF', 'FCF_GBSM_BDCM');
    otherwise
        error('Unknown STF-CF kind: %s', kind);
end
end
