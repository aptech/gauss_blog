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

// Specify which model to use when no structural
// breaks are present.
// Allow for both constant and trend.
model_nobreaks = 2;
 
// Specify which model to use when structural
// breaks are present.
// Allow for changes in the mean and the slope.
model_breaks = 4;
 
/*
** Settings for structural break estimation
*/
 
// Declare structural break control structure
// and fill with default settings
struct breakControl b_ctl;
b_ctl = breakControlCreate(rows(wide_data));
 
// Print iteration output to the screen
b_ctl.printd = 1;
 
// Allow for the variance of the residuals
// to be different across segments.
b_ctl.hetvar = 1;
 
// Use LWZ to select the number of breaks.
b_ctl.estimbic = 1;
 
// Don't use sequential procedure to estimate breaks
b_ctl.estimseq = 0;

/*****************************************************************************/
/*****************************************************************************/
{ test_hom, test_het, kpsstest, m_br} = pankpss(govt_def, model_breaks, model_nobreaks, kernel, maxlags, b_Ctl);

// Set country names for generating graphs
varnames = "AUT"$|"FRA"$|"DEU"$|"IRL"$|"ITA"$|"LUX"$|"NOR"$|"ESP"$|"GBR";
plotPanKPSS(govt_def, m_br, kpsstest, 1995, 1, varnames);
