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
myplot = setMarketingPlot("xy");

plotSetTitle(&myPlot, "S&P 500 Weekly Returns", "Lato Thin", 18);

date_str = dttostr(date_vec, "YYYY-MO");

//Place one tic label every 4 x-values
ticInterval = 10;
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

//Declare 'myAnnotation' to be an instance of a plotAnnotation structure
struct plotAnnotation myAnnotation;

//Fill in 'myAnnotation' with default values
myAnnotation = annotationGetDefaults();

//Set the color to be light gray
//and make it 40% opaque
annotationSetBkd(&myAnnotation, "light gray", 0.2);

//Set font in textbox
annotationSetFont(&myAnnotation, "Lato Thin", 12, "black");

//Turn off box outline
annotationSetLineThickness(&myAnnotation, 0);

text = "ICSS test finds 4 breaks in variance:
        <br/>May 21st, 1987
        <br/>October 7th, 1987
        <br/>November 11th, 1987
        <br/>May 15th, 1992";

x_start = 450;
y_start = 0.1;
plotAddTextbox(myAnnotation, text, x_start, y_start);
