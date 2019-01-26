// Number of observations to simulate
nobs = 5;
 
// Constant initial value
C = 1;
 
// AR parameter
rho = 0.3;
 
// Set random seed for repeatable random numbers
rndseed 5423;
 
// Create error term
epsilon = rndn(nobs+1, 1);
 
// Simulate the AR(1) process
y_vec = recserar(epsilon, C, rho);
