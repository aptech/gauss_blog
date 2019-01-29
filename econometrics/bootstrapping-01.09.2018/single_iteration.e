/*
**  This code accompanies the blog
**  "Basic Bootstrapping in GAUSS"
**  published on 01/09/2018 
**  on the Aptech blog.
*/

// Set seed for repeatable random numbers
rndseed 12577;
 
// Load all 30 observations for both assets
X = loadd("asset_returns.csv", "S&P500 + 10yrTBond"); 
 
// Take a sample with replacement
X_s = sampleData(X, rows(X), 1);

// Compute the returns of each asset
returns = prodc(X_s);

/* 
** Average the two returns to find the return
** of a portfolio split equally between each asset
*/
total_return = meanc(returns);
