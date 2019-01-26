/*
** Create a random normal vector
** with 10 elements
*/
x = rndn(10,1);
 
/*
** NOT Vectorized
** Loop through each element
** in 'x' and multiply by 3
*/
for i(1, rows(x), 1);
    x[i] = x[i] * 3;
endfor;
