new;

// Create a fully pathed file name
fname = getGAUSSHome() $+ "examples/yarn.xlsx";
 
// Reclassify 'load' variable from 'high, med, low' to '0, 1, 2',
// then create dummy variables from integer categories and create OLS estimates
call olsmt(fname, "cycles ~ factor(cat(load))");
