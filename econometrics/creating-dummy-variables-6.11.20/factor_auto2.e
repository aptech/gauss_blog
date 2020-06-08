new;

// Create a fully pathed file name
fname = getGAUSSHome() $+ "examples/auto2.dta";

// Perform OLS estimation, creating dummy variables from 'rep78'
call ols(fname, "mpg ~ weight + factor(rep78)");
