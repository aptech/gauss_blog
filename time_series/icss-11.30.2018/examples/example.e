/*****************************************
* Replicates the emprirical aplication in
* Sanso, Aragó & Carrion (2002): "Testing for changes in the unconditional 
* variance of financial time series"
*
*****************************************/
new;
cls;

library icsslib;
/*
** Criteria for the kappa_2 test: 
** spectral quadratic window and 
** automatic bandwidth selection 
*/
cri = {1, 1};
cri = cri|4;

/*
** You may change the path and name of the input file: 
** han.dat (521 observations) 
*/
"HAN";
x = loadd(__FILE_DIR $+ "han2.dat");

// Demean the data
e = x-meanc(x);

/*
** Specify test
** Uses the Inclant-Tiao test
*/
test = 0; 

// Call icss test
{ cpr, nbr } = icss(e, test, cri);

// Print results
" using inclant-tiao test";
print "Number of breaks" nbr;
print "Break positions" cpr';

// Uses the kappa_1 test (corrects for non-mesokurtosis)
test = 1; 

// Call icss test
{cpr, nbr} = icss(e, test, cri);

// Print results
"using kappa 1 test";
print "Number of breaks" nbr;
print "Break positions" cpr';

/*
** Uses the kappa_2 test (corrects for non-mesokurtosis and 
** persistence in conditional variance)
*/
test = 2;

// Call icss test
{ cpr, nbr } = icss(e, test, cri);

// Print results
"using kappa 2 test";
print "Number of breaks" nbr;
print "Break positions" cpr';

/*
** S&P 500 data
*/
x = loadd(__FILE_DIR $+ "sp2.dat");
"SP";

// Demean data
e = x - meanc(x);

/*
** Specify test
** Uses the Inclant-Tiao test
*/
test = 0;

// Call icss test
{ cpr, nbr } = icss(e, test, cri);

// Print the results
print "Number of breaks" nbr;
print "Break positions" cpr';

// Uses the kappa_1 test (corrects for non-mesokurtosis)
test = 1;

// Call icss test
{ cpr, nbr } = icss(e, test, cri);

// Print the results
"using kappa 1 test";
print "Number of breaks" nbr;
print "Break positions" cpr';

/*
** Uses the kappa_2 test (corrects for non-mesokurtosis and 
** persistence in conditional variance)
*/
test = 2;

// Call icss test
{ cpr, nbr } = icss(e, test, cri);

// Print the results
"using kappa 2 test";
print "Number of breaks" nbr;
print "Break positions" cpr';

/*
** ftse data
*/
x = loadd(__FILE_DIR $+ "ftse2.dat");
"FTSE";

// Demean data
e = x - meanc(x);

/*
** Specify test
** Uses the Inclant-Tiao test
*/
test = 0;

// Call the icss test
{ cpr, nbr } = icss(e, test, cri);

// Print results
print "Number of breaks" nbr;
print "Break positions" cpr';

// Uses the kappa_1 test (corrects for non-mesokurtosis)
test = 1;

// Call the icss test
{ cpr, nbr } = icss(e, test, cri);

// Print results
"using kappa 1 test";
print "Number of breaks" nbr;
print "Break positions" cpr';

/*
** Uses the kappa_2 test (corrects for non-mesokurtosis and 
** persistence in conditional variance)
*/
test = 2;

{ cpr, nbr } = icss(e, test, cri);

// Print results
"using kappa 2 test";
print "Number of breaks" nbr;
print "Break positions" cpr';

/*
** Nik 500 data
*/
x = loadd(__FILE_DIR $+ "nik2.dat");

"NIK";

// Demean data
e = x - meanc(x);

/*
** Specify test
** Uses the Inclant-Tiao test
*/
test = 0;

// Call the icss test
{ cpr, nbr } = icss(e, test, cri);

// Print results
print "Number of breaks" nbr;
print "Break positions" cpr';

// Uses the kappa_1 test (corrects for non-mesokurtosis)
test = 1;

// Call the icss test
{ cpr, nbr } = icss(e, test, cri);

// Print results
"using kappa 1 test";
print "Number of breaks" nbr;
print "Break positions" cpr';

/*
** Uses the kappa_2 test (corrects for non-mesokurtosis and 
** persistence in conditional variance)
*/
test = 2;

// Call the icss test
{ cpr, nbr } = icss(e, test, cri);

// "using kappa 2 test";
print "Number of breaks" nbr;
print "Break positions" cpr';





