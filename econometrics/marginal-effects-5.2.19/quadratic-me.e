/*
** This file accompanies the GAUSS blog
** "untangling marginal effects" published 
** on 5/2/2019
*/

// Load data
data = loadd(getGAUSShome() $+ "/examples/auto2.dta", "price + mpg + weight");

// Extract variables
price = data[.,1];
mpg = data[., 2];
weight = data[., 3];

weight2 = (weight/1000).*(weight/1000);

/*
** Model Three
*/

// Call ols estimation
{ vnam, m, b, stb, vc, stderr, sigma, cx, rsq, resid, dwstat } = ols("", mpg, weight/1000~weight2);
x = weight/1000;
y_pred2 = (ones(rows(x),1)~x~x.^2)*b;

/*
** Create table
*/
tmp = seqa(1, 1, 5);
y_pred = 51.18-14.158*tmp+1.324*tmp.^2;

y_pred[1];
y_pred[2];
y_pred[3];
y_pred[4];
y_pred[5];

print "Differences";

y_pred[2]-y_pred[1];
y_pred[3]-y_pred[2];
y_pred[4]-y_pred[3];
y_pred[5]-y_pred[4];

print "Marginal Effects";

(y_pred[2]-y_pred[1])/1000;
(y_pred[3]-y_pred[2])/1000;
(y_pred[4]-y_pred[3])/1000;
(y_pred[5]-y_pred[4])/1000;

end;

// Add in line graph
h = 0.001;
tmp = seqa(1000, h, 5000/h);
me2 = b[2]+(2*b[3]*(tmp));

y_pred = 13418.80-(7.273097*tmp)+(0.001514*(tmp.^2));

me1 = (y_pred[2:rows(y_pred)]-y_pred[1:rows(y_pred)-1])./(tmp[2:rows(y_pred)]-tmp[1:rows(y_pred)-1]);

// Set up the plot
struct plotControl myPlot;
myPlot = plotGetDefaults("xy");

// Set up title
plotSetTitle(&myPlot, "Marginal effects with an power term", "Arial", 18);

// Set up x-axis label
plotSetXAxisLabel(&myPlot, "Weight");

// Set up y-axis label
plotSetYAxisLabel(&myPlot, "Marginal Effect of weight on price");

plotOpenWindow();

plotSetXRange(&myPlot, 1, 5);

//plotXY(myPlot, weight/1000, me);
plotXY(myPlot, tmp, me2);


// Set up zero line
plotSetLineColor(&myPlot, myPlot.lineColor[2]);

// Set up line style
plotSetLineStyle(&myPlot, 2);

