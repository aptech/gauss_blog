/*
** This code accompanies the GAUSS blog
** "Panel data basics: One-way individual effects
** Published on 4/14/19
*/
new;
cls;

library pdlib;

// Load data
data = loadd(__FILE_DIR $+ "simple_data.dat");

// Assign groups variable
grps = data[., 1];

// Assign y~x matrix
reg_data = data[.,3:4];

// Find group means
grp_means = withinMeans(grps, reg_data);

print "Group means for Y and X:";
grp_means;
print ;

/*
** Demean the data. This procedure
** automatically computes the group means
** add removes them.
*/
y_bar = demeanData(grps, reg_data);

print "Demeaned data:";
y_bar;
print ;

// Extract variables
y_reg = y_bar[., 1];
x_reg = y_bar[., 2];

// Regress independent on dependent variables
coeff = inv(x_reg'x_reg)*(x_reg'y_reg);

// Print the fixed effects coefficient
print "Fixed effects coefficient:";
coeff;

// Use fixedEffects procedure
call fixedEffects(reg_data[., 1], reg_data[., 2], grps, 1);

