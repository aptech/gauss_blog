/*****************************************
* Replicates the emprirical aplication in
* Sanso, Arag� & Carrion (2002): "Testing for changes in the unconditional 
* variance of financial time series"
*
*****************************************/
new;
cls;

library icsslib;

// Load S&P data
x = loadd(__FILE_DIR $+ "sp2.dat");

// Demean data
e = x - meanc(x);

// Create the date vector
date_vec = {};
dtstart = 19850502000000;
dtend = 19950501000000;
do while dtstart<=dtend;
    if dayofweek(dtstart) == 4;
        date_vec = date_vec|dtstart;
    endif;
    
    // Get next trading day
    tmp1 = dtstart;
    dtstart = getNextTradingDay(dtstart);
    
    /*
    ** Check if wednesday is not next trading day 
    ** and previous trading day was tuesday
    */
    if dayofweek(tmp1) == 3;
        if dayofweek(dtstart)!=4;
             date_vec = date_vec|tmp1;
        endif;
    endif;
    dayofweek(date_vec[rows(date_vec)]);
endo;
    
plotXY(seqa(1,1,rows(e)), e);

// Uses ICSS test
test = 0; 

// Call test
{ cpr, nbr } = icss(e, test, 0|0|0);

// Print results"using inclant-tiao test";
print "Number of breaks" nbr;
print "Break positions" cpr';

struct plotControl myplot;
myplot = projPlotDefaults("xy");

plotSetTitle(&myPlot, "S&P 500 Weekly Returns", "Lato Thin", 18);

date_str = dttostr(date_vec, "YYYY-MO");

//Place one tic label every 4 x-values
ticInterval = 50;
plotSetXTicInterval(&myPlot, ticInterval);

plotXY(myPlot, seqa(1,1,rows(e)), e);
//plotXY(myPlot, date_str, e);
y_min = -0.2;
y_max = 0.1;

plotSetLineStyle(&myPlot, 2);
plotSetLineColor(&myPlot, "#8da0cb");
plotAddXY(myPlot, cpr[2]|cpr[2], y_min|y_max);

plotSetLineColor(&myPlot, "#8da0cb");
plotAddXY(myPlot, cpr[3]|cpr[3], y_min|y_max);

plotSetLineColor(&myPlot, "#8da0cb");
plotAddXY(myPlot, cpr[4]|cpr[4], y_min|y_max);

plotSetLineColor(&myPlot, "#8da0cb");
plotAddXY(myPlot, cpr[5]|cpr[5], y_min|y_max);


text = "ICSS test finds 4 breaks in variance:
        <br/>May 21st, 1987
        <br/>October 7th, 1987
        <br/>November 11th, 1987
        <br/>May 15th, 1992";

x_start = 445;
y_start = 0.1;
plotAddTextbox(grayTextSettings(), text, x_start, y_start);

/*****************************************************************************/


proc (1) = projPlotDefaults(typeGraph);
    local title_font_size, font_name, axis_label_size;
    // Set up graph
    struct plotControl myPlot;
    myPlot = plotGetDefaults(typeGraph);
    
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


proc (1) = grayTextSettings();
    local font_size, font_name;
    struct plotAnnotation mytextbox;

    // Set up font
    font_size = 10;
    font_name = "helvetica neue";
    
    mytextbox = annotationGetDefaults();
    annotationSetBkd(&mytextbox, "#DDDDDD", 0.1);
    annotationSetFont(&mytextbox, font_name, font_size, "#55555");
    
    annotationSetLineThickness(&mytextbox, 0);
    //annotationSetLineColor(&mytextbox, "#555555");
    
    retp(mytextbox);
endp;
