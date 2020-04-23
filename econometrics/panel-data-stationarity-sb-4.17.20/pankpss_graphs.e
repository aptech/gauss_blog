/*
Lectura de la base de dades de PIB per capita
de Maddison.

Període: 1870-1994 per a 17 països (primera columna amb els anys).
*/

new;
cls;

library carrionlib, tsmt;

// Load data
data = loadd(__FILE_DIR $+ "pankpss_data.dat");

// Print data headers
country_names = getheaders(__FILE_DIR $+ "pankpss_data.dat");

