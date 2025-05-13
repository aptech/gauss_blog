// Load library
new;
library tsmt;


/*
** Load data
*/
// Load the dataset
fname = "data_longrun.dta";
data_longrun = loadd(fname);

/*
** Customizing the model
*/
// Specify the model formula with 
// two endogenous variables
formula = "GDPGrowth + Unemployment";

// Set identification method
ident = "bq";

// Constant off
const = 0;

// Set lags to missing to use optimal lags
lags = miss();

// Declare the control structure
struct svarControl sCtl;
sCtl = svarControlCreate();

// Set irf Cl
sctl.irf.cl = 0.68;

// Expand horizon
sctl.irf.nsteps = 40;

/*
** Estimate VAR model
*/
// Estimate the SVAR model with long-run restrictions
struct svarOut sOut;
sOut = svarFit(data_longrun, formula, ident, const, lags, sCtl);

// Specify shock variable
shk_var = "GDPGrowth";

/*
** Visualizing dynamics
*/
// Plot IRFs
plotIRF(sOut, shk_var);

// Plot FEVDs
plotFEVD(sOut, shk_var);

// Plot HDs
plotHD(sOut, shk_var);

