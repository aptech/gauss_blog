new;
library maxlikmt;

// Single data set example
y = { 5, 0, 1, 1, 0, 3, 2, 3, 4, 1 };

// Theta vector
theta_plot = seqa(0.1, 0.1, 3.5/0.1);

// Likelihood function
likelihood = (exp(-10*theta_plot).*theta_plot^20)/207360;

// Plot the likelihood function
struct plotControl myPlot;
myPlot = plotGetDefaults("xy");

// Set title on the graph
plotSetTitle(&myPlot, "Likelihood and Log-Likelihood Function of Poisson Function", "Arial", 16); 

// Set the first curve, 'y1' to the left Y-axis
// Set the second curve 'y2' to the right Y-axis
string which = { "left", "right" };
plotSetWhichYAxis(&myPlot, which);

// Set line style 
plotSetLineStyle(&myPlot, 1|2);

// Set up the tic style
plotSetTicLabelFont(&myPlot, "Arial", 14);

// Turn on grid
plotSetGrid(&myPlot, "on");

// Turn on the legend
plotSetLegend(&myPlot, "Likelihood"$|"Log-Likelihood", "top left");
myPlot.Legend.fontSize = 12;
myPlot.Legend.font = "Arial";

plotCanvasSize("px", 1200|600);

// Set line colors
plotXY(myPlot, theta_plot, likelihood/1E-7~ln(likelihood/1E-7));

// Find maximum likelihood estimator
theta_start = 1.2;

// Control structure
//Declare 'ctl' to be a maxlikmtControl struct
struct maxlikmtControl ctl;

//Fill 'ctl' with default settings
ctl = maxlikmtControlCreate();

ctl.numObs = rows(y);

//Declare 'out' to be a maxlikmtResults
//structure to hold the estimation results
struct maxlikmtResults out;

//Perform estimation and print report
out = maxlikmtprt(maxlikmt(&lpsn, theta_start, y, ctl));

print "Estimated theta :";
out.par.obj.m;

//Log-likelihood procedure
proc lpsn(theta, y, ind);
    local n;
    struct modelResults mm;
    
    n = rows(y);
    
    //If the first element of 'ind' is non-zero
    //compute the function value
    if ind[1];
        mm.function = -n*theta + sumc(y)*ln(theta) - ln(207360);
    endif;
    
    retp(mm);
    
endp;

