/*
**  This code accompanies the Aptech blog
**  Why the GLS unit root test with multiple 
**  structural breaks? 
**
**  It draws the plots found in the blog.
**
**  Date : 7/25/2018
**
**  Required data files
**      "housing_wa.dat"
**      "housing_ar.dat"
**      "zhvi_cities.csv"
*/

// Load the data
housing_wa = loadd(__FILE_DIR $+ "housing_wa");
y_wa = housing_wa[., 5];

housing_ar = loadd(__FILE_DIR $+ "housing_ar");
y_ar= housing_ar[., 4];

zhvi = loadd(__FILE_DIR $+ "zhvi_cities.csv");
y_seattle = zhvi[., 2];
y_phoenix = zhvi[., 3];

dtstart1 = 19910101;
freq1 = 4;

dtstart2 = 19960404;
freq2 = 12;

/********************************
WASHINGTON PLOT
***********************************/
struct plotControl myplot;
myplot = setMarketingPlot("xy");

plotLayout(1, 2, 1);

//  Set title
plotSetTitle(&myPlot, "Washington Housing Price Index <br\>(Federal Housing Finance Agency, Seasonally Adjusted)", "Lato Thin", 18);

//  Place first 'X' tic mark at 1984 month 1 and draw one every 6 months
plotSetXTicInterval(&myPlot, 20, 1995);

//  Display only 4 digit year on 'X' tic labels
plotSetXTicLabel(&myPlot, "YYYY");

//  Draw the time series plot
plotTS(myPlot, dtstart1, freq1, y_wa);

// Draw break lines
drawbreaklines(100, 400, 39|67|82, myPlot);

// Starting point of annotation box
x_start = 5;
y_start = 400;
br_sa = "2000, Q2"$|"2006, Q2"$|"2009, Q1";
addannotationbox(x_start, y_start, br_sa);

/********************************
ARIZONA PLOT
***********************************/
plotLayout(1, 2, 2);
myplot = setMarketingPlot("xy");

// Set title
plotSetTitle(&myPlot, "Arizona Housing Price Index <br\>(Federal Housing Finance Agency, Seasonally Adjusted)", "Lato Thin", 18);

// Place first 'X' tic mark at 1984 month 1 and draw one every 6 months
plotSetXTicInterval(&myPlot, 20, 1995);

// Display only 4 digit year on 'X' tic labels
plotSetXTicLabel(&myPlot, "YYYY");

// Plot time series
plotTS(myPlot, dtstart1, freq1, y_ar);

// Draw break lines
drawbreaklines(100, 400, 41|64|76, myPlot);

// Starting point of annotation box
x_start = 5;
y_start = 400;
br_sa = "2000, Q4"$|"2006, Q3"$|"2009, Q3";
addannotationbox(x_start, y_start, br_sa);

/********************************
SEATTLE PLOT
***********************************/
struct plotControl myplot;
myplot = setMarketingPlot("xy");
plotOpenWindow();
plotLayout(1, 2, 1);

// Set title
plotSetTitle(&myPlot, "Seattle Home Value Index (Zillow)", "Lato Thin", 18);

// Place first 'X' tic mark at 1984 month 1 and draw one every 6 months
plotSetXTicInterval(&myPlot, 60, 2000)

// Display only 4 digit year on 'X' tic labels
plotSetXTicLabel(&myPlot, "YYYY");

// Plot time series
plotTS(myPlot, dtstart2, freq2, y_seattle);

// Draw break lines
drawbreaklines(0, 800000, 96|123|151, myPlot);

// Starting point of annotation box
x_start = 190;
y_start = 135000;
br_sa = "February, 2004"$|"May, 2006"$|"September, 2008";
addannotationbox(x_start, y_start, br_sa);

/********************************
PHOENIX
***********************************/
plotLayout(1, 2, 2);
myplot = setMarketingPlot("xy");

// Set title
plotSetTitle(&myPlot, "Phoenix Home Value Index (Zillow)", "Lato Thin", 18);

// Place first 'X' tic mark at 2000 1 and draw one every 6 months
plotSetXTicInterval(&myPlot, 60, 2000);

// Display only 4 digit year on 'X' tic labels
plotSetXTicLabel(&myPlot, "YYYY");

// Plot time series line
plotTS(myPlot, dtstart2, freq2, y_phoenix);

// Draw break lines
drawbreaklines(0, 280000, 41|121|163, myPlot);

// Starting point of annotation box
x_start = 190;
y_start = 50000;
br_sa = "July, 1999"$|"March, 2006"$|"September, 2009";
addannotationbox(x_start, y_start, br_sa);

proc (0) = drawbreaklines(y_min, y_max, br, struct plotControl myPlot);
    
    // Set up line style
    plotSetLineStyle(&myPlot, 2);
    
    // Plot breaks
    for i(1, rows(br), 1);
            plotSetLineColor(&myPlot, "#8da0cb");
            plotAddXY(myPlot, br[i]|br[i], y_min|y_max);
    endfor;

endp;

proc (0) = addannotationbox(x_start, y_start, br_sa);
    local text;
    
    // Declare 'myAnnotation' to be an instance of a plotAnnotation structure
    struct plotAnnotation myAnnotation;
    
    // Fill in 'myAnnotation' with default values
    myAnnotation = annotationGetDefaults();
    
    /*
    ** Set the color to be light gray
    ** and make it 20% opaque
    */
    annotationSetBkd(&myAnnotation, "light gray", 0.2);
    
    // Set font in textbox
    annotationSetFont(&myAnnotation, "Lato Thin", 9, "black");
    
    // Turn off box outline
    annotationSetLineThickness(&myAnnotation, 0);
    
    text = "Estimated structural breaks: <br/>" $+ br_sa[1] $+ "<br/>" $+ br_sa[2] $+ "<br/>" $+ br_sa[3];
    
    plotAddTextbox(myAnnotation, text, x_start, y_start);
endp;

proc (1) = setMarketingPlot(plotType);
    struct plotControl myPlot;
    
    myPlot = plotGetDefaults(plotType);
    
    plotSetTitle(&myPlot, "", "Arial", 16);
    
    plotSetAxesPen(&myPlot, 2);
    
    plotSetXLabel(&myPlot, "", "Arial", 12);
    
    plotSetYLabel(&myPlot, "", "Arial", 12);
    
   plotSetTicLabelFont(&myPlot, "Arial", 12);
    
    retp(myPlot);
endp;
