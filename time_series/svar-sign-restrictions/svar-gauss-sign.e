// Load library
new;
library tsmt;

/*
** Data import
*/
fname = "data_narrsignrestrict.dta";
data_shortrun = loadd(fname);

/*
** Specifying the model
*/
// Three endogenous variable
// No exogenous variables  
formula = "lninflat + lnunempl + lnfedfunds";

// Estimate VAR(2)
lags = 2;

// Constant
const = 1;

/*
** Sign restriction setup
*/
// Specify identication method
ident = "sign";

// Declare controls structure
// Fill with defaults
struct svarControl Sctl;
Sctl = svarControlCreate();

// Specify to use sign restrictions
Sctl.irf.ident = "sign";

// Specify which shock variable is restricted
Sctl.irf.restrictedShock = { 1, 2, 3 };

// Set up restrictions horizon
Sctl.irf.restrictionHorizon = { 1, 1, 1 };

// Set up restrictions matrix
// A row for each shock, and a column for each variable
//             lninflat     lnunempl     lnfedfunds
// shock           
// supply          -           -             -
// demand          +           -             +
// monetary        -           +             +
sCtl.irf.signRestrictions = { -1 -1 -1,
                               1 -1  1,
                              -1  1  1 };

/*
** Estimate VAR model
*/
struct svarOut sOut;
sOut = svarFit(data_shortrun, formula, ident, const, lags, sCtl);

/*
** Visualizing dynamics
*/
// Plot IRFs
plotIRF(sOut, "lnunempl", 1);

// Plot FEVDs
plotFEVD(sOut, "lnunempl", 1);

// Plot HDs
plotHD(sOut, "lnunempl", 1);

