/*
** This file accompanies the 1/18/2019 Aptech blog
** "How to Conduct Cointegration Tests in GAUSS 
**  It should be used to conduct unit root 
**  test using the TSMT unit root testing 
**  procedures. 
*/
new;
cls;
library tsmt;

// Set filename (with path) for loading
fname2 = __FILE_DIR $+ "commodity_mon.dat";


// Load data
data = loadd(fname2);
y_test_real = data[ ., 1 3];


/*
** Phillips-Perron
*/
// Step one set lags
lags = 2;

// Set model to include
// a trend
model = 0;

//Run Phillips-Perron
for i(1, cols(y_test_real), 1);
    print ("PP test with " $+ ntos(lags) $+ " lags");
    print ("Testing column " $+ ntos(i));
     { ppb, ppt, pptcrit } = vmppmt(y_test_real[.,i], model, lags);
    
    print "PPst statistic: "; ppt;
    print "Critical values " pptcrit;
    
    if ppt<pptcrit[3]and ppt>pptcrit[2];
        print "Reject the PP null hypothesis of unit root at 10%";
    elseif ppt<pptcrit[2]and ppt>pptcrit[1];
        print "Reject the PP null hypothesis of unit root at 5%";
    elseif ppt<pptcrit[1];
        print "Reject the PP null hypothesis of unit root at 1%";
    else;
        print ("Cannot reject the PP null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
endfor;

/*
** ADF testing
*/
// Step one set lags
lags = 2;

// Set model to include
// a trend
model = 0;

//Run adf tests
for i(1, cols(y_test_real), 1);
    print ("ADF test with " $+ ntos(lags) $+ " lags");
    print ("Testing column " $+ ntos(i));
    { alpha, tstat, adf_t_crit } = vmadfmt(y_test_real[., i], model, lags);
    
    print "ADF test statistic: "; tstat;
    print "Critical values " adf_t_crit;
    
    if tstat<adf_t_crit[3]and tstat>adf_t_crit[2];
        print "Reject the ADF null hypothesis of unit root at 10%";
    elseif tstat<adf_t_crit[2]and tstat>adf_t_crit[1];
        print "Reject the ADF null hypothesis of unit root at 5%";
    elseif tstat<adf_t_crit[1];
        print "Reject the ADF null hypothesis of unit root at 1%";
    else;
        print ("Cannot reject the ADF null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
endfor;

/*
** KPSS testing
*/
///Maximum number of lags to include
maxlag = 2;

//Include trend
trend = 0;

//Run adf tests
for i(1, cols(y_test_real), 1);
    print ("KPSS test");
    print ("Testing column " $+ ntos(i));
    
    //Run kpss test wihtout using quadratic spectral kernel
    { mat, crit } = kpss(y_test_real[., i], maxlag, trend);
    
    print;
    print "KPSS tstats for all possible lags:";;
    mat;
    print "Critical values:";;
    crit;
    if minc(mat)>crit[3]and minc(mat)<crit[2];
        print "Reject the KPSS null hypothesis of stationarity at 10%";
    elseif minc(mat)>crit[2] and minc(mat)<crit[1];
        print "Reject the KPSS null hypothesis of stationarity at 5%";
    elseif minc(mat)>crit[1];
        print "Reject the KPSS null hypothesis of stationarity at 1%";
    else;
        print ("Cannot reject the null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
endfor;
/*
** ADF testing
*/
// Step one set lags
lags = 2;

// Set model to include
// a trend
model = 0;

//Run adf tests
for i(1, cols(y_test_real), 1);
    print ("DFGLS test with " $+ ntos(lags) $+ " lags");
    print ("Testing column " $+ ntos(i));
    { tstat, adf_t_crit } = dfgls(y_test_real[., i]);
    
    print "DFGLS test statistic: "; tstat;
    print "Critical values " adf_t_crit;
    
    if tstat<adf_t_crit[3]and tstat>adf_t_crit[2];
        print "Reject the DFGLS null hypothesis of unit root at 10%";
    elseif tstat<adf_t_crit[2]and tstat>adf_t_crit[1];
        print "Reject the DFGLS null hypothesis of unit root at 5%";
    elseif tstat<adf_t_crit[1];
        print "Reject the DFGLS null hypothesis of unit root at 1%";
    else;
        print ("Cannot reject the DFGLS null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
endfor;


