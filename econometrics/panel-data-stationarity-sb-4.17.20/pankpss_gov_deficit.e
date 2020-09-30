/*
Lectura de la base de dades de PIB per capita
de Maddison.

Període: 1870-1994 per a 17 països (primera columna amb els anys).
*/

new;
cls;

library carrionlib, pdlib;

// Load data
data = loadd(__FILE_DIR $+ "govt-deficit-oecd.csv", "Year + cat(Country) + Govt_deficit");
wide_data = pdWide(data);

// Delete first column which
// contains year
govt_def = delcols(wide_data, 1);

// Set kernel
kernel = 1;

// Set maxlags
maxlags = 5;

// Maximum humber of structural changes allowed
m = 5;

// Model when there are no changes.
// Second model: individual effects + tendency
model0 = 2;

//  Model when there are changes.
// Changes in the mean and the slope
model = 4;

/*
** Settings for structural break estimation
*/
// Declare structural break control structure
struct breakControl bCtl;

// Set control structure members
// to default values
bCtl = breakControlCreate(rows(govt_def));

// Set to print the output from the iterations
bCtl.printd = 1;

//  Set to 1 if want to allow for the variance of the residuals
//  to be different across segments. This option is not available
//  when robust = 1.
bCtl.hetvar = 1;

// Select number of breaks selected by BIC.
bCtl.estimbic = 1;

// Estimate breaks using sequential procedure.
bCtl.estimseq = 0;

/*****************************************************************************/
/*****************************************************************************/
{ test_hom, test_het, kpsstest, m_br} = pankpss(govt_def, model, model0, kernel, maxlags, bCtl);

// Set country names for generating graphs
varnames = "AUT"$|"FRA"$|"DEU"$|"IRL"$|"ITA"$|"LUX"$|"NOR"$|"ESP"$|"GBR";
plotPanKPSS(govt_def, m_br, kpsstest, 1995, 1, varnames);
