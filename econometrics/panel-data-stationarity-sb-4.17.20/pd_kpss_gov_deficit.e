/*
Lectura de la base de dades de PIB per capita
de Maddison.

Període: 1870-1994 per a 17 països (primera columna amb els anys).
*/

new;
cls;

library tspdlib;

/*
** Data loading
*/
// Load all variables 
data = loadd("govt-deficit-oecd.csv");

// Convert "Year" to a date variable
data = asDate(data, "%Y", "Year");

/*
** Transforming data
*/
// Names from variable
names_from = "Country";

// Values from variable
values_from = "Govt_deficit";

// Tranform to wide data
wide_data = dfWider(data, names_from, values_from);

/*
** Set up testing
*/
// Specify which model to 
// Allow for both constant and trend.
model = 2;

/*****************************************************************************/
/*****************************************************************************/
{ test_hom, test_het, kpsstest, m_br} = pd_kpss(wide_data, model);

// Plot results
plotPDKPSS(wide_data, m_br, kpsstest);
