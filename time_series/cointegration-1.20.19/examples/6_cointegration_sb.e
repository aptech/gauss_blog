/*
** This file accompanies the 1/18/2019 Aptech blog
** "How to Conduct Cointegration Tests in GAUSS
**  It should be used to conduct cointegration
**  testing for models with structural breaks.
*/

new;
cls;

// Load tsmt library
library tsmt, tspdlib;

// Set filename (with path) for loading
fname2 = __FILE_DIR $+ "commodity_mon.dat";

// Load data
data = loadd(fname2);
y_test_real = data[ ., 1 3];



/*
** Information Criterion:
** 1=Akaike;
** 2=Schwarz;
** 3=t-stat sign.
*/
ic = 2;

//Maximum number of lags
pmax = 12;

// Trimming rate
trimm = 0.15;

// Long-run consistent variance estimation method
varm = 3;

// Bandwidth for kernel estimator
T = rows(y_test_real);
bwl = round(4 * (T/100)^(2/9));

// Level shift
model = 1;
{ ADF_min1, TBadf1, Zt_min1, TBzt1, Za_min1, TBza1, cvADFZt1, cvZa1 } =
    coint_ghansen(y_test_real[., 1], y_test_real[., 2], model, bwl, ic, pmax, varm, trimm);

// Level shift with trend
model = 2;
{ ADF_min2, TBadf2, Zt_min2, TBzt2, Za_min2, TBza2, cvADFZt2, cvZa2 } =
    coint_ghansen(y_test_real[., 1], y_test_real[., 2], model, bwl, ic, pmax, varm, trimm);

// Regime shift
model = 3;
{ ADF_min3, TBadf3, Zt_min3, TBzt3, Za_min3, TBza3, cvADFZt3, cvZa3 } =
    coint_ghansen(y_test_real[., 1], y_test_real[., 2], model, bwl, ic, pmax, varm, trimm);
    
// Regime shift with trend
model = 4;
{ ADF_min4, TBadf4, Zt_min4, TBzt4, Za_min4, TBza4, cvADFZt4, cvZa4 } =
    coint_ghansen(y_test_real[., 1], y_test_real[., 2], model, bwl, ic, pmax, varm, trimm);
