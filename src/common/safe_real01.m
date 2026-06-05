function y = safe_real01(x)
%SAFE_REAL01 Convert a complex correlation sequence to finite [0, 1] values.
y = abs(x);
y(~isfinite(y)) = 0;
y = min(max(real(y), 0), 1);
end
