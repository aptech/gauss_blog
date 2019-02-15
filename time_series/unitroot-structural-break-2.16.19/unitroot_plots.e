/*
** This file plots the stationary,
** trend stationary, and non-stationary
** series
*/

// Set random seed for repeatable random numbers
rndseed 5423;

// Number of observations to simulate
nobs = 150;
 
// Constant initial value
C = 0;
 
// Create error term
epsilon = 2*rndn(nobs + 1, 1);

// AR parameters
rho_ur = 1.015;
rho_s = 0.72; 
 
// Simulate the I(1) AR(1) process
y_vec_unitroot = recserar(epsilon, C, rho_ur);

// Simulate the I(0) AR(1) process
y_vec_stationary = recserar(epsilon, C, rho_s);

// Simulate the trend stationary process
y_vec_trend = recserar(epsilon, C, rho_s) + 0.15*seqa(1, 1, nobs+1);

/*
** Set up plot
*/
struct plotControl myPlot;
myPlot = plotGetDefaults("xy");

// Title for first graph
plotSetTitle(&myPlot, "Comparing stationary and non-stationary AR(1) series", "Arial", 18);

// Set up legend
plotSetLegend(&myPlot, "Non-stationary"$|"Stationary"$|"Trend Stationary", "top left");
plotSetLegendFont(&myPlot, "Arial", 12);
plotSetLegendBkd(&myPlot, 0);

// Tic Labels
plotSetTicLabelFont(&myPlot, "Arial", 11);

// Place first 'X' tick mark at 1984 month 1 and draw one every 6 months
plotSetXTicInterval(&myPlot, 4*10, 1960);

// Display only 4 digit year on 'X' tick labels
plotSetXTicLabel(&myPlot, "YYYY-QQ");

plotTS(myPlot, 1960, 4, y_vec_unitroot~y_vec_stationary~y_vec_trend);

/*
** Piecewise series with structural break
*/
// Number of observations to simulate
T = 225;
nobs_1 = 75;
nobs_2 = T - nobs_1;

// Constant initial value
c = 0;

// AR(1) parameter
rho_s = 0.72; 

// Create error term
epsilon = 0.5*rndn(T + 1, 1);

// Generate series
y  = recserar(epsilon, c, rho_s);
y_break = y[1:nobs_1]|(y[nobs_1+1:T]+4.37);

// Estimate trend line
{ vnam, m, b, stb, vc, stderr, sigma, cx, rsq, resid, dwstat } = ols("", seqa(1, 1, T), y_break);
y_hat = (ones(T, 1)~seqa(1, 1, T))*b;

/*
** Set up structural break 
** plot
*/
plotOpenWindow();

struct plotControl myPlot2;
myPlot2 = plotGetDefaults("xy");

// Title for first graph
plotSetTitle(&myPlot2, "AR(1) series with a level structural break", "Arial", 18);

// Tic Labels
plotSetTicLabelFont(&myPlot2, "Arial", 11);

// Place first 'X' tick mark at 1984 month 1 and draw one every 6 months
plotSetXTicInterval(&myPlot2, 4*10, 1960);

// Display only 4 digit year on 'X' tick labels
plotSetXTicLabel(&myPlot2, "YYYY-QQ");

plotTS(myPlot2, 1960, 4, y_break);

// Add mean line before break
plotSetLineColor(&myPlot2, "#8da0cb");
plotAddXY(myPlot2, seqa(1, 1, nobs_1), zeros(nobs_1, 1));

// Add mean line after break
plotSetLineColor(&myPlot2, "#8da0cb");
plotAddXY(myPlot2, seqa(nobs_1+1, 1, T-nobs_1), 4.37*ones(T-nobs_1, 1));

