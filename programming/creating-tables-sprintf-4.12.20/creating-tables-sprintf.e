/*
** Using sprintf
** 
** Accompanies the blog
** "How to Create a Simple Table with sprintf in GAUSS"
**
**  Published 4/02/2020
*/

// Simple printing example with text
sprintf("%s is %d", "Steve", 38);

/*
** First iteration of table
*/
// Create a 3x1 string array
var_names = "population" $| "poverty rate" $| "inflation";
 
// Create two 3x1 vectors
beta_ = { -0.65582591,
           0.94648444,
           1.7365981 };
 
se = {  0.19095146,
        0.25047475,
        0.11009904 };
 
sprintf("%s %f %f", var_names, beta_, se);

/*
** Changing format of the 
** table for improved appearance
*/
// Create 3x1 string array
var_names = "population" $| "poverty rate" $| "inflation";
 
// Create two 3x1 vectors
beta_ = { -0.65582591,
           0.94648444,
           1.7365981 };
 
se = {  0.19095146,
        0.25047475,
        0.11009904 };
 
sprintf("%12s %9f %9f", var_names, beta_, se);

// Surround SE format specifier with parentheses
sprintf("%12s %9f (%9f)", var_names, beta_, se);


// Decrease field width of final column
// and add one space before the '('
sprintf("%12s %9f  (%8f)", var_names, beta_, se);

/*
** Precision
*/
// Decrease field width of final column
// and add one space before the '('
sprintf("%12s %9f  (%8f)", var_names, beta_, se);

// Decrease field width for numeric columns to remove extra spaces
sprintf("%12s %7.4f  (%6.4f)", var_names, beta_, se);
