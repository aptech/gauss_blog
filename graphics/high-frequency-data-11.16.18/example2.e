/*
**  This code accompanies the blog
**  "Graph high frequency Forex data"
**  published on 11/16/2018 
**  on the Aptech blog.
*/

// Load all observations of both variables
fname = "usdcad_tick.csv";
data = loadd(fname);
 
// Split variables into separate vectors
timevec = data[.,1];
bid = data[.,2];
 
/*
** Declare 'myPlot' to be a plotControl struct
** and fill with default values
*/
struct plotControl myPlot;
myPlot = plotGetDefaults("xy");
 
/*
** Convert the DT Scalar date to POSIX
** YYYY MO DD HH MI SS
** 2018 01 02 06 30 00
*/
first_lbl = dttoposix(2018010206300);
 
/*
** Draw X-tick labels every 60 minutes,
** starting at Jan 2, 2018 at 06:30
*/
plotSetXTicInterval(&myPlot, 60, first_lbl);

// Open new plot window
plotOpenWindow();

// Plot data (notice we pass in the plotControl struct)
plotTSHF(myPlot, timevec, "minutes", bid);
