new;
library carrionlib;

// Load S&P data
x = loadd(__FILE_DIR $+ "sp.gdat");

// Demean the data
e = x - meanc(x);

// Set our test to run ICSS
test = 0;

// Set cri vector to be any
// 3x1 vector
cri = 0|0|0;

// Run
{ cp, nbre } = icss(e, test, cri);

