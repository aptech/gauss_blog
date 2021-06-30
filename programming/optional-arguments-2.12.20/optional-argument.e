/*
** This example demonstrates
** how to use an procedure with
** optional arguments and default
** values
** 
** It accompanies the blog
** "The Basics of Optional Arguments 
**  in GAUSS Procedures"
**
**  Published 2/12/2020
*/

a = 9;
b = 3.14;
c = 2.54;
 
print "call 1";
myProc(a);
 
print "call 2";
myProc(a, b);
 
print "call 3";
myProc(a, b, c);
 
// Procedure declaration with optional inputs
proc (0) = myProc(a, ...);
    // Since ‘b’ and ‘c’ are not declared as inputs
    // in the procedure declaration, they must be
    // declared as local variables
    local b, c, idx;
 
    // The range of optional inputs we want to return
    idx = { 1, 2 };
 
    // If ‘b’ or ‘c’ are not passed in, return
    // 29 or 33 respectively
    { b, c } = dynargsGet(idx, 29, 33);
 
    print "a = " a;
    print "b = " b;
    print "c = " c;
    print "---------";
endp;
