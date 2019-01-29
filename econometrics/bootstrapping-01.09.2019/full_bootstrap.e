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
 
// The number of boostrap iterations to perform
n_iters = 10000;

// Create a vector to hold the bootstrap results
results = zeros(n_iters, 1);
 
for i(1, n_iters, 1);
 
    // Take a sample with replacement
    X_s = sampleData(X, rows(X), 1);
 
    // Compute the returns of each asset
    returns = prodc(X_s);
 
    /*
    ** Average the two returns to find the return
    ** of a portfolio split equally between each asset.
    ** Store the total return in the 'results' vector.
    */
    results[i] = meanc(returns);
 
endfor;
