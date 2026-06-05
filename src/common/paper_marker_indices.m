function idx = paper_marker_indices(x)
%PAPER_MARKER_INDICES Marker placement matching the original STF-CF scripts.
n = numel(x);
if n <= 0
    idx = [];
elseif n <= 70
    idx = [1:1:floor(0.5*n), floor(0.5*n)+1:4:n];
else
    idx = [1:2:floor(0.5*n), floor(0.5*n)+1:6:n];
end
idx = unique(max(1, min(n, idx)));
end
