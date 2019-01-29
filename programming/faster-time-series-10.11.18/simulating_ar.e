/*
**  This code accompanies the blog
**  "Make your time series computations
**  up to 20 times faster"
**  published on 10/11/2018 
**  on the Aptech blog.
*/
// Number of observations to simulate
nobs = 5;
 
// Constant initial value
C = 1;
 
// AR parameter
rho = 0.3;
 
// Set random seed for repeatable random numbers
rndseed 5423;
 
// Pre-allocate vector for the output 'y'
y = C | zeros(nobs, 1);
 
// Create error term
epsilon = rndn(rows(y), 1);
 
// Simulate the AR(1) process
for t(2, nobs + 1, 1);
    y[t] = y[t-1] * rho + epsilon[t];
endfor;
