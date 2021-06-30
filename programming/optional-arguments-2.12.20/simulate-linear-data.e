/*
** Practical application of 
** of optional arguments - simulating linear data
** 
** It accompanies the blog
** "The Basics of Optional Arguments 
**  in GAUSS Procedures"
**
**  Published 2/12/2020
*/

b = { 0.8, -1.1, 0.2 };
n = 10;
 
/*
** Simulate linear model:
**     - Without intercept
**     - With error term sd equal to 1
*/
y_1 = simulateLM(b, n);
 
/*
** Simulate linear model:
**     - With intercept
**     - With error term sd equal to 1
*/
alpha = 2.3;
y_2 = simulateLM(b, n, alpha);
 
/*
** Simulate linear model:
**     - With intercept
**     - With error term sd equal to 3
*/
alpha = 2.3;
err_sd = 3;
y_3 = simulateLM(b, n, alpha, err_sd);

/*
** Inputs: r  - Required input. Number of rows.
**         c  - Required input. Number of columns.
**         mu - Optional input. Mean of the simulated columns.
**              Default = 0.
**         sd - Optional input. Standard deviation of the 
**              simulated columns. Default = 1.
*/
proc (1) = rndNormal(r, c, ...);
    local X, mean, sd;
 
    // If a 3rd input is passed in, assign it
    // to ‘mean’. Otherwise set ‘mean’ equal to 0.
    // If a 4th input is passed in, assign it
    // to `sd`. Otherwise set ‘sd’ equal to 1.
    { mean, sd } = dynargsGet(1|2, 0, 1);
 
    // Compute a random matrix with the
    // specified mean and sd.
    X = (rndn(r, c) .* sd) + mean;
 
    retp(X);
endp;

/*
** Inputs: b_true  - Required input. True parameter values of
**                   the simulated linear model.
**         nobs  - Required input. The number of observations
**                 to simulate.
**         alpha_true - Optional input. True intercept of the
**                      simulated linear model. Default = 0.
**         err_sd - Optional input. Standard deviation of the 
**                  error term. Default = 1.
*/
proc (1) = simulateLM(b_true, nobs, ...);
    local X, err, nvars, alpha_plus_err, y;
 
    // Find number of desired variables
    nvars = rows(b_true);
 
    // Simulate variables with
    // mean = 0, sd = 1
    X = rndNormal(nobs, nvars);
 
    // Simulate error term and add intercept
    // if it was passed in.
    alpha_plus_err = rndNormal(nobs, 1, ...);
 
    y = X * b_true + alpha_plus_err;
 
    retp(y);
endp;
