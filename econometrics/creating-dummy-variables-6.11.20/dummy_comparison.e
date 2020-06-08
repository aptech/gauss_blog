// Set seed for repeatable random numbers
rndseed 135345;

// Create uniform random numbers between 0 and 9
x = 9*rndu(5, 1);

// Set the breakpoints
// this says to create variables based 
// on cases where:
// x <= 1
// 1 < x <= 5
// 5 < x <= 7
v = { 1, 5, 7 };

dm = dummybr(x, v);

dm;
