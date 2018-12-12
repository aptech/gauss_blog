// Specify filename
fname = __FILE_DIR $+ "apples_cluster.dat";

// Estimate model using ols
struct olsmtControl oCtl;
oCtl = olsmtControlCreate();

// Estimate model 
struct olsmtOut oOut;
oOut = olsmt(fname, "prod~acres", oCtl);

// Set up cluster id variable
oCtl.clusterId = "state";

// Turn on cluster vce
oCtl.cov = "cluster";

print ;
print ;
// Estimate model 
struct olsmtOut oOut;
oOut = olsmt(fname, "prod~acres", oCtl);
