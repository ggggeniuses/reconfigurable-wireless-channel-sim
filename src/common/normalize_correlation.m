function y = normalize_correlation(y)
%NORMALIZE_CORRELATION Normalize correlation magnitude to start at one.
if isempty(y)
    return;
end
scale = abs(y(1));
if scale < eps
    scale = max(abs(y));
end
if scale > 0
    y = y ./ scale;
end
end
