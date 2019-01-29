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
 
// Plot data
plotTSHF(timevec, "hours", bid);
