/*
** Draw full Phillips curve
** How to mix, match 
** and style different graph types
** 08/20/2019
*/

// Load inflation and unemployment data
// (CPI percent change) for 1955–71 and 1974–84
phil_1955 = loadd("phillips-us-1955.csv", "CPI + Unemployment");
phil_1974 = loadd("phillips-us-1974.csv", "CPI + Unemployment");
 
// For simplicity, define start and
// end points for regression lines
reg_x_1955 = { -0.8538, 6.4246 };
reg_y_1955 = { 5.6356, 3.8925 };
 
reg_x_1974 = { 2.3590, 14.5923 };
reg_y_1974 = { 9.0762, 5.9248 };

// Declare 'myPlot' to be a plotControl structure
// and fill with default settings
struct plotControl myPlot;
myPlot = plotGetDefaults("scatter");
 
plotSetTitle(&myPlot, "Phillips Curve in the US", "Arial", 14);
 
// Note that the font settings applied in
// plotSetXLabel will control the Y-label font
// as well. Setting the Y-label without font
// settings will leave previous font settings unchanged
plotSetXLabel(&myPlot, "Inflation", "Arial", 14);
plotSetYLabel(&myPlot, "Unemployment");
 
plotSetYRange(&myPlot, 0, 12.5);

// Make the legend background completely
// transparent, i.e. 0% opacity
plotSetLegendBkd(&myPlot, 0);
 
// The text for each data series we plan to add
// to our graph, in order. Note that the last
// item is an empty string, "", because we only
// want a legend item for one of the regression lines.
leg_text = "1955-1971" $| "1974-1984" $| "Regression line" $| "";
plotSetLegend(&myPlot, leg_text, "top left inside");

// Set the colors for the scatter plot, an orange and green
// color, followed by one "black" for each regression line
clrs = "#66C2A5" $| "#FC8D62" $| "black" $| "black";
plotSetLineColor(&myPlot, clrs);

// Draw initial scatter plot
plotScatter(myPlot, phil_1955[.,1], phil_1955[.,2]);

// Add next scatter series, using previously
// set series level attributes since a
// plotControl structure was not passed in
plotAddScatter(phil_1974[.,1], phil_1974[.,2]);

// Option 2: Add both regression lines in one call
plotAddXY(reg_x_1955 ~ reg_x_1974, reg_y_1955 ~ reg_y_1974);
