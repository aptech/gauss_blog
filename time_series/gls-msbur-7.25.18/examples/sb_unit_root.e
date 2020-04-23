/*
**  This code accompanies the Aptech blog
**  Why the GLS unit root test with multiple 
**  structural breaks? 
**
**  Date : 7/25/2018
**
**  Additional required libraries: 
**       tsmt   
**       msbur
**      
*/

new;
library tsmt, msbur;

// Load the data
housing_wa = loadd(__FILE_DIR $+ "housing_wa");
y_wa = housing_wa[., 5];

housing_ar = loadd(__FILE_DIR $+ "housing_ar");
y_ar= housing_ar[., 4];

zhvi = loadd(__FILE_DIR $+ "zhvi_cities.csv");
y_seattle = zhvi[., 2];
y_phoenix = zhvi[., 3];

dtstart1 = 19910101;
freq1 = 4;

dtstart2 = 19960404;
freq2 = 12;

/**********************************
STANDARD ADF TESTING
***********************************/
/*
** Unit root testing 
** Step two: Set model parameters
** Set deterministic trend
*/
p = 1;

// Set lags to follow Enders
lags = 0;

/*
** Step three: Run adf tests
** Washington
*/
{ alpha, tstat, adf_t_crit } = vmadfmt(y_wa, p, lags);

print "WASHINGTON:";
print "Estimated alpha coefficient:";
print alpha;
print ;

print "Alpha t-stat:";
print tstat;
print ;

print "Critical values at 1%, 5%, 10%, 90%, 95%, 99%:";
print adf_t_crit';

/*
** Step three: Run adf tests
** Seattle
*/
{ alpha, tstat, adf_t_crit } = vmadfmt(y_seattle, p, lags);

print "SEATTLE:";
print "Estimated alpha coefficient:";
print alpha;
print ;

print "Alpha t-stat:";
print tstat;
print ;

print "Critical values at 1%, 5%, 10%, 90%, 95%, 99%:";
print adf_t_crit';

/*
** Step three: Run adf tests
** Arizona
*/
{ alpha, tstat, adf_t_crit } = vmadfmt(y_ar, p, lags);

print "ARIZONA:";
print "Estimated alpha coefficient:";
print alpha;
print ;

print "Alpha t-stat:";
print tstat;
print ;

print "Critical values at 1%, 5%, 10%, 90%, 95%, 99%:";
print adf_t_crit';

{ tstat, zcrit } = dfgls(y_wa, lags, p);
tstat;
zcrit;

/*
** Step three: Run adf tests
** Phoenix
*/
{ alpha, tstat, adf_t_crit } = vmadfmt(y_phoenix, p, lags);

print "PHOENIX:";
print "Estimated alpha coefficient:";
print alpha;
print ;

print "Alpha t-stat:";
print tstat;
print ;

print "Critical values at 1%, 5%, 10%, 90%, 95%, 99%:";
print adf_t_crit';

{ tstat, zcrit } = dfgls(y_phoenix, lags, p);
tstat;
zcrit;
/**********************************
MS-GLS TESTING
***********************************/
// Set penalty to 0 for maic
penalty = 0;
kmax = 0;
kmin = 0;

// Set the model
model = 3|1|2;

// Set up estimation
estimation = 1|20; 

/*
** Compute the test statistics
** Washington
*/


{pt, mpt, adf, za, mza, msb, mzt, min_tb, cbar} = sbur_multiple_gls(y_wa, model, penalty, kmax, kmin, estimation);

// Set T
T = rows(housing_wa[., 4]);

// Set up lambda
lam=(min_tb/T)|zeros(5-rows(min_tb), 1); 

// Call the msbur routine
{critical_msb, critical_mza, critical_mzt, critical_pt} = msbur_rs(lam, cbar);

print "WASHINGTON:";
print "Test statistics and critical values (5% levelof significance)";
min_tb;
print "PT test " pt "cv(5%): " critical_pt[3];
print "MPT test " mpt "cv(5%): " critical_pt[3];
print "ADF test " adf "cv(5%): " critical_mzt[3];
print "ZA test " za "cv(5%): " critical_mza[3];
print "MZA test " mza "cv(5%): " critical_mza[3];
print "MSB test " msb "cv(5%): " critical_msb[3];
print "MZT test " mzt "cv(5%): " critical_mzt[3];

/*
** Compute the test statistics
** Seattle
*/
{pt, mpt, adf, za, mza, msb, mzt, min_tb, cbar} = sbur_multiple_gls(y_seattle, model, penalty, kmax, kmin, estimation);

// Set time dimension
T = rows(y_seattle);

// Set up lambda
lam=(min_tb/T)|zeros(5-rows(min_tb), 1); 

// Call the msbur routine
{critical_msb, critical_mza, critical_mzt, critical_pt} = msbur_rs(lam, cbar);

// Print results
print "SEATTLE:";
print "Test statistics and critical values (5% levelof significance)";
min_tb;
print "PT test " pt "cv(5%): " critical_pt[3];
print "MPT test " mpt "cv(5%): " critical_pt[3];
print "ADF test " adf "cv(5%): " critical_mzt[3];
print "ZA test " za "cv(5%): " critical_mza[3];
print "MZA test " mza "cv(5%): " critical_mza[3];
print "MSB test " msb "cv(5%): " critical_msb[3];
print "MZT test " mzt "cv(5%): " critical_mzt[3];

/*
** Compute the test statistics
** Arizona
*/

// Call the estimation 
{pt, mpt, adf, za, mza, msb, mzt, min_tb, cbar} = sbur_multiple_gls(y_ar, model, penalty, kmax, kmin, estimation);

// Set time dimension
T = rows(housing_wa[., 4]);

// Set up lambda
lam = (min_tb/T)|zeros(5-rows(min_tb), 1); 

// Call the msbur routine
{critical_msb, critical_mza, critical_mzt, critical_pt} = msbur_rs(lam, cbar);

// Print results
print "ARIZONA:";
min_tb;
print "Test statistics and critical values (5% levelof significance)";

print "PT test " pt "cv(5%): " critical_pt[3];
print "MPT test " mpt "cv(5%): " critical_pt[3];
print "ADF test " adf "cv(5%): " critical_mzt[3];
print "ZA test " za "cv(5%): " critical_mza[3];
print "MZA test " mza "cv(5%): " critical_mza[3];
print "MSB test " msb "cv(5%): " critical_msb[3];
print "MZT test " mzt "cv(5%): " critical_mzt[3];

/*
** Compute the test statistics
** Phoenix
*/

// Call the estimation 
{pt, mpt, adf, za, mza, msb, mzt, min_tb, cbar} = sbur_multiple_gls(y_phoenix, model, penalty, kmax, kmin, estimation);

// Set time dimension
T = rows(y_phoenix);
lam=(min_tb/T)|zeros(5-rows(min_tb), 1); 

// Call the msbur routine
{critical_msb, critical_mza, critical_mzt, critical_pt} = msbur_rs(lam, cbar);

// Print results
print "PHOENIX:";
min_tb;
print "Test statistics and critical values (5% levelof significance)";

print "PT test " pt "cv(5%): " critical_pt[3];
print "MPT test " mpt "cv(5%): " critical_pt[3];
print "ADF test " adf "cv(5%): " critical_mzt[3];
print "ZA test " za "cv(5%): " critical_mza[3];
print "MZA test " mza "cv(5%): " critical_mza[3];
print "MSB test " msb "cv(5%): " critical_msb[3];
print "MZT test " mzt "cv(5%): " critical_mzt[3];
