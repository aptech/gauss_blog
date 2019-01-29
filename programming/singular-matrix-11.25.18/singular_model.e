/*
**  This code accompanies the blog
**  "Diagnosing a singular matrix"
**  published on 11/25/2018 
**  on the Aptech blog.
*/

fname = "golf_ballflight.csv";
 
// Load the dependent variable
y = loadd(fname, "carry");
 
// Load all variables except 'carry'
X = loadd(fname, ". -carry");
 
// Compute least squares estimates
XTX = X'X;
XXI = invpd(XTX);
b_hat = XXI * X'y;

