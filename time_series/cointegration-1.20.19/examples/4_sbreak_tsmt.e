/*
** This file accompanies the 1/18/2019 Aptech blog
** "How to Conduct Cointegration Tests in GAUSS 
**  It should be used to date potential structural
**  breaks using the Bai and Perron sequential dating 
**  methodology.
*/
new;
cls;
library tsmt;

// Set filename (with path) for loading
fname = __FILE_DIR $+ "tscoint.dat";

// Load data
data = loadd(fname);
y = data[., 1 4];

// Test first variable for structural breaks
// Load all observations from the dataset
y1 = y[., 1];
y2 = y[., 2];

// Specify regressors
// Time varying coefficients in z
// This vector of ones specifies a

z = ones(rows(y), 1);
 
// No time invariant regressors
x = 0;

// Declare sbControl structure
// and fill with default settings
struct sbControl sbc0;
sbc0 = sbControlCreate();
 
// Number of regressors subject to change
sbc0.q = 1;
 
// Number of structural changes
sbc0.m = 5;
 
// Trimming percentage
sbc0.trim = 0.15;
 
// Minimum length of segment (h > p + q)
sbc0.h = 0;
 
// Print iteration output
sbc0.printOutput = 1;
 
// Maximum number of iterations
sbc0.maxIters = 40;
 
// Turn on graphing capability
sbc0.graphOn = 1;
 
// Start Date
sbc0.dtstart = dtdate(1961, 01, 01, 0, 00, 00);
 
// Annual frequency of data
sbc0.frequency = 4;

//Declare output structure
struct sbOut out1;
 
//Estimate model
out1 = sbreak(y1, z, x, sbc0);

plotOpenWindow();
//Declare output structure
struct sbOut out2;
 
//Estimate model
out2 = sbreak(y2, z, x, sbc0);
