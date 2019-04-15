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


// Use randomEffects procedure
call randomEffects(reg_data[., 1], reg_data[., 2], grps, 1);

