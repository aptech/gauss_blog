/*
** Mixed grid size plot example
** 
** Accompanies the blog
** "How to Create Tiled Graphs in GAUSS"
**
**  Published 8/04/2020
*/

new;

plotClearLayout();

// Create the vector 0.1, 0.2, 0.3...3.0
x = seqa(0.1, 0.1, 30);
 
/*
** First subplot
*/
 
// Divide the graph canvas into a 2x2 grid
// and place the next graph in the 1st cell
plotLayout(2, 2, 1);
 
// Create 'y1' and draw graph
y1 = exp(x);
plotXY(x, y1);
 
/*
** Second subplot
*/
plotLayout(2, 2, 2);
 
y2 = sin(x);
plotXY(x, y2);
 
/*
** Third subplot
**
**     Change to interpret the graph canvas
**     as a 2x1 grid and place the next graph
**     in the second cell.
*/
plotLayout(2, 1, 2);
 
y3 = cos(x);
plotXY(x, y3);
