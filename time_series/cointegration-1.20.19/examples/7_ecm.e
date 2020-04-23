/*
** This file accompanies the 1/18/2019 Aptech blog
** "How to Conduct Cointegration Tests in GAUSS
**  It should be used to conduct cointegration
**  testing for models with structural breaks.
*/

new;
cls;

// Load tsmt library
library tsmt, tspdlib;

// Set filename (with path) for loading
fname2 = __FILE_DIR $+ "commodity_mon.dat";

// Load real prices data
y_test_real = loadd(fname2, "P_gold_real + P_silver_real");

// First difference the data
// Difference the data
y_test_diff = vmdiffmt(y_test_real, 1);

lags = 2;

// Declare output structure to hold estimation
// results and call 'ecmFit'
struct varmamtOut vout;
vout = ecmFit(y_test_diff, lags);
