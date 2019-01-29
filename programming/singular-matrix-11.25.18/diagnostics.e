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
 
 /*
** Compute the pivoted R matrix
** and the permutation vector, 'P'
*/
{ R, P } = qre(X);
 
print P~diag(R);

// Create variables corresponding to table above
X_r = R[1:3,1:3];
y_r = R[1:3,4];
 
// Perform regression
b_r = y_r / X_r;
