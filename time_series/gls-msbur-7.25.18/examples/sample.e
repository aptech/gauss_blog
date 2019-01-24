new;
cls;

library msbur;

T = 200;

penalty = 0; /* 0 for maic 1 for bic*/
kmax = 0;
kmin = 0;



lambda1 = 0.5;

tb1 = int(lambda1*t);
du1 = zeros(tb1,1)|ones(t-tb1,1);
dt1 = zeros(tb1,1)|seqa(1,1,t-tb1);


v = rndn(t, 1);    
u = zeros(t, 1);
alpha = 1;

j = 2;
do until j>T;
    u[j] = alpha*u[j-1]+v[j];
    j = j + 1;
endo;

y = DT1 + u; @ DGP @


@+++++++++++++++++++++++++++++@
@ Compute the test statistics @
@+++++++++++++++++++++++++++++@

model = 3|1|1;

estimation = 1|20; @ when = 1 we use the algorithm, and = 0 brut force @

{pt, mpt, adf, za, mza, msb, mzt, min_tb, cbar} = sbur_multiple_gls(y, model, penalty, kmax, kmin, estimation);

@+++++++++++++++++++++++++++++@
@ Compute the critical values @
@+++++++++++++++++++++++++++++@

lam = (min_tb/T)|zeros(4, 1); @ Only one break @
{critical_msb, critical_mza, critical_mzt, critical_pt} = msbur_rs(lam, cbar);


print "Test statistics and critical values (5% levelof significance)";

print "PT test " pt "cv(5%): " critical_pt[3];
print "MPT test " mpt "cv(5%): " critical_pt[3];
print "ADF test " adf "cv(5%): " critical_mzt[3];
print "ZA test " za "cv(5%): " critical_mza[3];
print "MZA test " mza "cv(5%): " critical_mza[3];
print "MSB test " msb "cv(5%): " critical_msb[3];
print "MZT test " mzt "cv(5%): " critical_mzt[3];
