/*
** Replicates second plot 
** in blog 
** How to mix, match 
** and style different graph types
** 08/20/2019
*/
// Load variables from dataset
data = loadd("phillips-us-1955.csv", "CPI + Unemployment");
 
struct plotControl myPlot;
myPlot = plotGetDefaults("scatter");
 
// Set axis element, title
plotSetTitle(&myPlot, "Phillips Curve in the US", "Helvetica Neue", 14);
 
// Plot initial scatter points
// Note that we pass in 'myPlot' this time
plotScatter(myPlot, data[.,1], data[.,2]);
 
// Compute mean of unemployment
mu_u = meanc(data[.,2]);
 
// Compute range of CPI
range_cpi = minc(data[.,1]) | maxc(data[.,2]);
 
// Attempt to reset axis level property
myPlot = plotGetDefaults("xy");
plotSetTitle(&myPlot, "Title which will be ignored");
 
// Attempt to set axis level property
plotSetXLabel(&myPlot, "CPI");
 
// Add a line across the range of the CPI
// data at the height of the average of the
// Unemployment data
// Note that we pass in 'myPlot' this time
plotAddXY(myPlot, range_cpi, mu_u | mu_u);
