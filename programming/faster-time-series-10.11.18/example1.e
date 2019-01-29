/*
**  This code accompanies the blog
**  "Make your time series computations
**  up to 20 times faster"
**  published on 10/11/2018 
**  on the Aptech blog.
*/

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
