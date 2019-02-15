new;
cls;
library tspdlib;

// Load date file
y = loadd(__FILE_DIR $+ "tspdlib_blog.dat");

// Keep US data
ca_US = selif(y, y[., 1] .== 111);

/*
** This section plots a time series plot of 
** the US current account to GDP ratio.
*/

/*
** Set up plot
*/
struct plotControl myPlot;
myPlot = plotGetDefaults("xy");

// Title for first graph
plotSetTitle(&myPlot, "U.S Current Account to GDP Ratio", "Arial", 18);

// Tic Labels
plotSetTicLabelFont(&myPlot, "Arial", 11);

// Tic Labels
plotSetTicLabelFont(&myPlot, "Arial", 11);

// Place first 'X' tick mark at 1984 month 1 and draw one every 6 months
plotSetXTicInterval(&myPlot, 4*10, 1960);

// Plot data
plotTS(myPlot, 1960, 4, ca_US[., 3]);

/*
** Set up unit root testing models
*/
// Model A: break in level  
model = 1;                  

// Maximum number of lags for ds; 
pmax = 12;                 

// Maximum number of Fourier
fmax = 4;        

// Information Criterion: 
ic = 3;                 

// Trimming rate
trimm = 0.10;             

// Long-run consistent variance estimation method
varm = 3;

y_test = ca_US[., 3];


"One break ADF test (Zivot & Andrews, 1992)";
    { ADF_min, tb1, p, cv } = ADF_1break(y_test, model, pmax, ic, trimm);

"Two breaks ADF test (Narayan & Popp, 2010)";
    { ADF_min, tb1, tb2, p, cv } = ADF_2breaks(y_test, model, pmax, ic, trimm);

    
"Fourier ADF test (Enders & Lee, 2012)";
    { ADFstat, f, p, cv } = Fourier_ADF(y_test, model, pmax, fmax, ic);    
 
    
"One break LM test (Lee & Strazicich, 2013)";
    { LM_min, tb1, p, lambda, cv } = LM_1break(y_test, model, pmax, ic, trimm);


"Two breaks LM test (Lee & Strazicich, 2003)";
    { LM_min, tb1, tb2, p, cv } = LM_2breaks(y_test, model, pmax, ic, trimm);
   

"Fourier LM test (Enders & Lee, 2012)";
    { LMstat, f, p, cv } = Fourier_LM(y_test, pmax, fmax, ic);    

  
