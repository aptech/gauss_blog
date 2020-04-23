/*
** This file accompanies the 1/18/2019 Aptech blog
** "How to Conduct Cointegration Tests in GAUSS 
**  It plots our sample data. 
*/
new;
cls;

// Set filename (with path) for loading
fname2 = __FILE_DIR $+ "commodity_mon.dat";


// Load real prices data
y_test_real = loadd(fname2, "P_gold_real + P_silver_real");

// Load nominal prices
y_test_nominal = loadd(fname2, "P_gold_nominal + P_silver_nominal");

// Start date
dtstart = 1915;

// Set monthly frequency
freq = 12;

// Set up graph appearance
struct plotControl tsPlot;
tsPlot = projPlotDefaults();

// Place first 'X' tick mark at 1915 month 1 and draw one every 10 years
plotSetXTicInterval(&tsPlot, 12*20, 1920);

// Display only 4 digit year on 'X' tick labels
plotSetXTicLabel(&tsPlot, "YYYY");

plotCanvasSize("px", 800|600);

plotSetYAxisLabel(&tsPlot, "USD/oz.");

// Set Title
plotSetTitle(&tsPlot, "Monthly Closing Gold Real Prices");
plotLayout(2, 1, 1);
plotTS(tsPlot, dtstart, freq, y_test_real[., 1]);

// Set Title
plotSetTitle(&tsPlot, "Monthly Closing Silver Real Prices");
plotLayout(2, 1, 2);
plotTS(tsPlot, dtstart, freq, y_test_real[., 2]);

plotOpenWindow();
// Set Title
plotSetTitle(&tsPlot, "Monthly Closing Nominal Gold Prices");
plotLayout(2, 1, 1);
plotTS(tsPlot, dtstart, freq, y_test_nominal[., 1]);

// Set Title
plotSetTitle(&tsPlot, "Monthly Closing Nominal Silver Prices");
plotLayout(2, 1, 2);
plotTS(tsPlot, dtstart, freq, y_test_nominal[., 2]);


proc (1) = projPlotDefaults();
    local title_font_size, font_name, axis_label_size;
    
    // Set up graph
    struct plotControl myPlot;
    myPlot = plotGetDefaults("xy");
    
    // Set up font
    title_font_size = 16;
    font_name = "helvetica neue";
    axis_label_size = 12;
    
    // Title
    plotSetTitle(&myPlot, "", font_name, title_font_size);
    
    plotSetYLabel(&myPlot, "", font_name, axis_label_size);
    
    // Set legend background to be completely transparent
    plotSetLegendBkd(&myPlot, 0);
    
    plotSetTicLabelFont(&myPlot, font_name, 10);
    plotSetLegendFont(&myPlot, font_name, 10);
    
    retp(myPlot);
endp;
