// Load library
new;
library tsmt;


/*
** Data import
*/
fname = "data_shortrun.dta";
data_shortrun = loadd(fname);

/*
** Specifying the model
*/
// Three endogenous variable
// No exogenous variables  
formula = "Inflat + Unempl + Fedfunds";

/*
** Estimating default VAR model
*/
struct svarOut sOut;
sOut = svarFit(data_shortrun, formula);

/*
** Customizing the model
*/
// Three endogenous variable
// Two exogenous variables  
formula = "Inflat + Unempl + Fedfunds ~ trend + trendsq";

// Identification method
ident = "oir";

// Estimate VAR(2)
lags = 2;

// Constant off
const = 0;

// Control structure
struct svarControl sCtl;
sCtl = svarControlCreate();

// Set up user lags
sCtl.irf.nsteps = 40;
sCtl.irf.cl = 0.68;

/*
** Estimate VAR model
*/
struct svarOut sOut2;
sOut2 = svarFit(data_shortrun, formula, ident, const, lags, sCtl);

/*
** Visualizing dynamics
*/
// Plot IRFs
plotIRF(sout2, "Inflat");

// Plot FEVDs
plotFEVD(sout2, "Inflat");

// Plot HDs
plotHD(sout2, "Inflat");

