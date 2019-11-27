library tsmt;
 
// Load data
nyse = loadd("nyse_closing.xlsx", "adj_close");
 
// Transform to percent change
ch_nyse = (nyse[1:rows(nyse)-1] - nyse[2:rows(nyse)]) ./ nyse[2:rows(nyse)];
 
/*
** Unit root testing
*/
 
// Augmented Dickey-Fuller test
p = 0;
l = 3;
{ alpha, tstat_adf, adf_t_crit } = vmadfmt(nyse, p, l);
print "tstat_adf"; tstat_adf;
print "adf_t_crit"; adf_t_crit;
 
// GLS Dickey-Fuller test
trend = 0;
maxlag = 12;
{ tstat_gls, zcrit } = dfgls(nyse, maxlag, trend);
print "tstat_gls"; tstat_gls;
print "zcrit"; zcrit;

/*
** PACF and ACF testing
*/
// Maximum number of autocorrelations
k = 12;
 
// Order of differencing
d = 1;
 
// Compute and plot the sample autocorrelations
{ acf_nyse, pacf_nyse } = lagreport (nyse, k, d);

/*
** Estimate the ARIMA(1,1,0) model
*/
call arimaFit(nyse, 1, 1, 0);
