/*
Lectura de la base de dades de PIB per capita
de Maddison.

Període: 1870-1994 per a 17 països (primera columna amb els anys).
*/

new;
cls;

library carrionlib, tsmt;

// Load data
data = loadd(__FILE_DIR $+ "pd_kpss.gdat");

// Print data headers
getheaders(__FILE_DIR $+ "pd_kpss.gdat");

/*
** Calculation of the test with 1 change to the mean
*/

// Set kernel
kernel = 1;

// Set maxlags
maxlags = 5;

// Maximum number of structural changes allowed
m = 5;

// Model when there are no changes.
// Second model: individual effects + tendency
model_nobreaks= 2;

//  Model when there are changes.
// Changes in the mean and the slope
model_breaks = 4;

/*
** Settings for structural break estimation
*/
// Declare structural break control structure
struct breakControl bCtl;

// Set control structure members
// to default values
bCtl = breakControlCreate(rows(data));

// Set to print the output from the iterations
bCtl.printd = 1;

// Option for construction of F-tests
//  Set to 1 if want to allow for the variance of the residuals
//  to be different across segments. If hetvar=0, the variance
//  of the residuals is assumed constant across segments
//  and constructed from the full sample. This option is not available
//  when robust = 1.
bCtl.hetvar = 1;

// Set to 1 if want to estimate the model with
// the number of breaks selected by LWZ.
bCtl.estimLWZ = 1;

// Set to 1 if want to estimate the model with
// the number of breaks selected using the
// sequential procedure.
bCtl.estimseq = 0;

/*****************************************************************************/
/*****************************************************************************/
{ test_hom, test_het, kpsstest, m_br } = pankpss(data, model_breaks, model_nobreaks, kernel, maxlags, bCtl);

z = hadritest(data, 2);
