/*
** This file accompanies the GAUSS blog
** "untangling marginal effects" published 
** on 5/2/2019
*/

// Load data
data = loadd(getGAUSShome() $+ "/examples/auto2.dta", "price + mpg + weight");

// Extract variables
price = data[.,1];
mpg = data[., 2];
weight = data[., 3];

weight_mpg = mpg.*weight;

/*
** Model Two
*/

// Call ols estimation
{ vnam, m, b, stb, vc, stderr, sigma, cx, rsq, resid, dwstat } = ols("", price, weight~weight_mpg);

y_pred2 = (ones(rows(weight),1)~(weight)~weight_mpg)*b;

// Find marginal effects
me = 2.227893 - 0.055161*mpg;

/*
** Create table
*/
tmp = seqa(1000, 1, 5001);
y_pred =2787.94 + 2.227893*tmp - 0.055161*tmp*16;

y_pred[1001];
y_pred[2001];
y_pred[3001];
y_pred[4001];
y_pred[5001];

print "Differences";

y_pred[2001]-y_pred[1001];
y_pred[3001]-y_pred[2001];
y_pred[4001]-y_pred[3001];
y_pred[5001]-y_pred[4001];

// Set up the plot
struct plotControl myPlot;
myPlot = plotGetDefaults("xy");

// Set up title
plotSetTitle(&myPlot, "Marginal effects with an interaction term", "Arial", 18);

// Set up x-axis label
plotSetXAxisLabel(&myPlot, "MPG");

// Set up y-axis label
plotSetYAxisLabel(&myPlot, "Marginal Effect of weight on price");

plotOpenWindow();
plotXY(myPlot, mpg, me);

// Set up zero line
plotSetLineColor(&myPlot, myPlot.lineColor[2]);

// Set up line style
plotSetLineStyle(&myPlot, 2);

// Add zero line
plotAddXY(myPlot, 10|45, 0|0);
