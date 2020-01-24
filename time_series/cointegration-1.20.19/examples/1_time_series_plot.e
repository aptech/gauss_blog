/*
** This file accompanies the 1/18/2019 Aptech blog
** "How to Conduct Cointegration Tests in GAUSS 
**  It plots our sample data. 
*/
new;
cls;

// Set filename (with path) for loading
fname2 = __FILE_DIR $+ "commodity_mon.dat";


// Load data
data = loadd(fname2);
y_test_real = data[ ., 1 3];
y_test_nominal = data[ ., 2 4];

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

plotCanvasSize("px", 1600|1200);

// Set Title
plotSetTitle(&tsPlot, "Monthly Closing Gold Real Prices (USD/ounce)");
plotLayout(2, 1, 1);
plotTS(tsPlot, dtstart, freq, y_test_real[., 1]);

// Set Title
plotSetTitle(&tsPlot, "Monthly Closing Silver Real Prices (USD/ounce)");
plotLayout(2, 1, 2);
plotTS(tsPlot, dtstart, freq, y_test_real[., 2]);

plotOpenWindow();
// Set Title
plotSetTitle(&tsPlot, "Monthly Closing Nominal Gold Prices (USD/ounce)");
plotLayout(2, 1, 1);
plotTS(tsPlot, dtstart, freq, y_test_nominal[., 1]);

// Set Title
plotSetTitle(&tsPlot, "Monthly Closing Nominal Silver Prices (USD/ounce)");
plotLayout(2, 1, 2);
plotTS(tsPlot, dtstart, freq, y_test_nominal[., 2]);


proc (1) = projPlotDefaults();
    local title_font_size, font_name, axis_label_size;
    
    // Set up graph
    struct plotControl myPlot;
    myPlot = plotGetDefaults("xy");
    
    // Set up font
    title_font_size = 18;
    font_name = "helvetica neue";
    axis_label_size = 14;
    
    // Title
    plotSetTitle(&myPlot, "", font_name, title_font_size);
    
    plotSetYLabel(&myPlot, "", font_name, axis_label_size);
    
    // Set legend background to be completely transparent
    plotSetLegendBkd(&myPlot, 0);
    
    plotSetTicLabelFont(&myPlot, font_name, 12);
    plotSetLegendFont(&myPlot, font_name, 12);
    
    retp(myPlot);
endp;
