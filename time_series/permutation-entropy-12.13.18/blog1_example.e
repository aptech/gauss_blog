library pe;

x = {4, 7, 9, 10, 6, 11, 3};

// Set embedding dimension
D = 3;

// Set the embedded time delay
tau = 1;

// Initialize peOut struct
struct peOut pOut;

// Call pentropy
pOut = pentropy(x, D, tau);

print "The standard permutation entropy is :";
print pOut.h;

print "The normalized permutation entropy is :";
print pOut.h_norm;

print "The relative frequencies of the ordinal patterns:";
print pOut.relfreq;
