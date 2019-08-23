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

/*
** Model One
*/
// Call ols estimation
{ vnam, m, b, stb, vc, stderr, sigma, cx, rsq, resid, dwstat } = ols("", price, weight);

// Set up the plot
struct plotControl myPlot;
myPlot = plotGetDefaults("scatter");

// Set up title
plotSetTitle(&myPlot, "Marginal effects in the linear model.", "Arial", 18);

// Set up x-axis label
plotSetXAxisLabel(&myPlot, "Weight");

// Set up y-axis label
plotSetYAxisLabel(&myPlot, "Price ($USD)");

clrs = myPlot.lineColor;

// Plot the graph
plotScatter(myPlot, weight, price);

// Add a legend
plotSetLegend(&myPlot, "Predicted Outcome");

// Set up line
plotSetLineColor(&myPlot, clrs[2]);

// Remove the symbol
plotSetLineSymbol(&myPlot, -1);

// Add in line graph
tmp = seqa(1000, 1, 5001);
y_pred = -6.707353 + 2.044063*tmp;

plotAddXY(myPlot, tmp, y_pred);

// Add in the line
which_shape = "line";
x_start = 2000;
x_end = 3000;
y_start = y_pred[1001];
y_end = y_pred[1001];

plotAddShape(which_shape, x_start, y_start, x_end, y_end);

// Add in the line
which_shape = "line";
x_start = 3000;
x_end = 3000;
y_start = y_pred[1001];
y_end = y_pred[2001];

plotAddShape(which_shape, x_start, y_start, x_end, y_end);



