/*
** Simple data loading 
*/

fred_series_search("sp500");

// Example One: 
// Loading a single series
sp_500 = fred_load("sp500");

// Display first 5 observations
head(sp_500);

// Display last 5 observations
tail(sp_500);

// Example Two: 
// Loading mutliple series
us_data = fred_load("sp500 + T10Y2Y");

// Display data
head(us_data);
tail(us_data);

// Example Three: 
// Directly plotting data
plotXY(fred_load("sp500"), "sp500~date");

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
plotXY(cpi_m, "CPIAUCSL~date");
 

