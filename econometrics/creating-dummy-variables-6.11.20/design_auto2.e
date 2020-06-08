new;

// Create a fully pathed file name
fname = getGAUSSHome() $+ "examples/auto2.dta";

// Load auto data for regression
reg_data = packr(loadd(fname, "mpg + weight + rep78"));

dummy_vars = design(reg_data[.,3]);

y = reg_data[., 1];
x = reg_data[., 2]~dummy_vars[., 2:5];

call ols("", y, x);
