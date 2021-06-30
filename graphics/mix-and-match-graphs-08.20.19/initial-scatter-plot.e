/*
** Replicates first plot 
** in blog 
** How to mix, match 
** and style different graph types
** 08/20/2019
*/

// Load variables from dataset
data = loadd("phillips-us-1955.csv", "CPI + Unemployment");
 
// Plot initial scatter points
plotScatter(data[.,1], data[.,2]);
 
// Compute mean of unemployment
mu_u = meanc(data[.,2]);
 
// Compute range of CPI
range_cpi = minc(data[.,1]) | maxc(data[.,2]);
 
// Add a line across the range of the CPI
// data at the height of the average of the
// Unemployment data
plotAddXY(range_cpi, mu_u | mu_u);
