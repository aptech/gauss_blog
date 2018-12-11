new;
cls;

library pe;

// Load the data
x_seg = loadd(__FILE_DIR $+ "segmented_djia.dat");   
x_seg = packr(x_seg);

// Embedding dimension
D = 5;                     
print "Permutation order:" D;

// Time delay
tau = 1;
print "Time delay:" tau;
print;

/* 
** H contains PE statistic in the very first row 
** and the relative frequencies in the remaining rows
*/        
H_mat = tvPentropy(x_seg, D, tau, "noise");    

//Plot control structure
struct plotControl myplot;
myplot = plotGetDefaults("xy");

plotSetTitle(&myPlot, "Time-varying Permutation Entropy", "Arial", 18);
plotSetXLabel(&myPlot, "Obs.", "Arial", 12);
plotSetYLabel(&myPlot, "Normalized Permutation Entropy", "Arial", 12);
plotSetGrid(&myPlot, "off");

// Time varying entropy statistic
plotXY(myPlot, seqa(1,1, cols(H_mat)), H_mat[1,.]');

//Create time vector
dtstart = 19010102000000;
dtend = 20180101000000;
