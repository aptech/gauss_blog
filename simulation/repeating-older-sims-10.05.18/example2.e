/*
**  This code accompanies the blog
**  "Repeating simulations from 
**  older versions of GAUSS"
**  published on 10/05/2018 
**  on the Aptech blog.
*/

/* 
** Reproducing simulations
** from GAUSS 10 and older
** using #define to 
** replace all instance of rndn
*/

#define rndn _rndng10
 
rndseed 777;
x = rndn(5,1);
print x;

x2 = rndn(5,2);
print x2;
