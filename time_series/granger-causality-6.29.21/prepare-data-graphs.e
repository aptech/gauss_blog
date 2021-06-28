/*
** Set up data for Granger-causality blog
** and graphs
**  
*/


// Load data
price_data = loadd(__FILE_DIR $+ "price_data.xls", "date($observation_date) + price_gold + price_oil");


// Deal with missing values
// by replacing missing values
// with previous observations

for i (2, rows(price_data), 1);
    if price_data[i, "price_gold"] .== error(30);
        price_data[i, "price_gold"] = price_data[i-1, "price_gold"];
    endif;
    
    if price_data[i, "price_oil"] .== 0;
        price_data[i, "price_oil"] = price_data[i-1, "price_oil"];
    endif;
    
endfor;

// Graphing data using
// plottshf and multiple axis

struct plotControl myPlot;
myPlot = plotGetDefaults("XY");

// Title
plotSetTitle(&myPlot, "Closing Oil and Gold Prices (USD)", "Arial", 24);

// Legend
plotSetLegend(&myPlot, "Gold"$|"Oil", "Bottom Right");
plotSetLegendFont(&myPlot, "Arial", 16);


// Set the first curve, 'Gold' to the left Y-axis
// Set the second curve 'Oil' to the right Y-axis
string which = { "left", "right" };
plotSetWhichYAxis(&myPlot, which);

// Set the left and right Y-axis labels
plotSetYLabel(&myPlot, "Gold (USD per oz)"$|"West Texas Intermediate (USD per Barrel)", "Arial", 20);
 

// Create an X-tick label every 90 days
// Set the first tick label at:
// October 31st, 2008 at 45 seconds after midnight
first_label = strctoposix("2017-01-01", "%Y-%m-%d");
plotSetXTicInterval(&myPlot, 12, first_label);

// Set graph size
plotCanvasSize("px", 1200|800);
plotTSHF(myPlot, price_data[., "observation_date"], "months", price_data[., "price_gold"]~price_data[., "price_oil"]);
