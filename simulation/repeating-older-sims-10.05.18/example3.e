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
