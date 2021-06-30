/*
** Basic procedures
** 
** Accompanies the blog
** "Basics of GAUSS Procedures"
**
**  Published 7/17/2020
*/



/*
** Power function
*/
proc (1) = power(X, p); // 1. Procedure declaration
    local X_out;        // 2. Local variable list
 
    X_out = X ^ p;      // 3. Procedure body
 
    retp(X_out);        // 4. Procedure return
endp;     

// Call procedure that has not been defined
power(3, 2);

/*
** Two outputs
*/
// Create 4x1 vector
y = { 1, 3, 2, 1 };
 
// Call procedure
{ a, b } = range(y);
 
// Print results
print "The smallest value is: " a;
print "The largest value is : " b;
 
// Procedure that returns two items
proc (2) = range(X);
    local min, max;
 
    min = minc(X);
    max = maxc(X);
 
    retp(min, max);
endp;

/*
** Two inputs
*/
// Create 5x1 vector
z = { 1, 2, 3, 4, 9 };
 
m1 = average(z, "median");
print m1;
 
m2 = average(z, "mean");
print m2;
 
proc (1) = average(y, type_);
    local avg;
 
    if type_ $== "mean";
        avg = meanc(y);
    elseif type_ $== "median";
        avg = median(y);
    else;
        print "Second input, type_, not recognized";
        end;
    endif;
 
    retp(avg);
endp;
