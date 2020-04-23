/*
** This file accompanies the 1/18/2019 Aptech blog
** "How to Conduct Cointegration Tests in GAUSS
**  It should be used to conduct cointegration testing
**  for models without any structural breaks.
*/
new;

// Load tsmt library
library tsmt, tspdlib;

// Set filename (with path) for loading
fname2 = __FILE_DIR $+ "commodity_mon.dat";

// Load real prices data
y_test_real = loadd(fname2, "P_gold_real + P_silver_real");

/*
** Johansen Test for Cointegration
*/
// Step time polynomial in
// the fitted regression
p = -1;

// Set number of lagged differences
// for computing estimator
k = 2;

// No determinant
nodet = 0;

{ ev, evec, trace_stat, max_ev } = vmsjmt(y_test_real, p, k, nodet);
cv_lr2 = vmc_sjamt(2, p);
cv_lr1 = vmc_sjtmt(2, p);

/*
** Engle-granger test for cointegration
*/
/*
** Information Criterion:
** 1=Akaike;
** 2=Schwarz;
** 3=t-stat sign.
*/
ic = 2;

// Maximum number of lags
pmax = 12;

// Run test for each deterministic trend
"-----------None-----------------------------------------";
model = 0;
{ tau, cvADF } = coint_egranger(y_test_real[., 1], y_test_real[., 2], model, pmax, ic);

"    Test         Statistic  CV(1%, 5%, 10%)";
"Ho: no co-integration (EG, 1987 & P0, 1990)";

"   EG_ADF        ";;
tau   ;;
cvADF';
"";

"-----------Constant-------------------------------------";
model = 1;
{ tau, cvADF } = coint_egranger(y_test_real[., 1], y_test_real[., 2], model, pmax, ic);

"    Test         Statistic  CV(1%, 5%, 10%)";
"Ho: no co-integration (EG, 1987 & P0, 1990)";
"   EG_ADF        ";;
tau   ;;
cvADF';
"";

"-----------Constant and Trend---------------------------";
model = 2;
{ tau, cvADF } = coint_egranger(y_test_real[., 1], y_test_real[., 2], model, pmax, ic);

"    Test         Statistic  CV(1%, 5%, 10%)";
"Ho: no co-integration (EG, 1987 & P0, 1990)";
"   EG_ADF        ";;
tau   ;;
cvADF';
"";

