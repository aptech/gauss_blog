/*
** This program file accompanies the GAUSS blog, 
** `Transforming Panel Data to Long Form in GAUSS
*/

/*
** Example One: Basic example
*/
// Load data 
pop_wide = loadd("state_pop.gdat");
head(pop_wide);

// Identify columns
columns = "2020"$|"2021"$|"2022";

// Variable for storing names
names_to = "Year";

// Variable for storing values
values_to = "Population";

// Convert data using df_longer
pop_long = dfLonger(pop_wide, columns, names_to, values_to);
head(pop_long);

// Check variable type
getColTypes(pop_long);

/*
** Example Two: Set type
*/
// Load data 
pop_wide = loadd("state_pop.gdat");
head(pop_wide);

// Identify columns
columns = "2020"$|"2021"$|"2022";

// Variable for storing names
names_to = "Year";

// Variable for storing values
values_to = "Population";

// Declare pivotControl structure and fill with default values
struct pivotControl pctl;
pctl = pivotControlCreate();

// Specify prefix
pctl.names_types = {"Year" "date"};

// Convert data using df_longer
pop_long = dfLonger(pop_wide, columns, names_to, values_to, pctl);
head(pop_long);
getColTypes(pop_long[., "Year"]);

/*
** Example Three: Stripping prefix 
*/
// Load data 
pop_wide2 = loadd("state_pop2.gdat");
head(pop_wide2);

// Declare pivotControl structure and fill with default values
struct pivotControl pctl;
pctl = pivotControlCreate();

// Specify prefix
pctl.names_prefix = "yr_";

// Get all column names and remove the first column, 'State'
columns = getColNames(pop_wide2);
columns = trimr(columns, 1, 0);

// Variable for storing names
names_to = "Years";

// Variable for storing values
values_to = "Population";

// Convert data using df_longer
pop_long = dfLonger(pop_wide2, columns, names_to, values_to, pctl);
head(pop_long);

/*
** Example Four: Split names using separator
*/
// Load data
pop_wide3 = loadd("state_pop3a.gdat");

// Preview data
head(pop_wide3);

// Declare pivotControl structure and fill with default values
struct pivotControl pctl2;
pctl2 = pivotControlCreate();

// Specify how to separate names
pctl2.names_sep_split = "_";

// Variable for storing names
names_to = "Location"$|"Year";

// Get all column names and remove the first column, 'State'
columns = getColNames(pop_wide3);
columns = trimr(columns, 1, 0);

// Variable for storing values
values_to = "Population";

// Call dfLonger with optional control structure
pop_long = dfLonger(pop_wide3, columns, names_to, values_to, pctl2);

// Preview data
head(pop_long);

/*
** Example Five: Split names using regEx
*/
// Load data
pop_wide4 = loadd("state_pop4a.gdat");

// Preview data
head(pop_wide4);

// Declare pivotControl structure and fill with default values
struct pivotControl pctl4;
pctl4 = pivotControlCreate();

// Specify how to separate names
pctl4.names_pattern_split = "([a-zA-Z])([0-9]+)";

// Variable for storing names
names_to = "Location"$|"Year";

// Get all column names and remove the first column, 'State'
columns = getColNames(pop_wide4);
columns = trimr(columns, 1, 0);

// Variable for storing values
values_to = "Population";

// Call dfLonger with optional control structure
pop_long = dfLonger(pop_wide4, columns, names_to, values_to, pctl4);

head(pop_long);

/*
** Example Six: Split names and create multiple values variables
*/
// Declare pivotControl structure and fill with default values
struct pivotControl pctl5;
pctl5 = pivotControlCreate();

// Specify how to separate names
pctl5.names_pattern_split = "([urban|rural])([0-9]+)";

// Variable for storing names
names_to = ".value"$|"Year";

// Variable for storing values
values_to = "";

// Call dfLonger with optional control structure
pop_long = dfLonger(pop_wide4, columns, names_to, values_to, pctl5);
head(pop_long);
