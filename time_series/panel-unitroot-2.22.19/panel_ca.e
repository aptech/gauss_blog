/*
** Tests for unit roots in panel data
** Countries included in the panel:
**      United States
**      United Kingdom
**      Australia
**      South Africa
**      India
*/

new;
cls;
library tspdlib;

// Load date file
ca_panel = loadd("panel_ca.dat");

// Maximum number of lags for ds; 
pmax = 12;  

// Information Criterion: 
ic = 3;    

// Trimming rate
trimm = 0.10;  

// Run first with one break
nbreak = 1;

// Call PD LM with level break
{ Nlm, Ntb, Np, PDlm, pval } = PDLMlevel(ca_panel[.,2:cols(ca_panel)], 1, pmax, ic, trimm, nbreak);

// Print results
"Individual results:"
seqa(1, 1, cols(ca_panel[.,2:cols(ca_panel)]))~Nlm~Ntb~Np;

print "The panel LM statistic is: " PDlm;
print "With a p-value of: " pval;

// Run first with two breaks
nbreak = 2;

// Call PD LM with level break
{ Nlm, Ntb, Np, PDlm, pval } = PDLMlevel(ca_panel[.,2:cols(ca_panel)], 1, pmax, ic, trimm, nbreak);

// Print results
"Individual results:"
seqa(1, 1, cols(ca_panel[.,2:cols(ca_panel)]))~Nlm~Ntb~Np;

print "The panel LM statistic is: " PDlm;
print "With a p-value of: " pval;

