new;

// Create a fully pathed file name
fname = getGAUSSHome() $+ "examples/auto2.dta";
 
// Load the data into reg_data
reg_data = loadd(fname, "mpg + weight + factor(rep78)");


