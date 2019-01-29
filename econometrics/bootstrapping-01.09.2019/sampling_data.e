/*
**  This code accompanies the blog
**  "Basic Bootstrapping in GAUSS"
**  published on 01/09/2018 
**  on the Aptech blog.
*/

// For repeatable random samples
rndseed 4324;
 
v = { 7, 2, 9 };
 
/*
** Take a sample of length 3
** without replacement
*/
v_swor = sampleData(v, rows(v));
 
/*
** Take a sample of length 3
** with replacement
*/
v_swr = sampleData(v, rows(v), 1);
