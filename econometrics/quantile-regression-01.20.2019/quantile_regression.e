/*
**  This code accompanies the blog
**  "The Basics of Quantile Regression"
**  published on 01/26/2018 
**  on the Aptech blog.
*/

// Load variables
y = loadd("islr_hitters.xlsx", "ln(salary)");
x = loadd("islr_hitters.xlsx", "AtBat + Hits + HmRun + Walks + Years + PutOuts");
 
/*
** Estimate the model
*/
 
// Set up tau for regression
tau = 0.10 | 0.25 | 0.50 |0.75 | 0.90;
 
/*
** Declare control structure
** and fill with default values
*/
struct qfitControl qCtl;
qCtl = qfitControlCreate();
 
// Add variable names
qCtl.varnames = "AtBat" $| "Hits" $| "HmRun" $| "Walks" $| "Years" $| "PutOuts";
 
// Turn on bootstrapped confidence intervals
qCtl.bootstrap = 1000;
 
// Call quantileFit
struct qfitOut qOut;
qOut = quantileFit(y, x, tau, qCtl);
