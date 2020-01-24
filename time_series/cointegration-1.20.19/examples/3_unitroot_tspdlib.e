/*
** This file accompanies the 1/18/2019 Aptech blog
** "How to Conduct Cointegration Tests in GAUSS 
**  It should be used to conduct unit root 
**  test using the tspdlib unit root testing 
**  procedures. 
*/
new;
cls;
library tspdlib;

// Set filename (with path) for loading
fname2 = __FILE_DIR $+ "commodity_mon.dat";

// Load data
data = loadd(fname2);
y_test_real = data[ ., 1 3];
y_test_nominal = data[ ., 2 4];

//Number of observations
T = rows(y_test_real);
 
// Maximum number of lags for ds;
pmax = 3;

// Information Criterion: 
// 1 = Akaike; 2 = Schwarz; 3 = t-stat sign.
ic = 1;

// Long-run consistent variance estimation method
varm = 2;

// bandwidth lag
bwl = round(4 * (T/100)^(2/9));
bwl = 1;

format /m1 /rd 8,3;

/*
** ADF testing
*/
// Set model to include
// a trend
model = 0;

//Run ADF tests
for i(1, cols(y_test_real), 1);
    print ("ADF test with " $+ ntos(pmax) $+ " lags");
    print ("Testing column " $+ ntos(i));
    { ADFtau, ADFp, cvADF } = ADF(y_test_real[.,i], model, pmax, ic);
    
    print "ADF test statistic: "; ADFtau;
    print "Critical values: "; cvADF;
    print "P-value of t-stat: "; ADFp; 
    
    if ADFtau<cvADF[3]and ADFtau>cvADF[2];
        print "Reject the ADF null hypothesis of unit root at 10%";
    elseif ADFtau<cvADF[2]and ADFtau>cvADF[1];
        print "Reject the ADF null hypothesis of unit root at 5%";
    elseif ADFtau<cvADF[1];
        print "Reject the ADF null hypothesis of unit root at 1%";
    else;
        print ("Cannot reject the ADF null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
endfor;


/*
** PP testing
*/
//Run Phillips-Perron
for i(1, cols(y_test_real), 1);
    print ("PP test with " $+ ntos(pmax) $+ " lags");
    print ("Testing column " $+ ntos(i));
    { Zt, Za, cvZt, cvZa }  = PP(y_test_real[.,i], model, bwl, varm);
    
    print "PP Zt statistic: "; Zt;
    print "Zt Critical values " cvZt;
    print "PP Za statistic: "; Za;
    print "Za Critical values " cvZa;
    
    if zt<cvZt[3]and zt>cvZt[2];
        print "Reject the PP Zt null hypothesis of unit root at 10%";
    elseif zt<cvZt[2]and zt>cvZt[1];
        print "Reject the PP Zt null hypothesis of unit root at 5%";
    elseif zt<cvZt[1];
        print "Reject the PP Zt null hypothesis of unit root at 1%";
    else;
        print ("Cannot reject the PP Zt null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
    
     if Za<cvZa[3]and Za>cvZa[2];
        print "Reject the PP Za null hypothesis of unit root at 10%";
    elseif Za<cvZa[2]and Za>cvZa[1];
        print "Reject the PP Za null hypothesis of unit root at 5%";
    elseif Za<cvZa[1];
        print "Reject the PP Za null hypothesis of unit root at 1%";
    else;
        print ("Cannot reject the PP Za null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
endfor;

/*
** ADF-GLS testing
*/
// Set model to include
// a trend
model = 1;

//Run ADF-GLS tests
for i(1, cols(y_test_real), 1);
    print ("ADF test with " $+ ntos(pmax) $+ " lags");
    print ("Testing column " $+ ntos(i));
    { GLStau, GLSp, cvGLS } = DFGLS(y_test_real[.,i], model, pmax, ic);
    
    print "ADF-GLS test statistic: "; GLStau;
    print "Critical values: "; cvGLS;
    print "P-value of t-stat: "; GLSp; 
    
    if GLStau<cvGLS[3]and GLStau>cvGLS[2];
        print "Reject the GLS null hypothesis of unit root at 10%";
    elseif GLStau<cvGLS[2]and GLStau>cvGLS[1];
        print "Reject the GLS null hypothesis of unit root at 5%";
    elseif GLStau<cvGLS[1];
        print "Reject the GLS null hypothesis of unit root at 1%";
    else;
        print ("Cannot reject the GLS null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
endfor;

/*
** KPSS testing
*/

//Run KPSS tests
for i(1, cols(y_test_real), 1);
    print ("KPSS test");
    print ("Testing column " $+ ntos(i));
    
    //Run kpss test 
    { KPSS, cvKPSS } = LMkpss(y_test_real[., i], model, bwl, varm);
    
    print;
    print "KPSS tstats for all possible lags:";;
    KPSS;
    print "Critical values:";;
    cvKPSS;
    if minc(KPSS)>cvKPSS[3]and minc(KPSS)<cvKPSS[2];
        print "Reject the KPSS null hypothesis of stationarity at 10%";
    elseif minc(KPSS)>cvKPSS[2] and minc(KPSS)<cvKPSS[1];
        print "Reject the KPSS null hypothesis of stationarity at 5%";
    elseif minc(KPSS)>cvKPSS[1];
        print "Reject the KPSS null hypothesis of stationarity at 1%";
    else;
        print ("Cannot reject the null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;

endfor;

/*
** LM testing
*/
//LM
for i(1, cols(y_test_real), 1);
    print ("LM test with " $+ ntos(pmax) $+ " lags");
    print ("Testing column " $+ ntos(i));
    { LMtau, LMp, cvLM }    = LM(y_test_real[., i], pmax, ic);
    
    print "LM test statistic: "; LMtau;
    print "Critical values: "; cvLM;
    print "P-value of t-stat: "; LMp; 
    
    if LMtau<cvLM[3]and LMtau>cvLM[2];
        print "Reject the GLS null hypothesis of unit root at 10%";
    elseif LMtau<cvLM[2]and LMtau>cvLM[1];
        print "Reject the GLS null hypothesis of unit root at 5%";
    elseif LMtau<cvLM[1];
        print "Reject the GLS null hypothesis of unit root at 1%";
    else;
        print ("Cannot reject the GLS null hypothesis of unit root for data in column " $+ ntos(i)); 
    endif;
endfor;

end;
