/*
** Practical application of 
** of optional arguments - random normal
** 
** It accompanies the blog
** "The Basics of Optional Arguments 
**  in GAUSS Procedures"
**
**  Published 2/12/2020
*/

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

// Create a 100x4 random normal matrix
// with mean=0 and sd=1
X_1 = rndNormal(100, 4);
 
// Create a 130x2 random normal matrix
// with mean=3.7 and sd=1
X_2 = rndNormal(130, 2, 3.7);
 
// Create a 74x5 random normal matrix
// with mean=-2 and sd=3
X_3 = rndNormal(74, 5, -2, 3);
