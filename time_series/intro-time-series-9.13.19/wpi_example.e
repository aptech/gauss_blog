library tsmt;
 
// Load the variable 'ln_wpi' from the dataset
wpi = loadd("wpi1.dat", "ln_wpi");
 
// Transform to percent change
ch_wpi = (wpi[1:rows(wpi)-1] - wpi[2:rows(wpi)]) ./ wpi[2:rows(wpi)] * 100;
 
/*
** Unit root testing on level data
*/
 
// Augmented Dickey-Fuller test
p = 1;
l = 3;
{ alpha, tstat_adf, adf_t_crit } = vmadfmt(wpi, p, l);
print "Unit root ADF test results : tstat_adf"; tstat_adf;
print "Unit root ADF test results : adf_t_crit"; adf_t_crit;
 
// GLS Dickey-Fuller test
trend = 1;
maxlag = 12;
{ tstat_gls, zcrit } = dfgls(wpi, maxlag, trend);
print "Unit root GLS-ADF test results : tstat_gls"; tstat_gls;
print "Unit root GLS-ADF test results : zcrit"; zcrit;

/*
** Unit root testing on percent change data
*/
 
// Augmented Dickey-Fuller test
p = -1;
l = 3;
{ alpha, tstat_adf, adf_t_crit } = vmadfmt(ch_wpi, p, l);
print "Unit root ADF test results ch_wpi: tstat_adf"; tstat_adf;
print "Unit root ADF test results ch_wpi: adf_t_crit"; adf_t_crit;
 
// GLS Dickey Fuller test
trend = 0;
maxlag = 12;
{ tstat_gls, zcrit } = dfgls(ch_wpi, maxlag, trend);
print "Unit root GLS-ADF test results ch_wpi: tstat_gls"; tstat_gls;
print "Unit root GLS-ADF test results ch_wpi: zcrit"; zcrit;

/*
** PACF and ACF testing
*/
// Maximum number of autocorrelations
k = 12;
 
// Order of differencing
d = 0;
 
// Compute and plot the sample autocorrelations
{ acf_wpi, pacf_wpi } = lagreport(ch_wpi, k, d);

/*
** Estimate the arima model
*/
struct arimamtOut aOut;
aOut = arimaFit(wpi, 2, 1, 0);

// Compute and plot the sample autocorrelations
{ acf_wpi, pacf_wpi } = lagreport(aOut.e, k, d);
