new;
library maxlikmt;

// Set random seed for replication
rndseed 9987912;

// Generate data
nObs = 800;
x = rndn(nObs, 1);
beta_real = 1.2;
sigma2 = 4;
y = x*beta_real + sqrt(4)*rndn(nobs, 1);

beta_grid = seqa(0, 0.05, 2/0.05);
sigma2_grid = seqa(2, 0.05, 40);

lik_function = zeros(rows(beta_grid), rows(sigma2_grid));

for i(1, rows(beta_grid), 1);
    for j(1, rows(sigma2_grid), 1);
        lik_function[i, j] = lfn(beta_grid[i]~sigma2_grid[j], y, x);
    endfor;
endfor;

// Set up plot
struct plotControl myPlot;
myPlot = plotGetDefaults("scatter");

// Set title on the graph
plotSetTitle(&myPlot, "Linear Model Likelihood Function", "Arial", 16); 

// Set up the tic style
plotSetTicLabelFont(&myPlot, "Arial", 14);

// Set up interpreter
plotSetTextInterpreter(&myPlot, "html", "axes"); 

// X-axis
plotSetXLabel(&myPlot, "&beta;", "arial", 14);
plotSetYLabel(&myPlot, "&sigma;<sup>2</sup>", "arial", 14);

plotSurface(myPlot, beta_grid', sigma2_grid, lik_function);

// Write likelihood function
proc (1) = lfn(theta, y, x);
    local beta_est, sigma2, lik_function;
    
    beta_est = theta[1];
    sigma2 = theta[2];

    lik_function = sumc(-1/2*(ln(sigma2) + ln(2*pi) + (y - x*beta_est)^2/sigma2));
    
    retp(lik_function);
endp;

