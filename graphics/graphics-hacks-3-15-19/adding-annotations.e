new;

/*
** First date of unemployment data
** date format - YYYYMM
*/
unemployment_start = 200401;

// Indicate this is monthly data
unemployment_frequency = 12;
unemployment_rate = { 5.7 5.6 5.8 5.6 5.6 5.6 5.5 5.4 5.4 5.5 5.4 5.4
5.3	5.4	5.2	5.2	5.1	5.0	5.0	4.9	5.0	5.0	5.0	4.9
4.7	4.8	4.7	4.7	4.6	4.6	4.7	4.7	4.5	4.4	4.5	4.4
4.6	4.5	4.4	4.5	4.4	4.6	4.7	4.6	4.7	4.7	4.7	5.0
5.0	4.9	5.1	5.0	5.4	5.6	5.8	6.1	6.1	6.5	6.8	7.3
7.8	8.3	8.7	9.0	9.4	9.5	9.5	9.6	9.8	10.0 9.9 9.9
9.7	9.8	9.9	9.9	9.6	9.4	9.5	9.5	9.5	9.5	9.8	9.4
9.1	9.0	9.0	9.1	9.0	9.1	9.0	9.0	9.0	8.8	8.6	8.5
8.2	8.3	8.2	8.2	8.2	8.2	8.2	8.1	7.8	7.8	7.8	7.9
7.9	7.7	7.5	7.5	7.5	7.5	7.3	7.2	7.2	7.2	7.0	6.7
6.6	6.7	6.7	6.3	6.3	6.1	6.2	6.1	5.9	 };

// Transpose to create column vector
unemployment_rate = unemployment_rate';

median_wage = { 629	642	635	646
647	647	651	658
662	663	678	681
687	693	698	700
713	722	724	727
732	737	742	747
748	743	745	750
750	754	758	761
765	772	764	772
770	776	778	782
791	782 };

// Transpose to create column vector
median_wage = median_wage';

/*
** First data of wage data
** date format - YYYYQQ
*/
wage_start = 200401;

// Indicates this is quarterly data
wage_frequency = 4;

/*
** Declare 'myPlot' to be an instance of a plotControl structure
** Fill 'myPlot' with default settings for 'xy'
*/
struct plotControl myPlot;
myPlot = plotGetDefaults("XY");

// Set plot title
plotSetTitle(&myPlot, "Median weekly earnings vs. unemployment rate", "Arial", 24);

/*
** Assign curves to a y-axis and
** set the y-axis labels
*/
plotSetYLabel(&myPlot, "%"$|"US $", "Arial", 16);
plotSetXLabel(&myPlot, "");

// Set location and format of x-tic labels
plotSetXTicInterval(&myPlot, 24, 200501);
plotSetXTicLabel(&myPlot, "YYYY-QQ");

// Set legend text for first curve, location and orientation
plotSetLegend(&myPlot, "Unemployment rate", "top left inside", 1);

// Draw graph
plotTS(myPlot, unemployment_start, unemployment_frequency, unemployment_rate);

// Apply second curve settings
plotSetWhichYAxis(&myPlot, "right");
plotSetLineColor(&myPlot, "blue");
plotSetLegend(&myPlot, "Median worker weekly earnings");

// Add second curve to plot
plotAddTS(myPlot, wage_start, wage_frequency, median_wage);

/*
** Add the procedure below to your user library
** and you will only need one line for all the settings
*/
plotAddTextbox(grayTextSettings(), "My customized text box", 0.15, 0.2);

proc (1) = grayTextSettings();
    struct plotAnnotation mytextbox;

    mytextbox = annotationGetDefaults();
    annotationSetBkd(&mytextbox, "#DDDDDD", 0.3);
    annotationSetFont(&mytextbox, "times", 18, "#555555");
    annotationSetLineThickness(&mytextbox, 2);
    annotationSetLineColor(&mytextbox, "#555555");
    retp(mytextbox);
endp;
