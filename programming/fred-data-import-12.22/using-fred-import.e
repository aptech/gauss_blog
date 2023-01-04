FRED_API_KEY = "7a756a099f64c52f4657b4accc942137";

/*
** Simple data loading 
*/

fred_search("producer price index");

// Example One: 
// Loading a single series
PPI = fred_load("PPIACO");

// Display first 5 observations
head(PPI);

// Display last 5 observations
tail(PPI);

// Example Two: 
// Loading mutliple series
us_data = fred_load("PPI + T10Y2Y");

// Display data
head(us_data);

// Find summary statistics
dstatmt(us_data);

// Look at end of data
tail(us_data);

// Example Three: 
// Directly plotting data
plotXY(fred_load("PPIACO"), "PPIACO ~ date");

/*
** Advanced options using 
** the parameter list
*/

// First start by searching for
// CPI data

head(fred_series_search("consumer price index seasonally adjusted"));

// Data series ID is CPIAUCSL
// Now we will filter data to
// use all data 1971-01-01
params_cpi = fred_set("observation_start", "1971-01-01");

// Now load data series
cpi_m = fred_load("CPIAUCSL", params_cpi);

// Preview data
head(cpi_m);

plotXY(cpi_m, "CPIAUCSL ~ date");
 

