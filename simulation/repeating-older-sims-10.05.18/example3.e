/*
**  This code accompanies the blog
**  "Repeating simulations from 
**  older versions of GAUSS"
**  published on 10/05/2018 
**  on the Aptech blog.
*/

/* 
** Making code using rndn
** portable between GAUSS
** versions
*/

/*
** If we are using GAUSS 18 or newer
** replace rndn with _rndng10
*/
#ifminkernelversion(18)
    #define rndn _rndng10
#endif
 
rndseed 777;
x = rndn(5,1);
print x;
