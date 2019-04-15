/*
** This code accompanies the GAUSS blog
** "Panel data basics: One-way individual effects
** Published on 4/14/19
*/
new;
cls;

#include panel.sdf
#include panel.src
#include pdutil.src

// Load data
path = "C:\\Users\\Erica\\Documents\\GitHub\\gauss_blog\\econometrics\\individual-effects-4.15.19\\";
data = loadd(path $+ "simple_data.dat");

// Assign groups variable
grps = data[., 1];

// Assign y~x matrix
reg_data = data[.,3:4];


// Use fixedEffects procedure
call randomEffects(reg_data[., 1], reg_data[., 2], grps, 1);

