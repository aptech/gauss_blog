[![alt text][1.1]][1]
[![alt text][2.1]][2]
[![alt text][3.1]][3]

# GAUSS blog: A Guide to Conducting Cointegration Tests
This code accompanies the Aptech blog [A Guide to Conducting Cointegration Tests](https://www.aptech.com/?p=21405&preview=true) which was published on 1/24/2020.

## Getting Started
### Prerequisites
The program files require a working copy of **GAUSS 18+**. Many can be run on earlier versions with some small revisions.

Libraries: [Time Series MT (TSMT)](https://store.aptech.com/gauss-applications-category/time-series-mt.html), [coint](https://store.aptech.com/third-party-applications-category/coint-2-1-co-integrated-systems.html), and [TSPDLIB](https://github.com/aptech/tspdlib)

All libraries can be installed using the [GAUSS package manager](https://www.aptech.com/blog/gauss-package-manager-basics/) for [GAUSS 20+](https://www.aptech.com/blog/gauss-20-initial-release/).

## Example files
The following examples are provided:
1. [1_time_series_plot.e](examples/1_time_series_plot.e) - This file contains an example for plotting time series data using the [`plotTS`](https://docs.aptech.com/gauss/CR-plotTS.html) function in GAUSS.
2. [2_unitroot_tsmt.e](examples/2_unitroot_tsmt.e) - This file replicates the unit root testing performed in the blog using unit root tests from the [TSMT](https://store.aptech.com/gauss-applications-category/time-series-mt.html) package.
3. [3_unitroot_tspdlib.e](examples/3_unitroot_tspdlib.e) - This file replicates the unit root testing performed in the blog using unit root tests from the [TSPDLIB](https://github.com/aptech/tspdlib) library.
4. [4_sbreak_tsmt.e](examples/4_sbreak_tsmt.e) - This file implements the structural break identification provided by the `sbreak` procedure in the [TSMT](https://store.aptech.com/gauss-applications-category/time-series-mt.html) package.
5. [5_cointegration.e](examples/5_cointegration.e) - This file implements the cointegration testing for data without structural breaks performed in the blog using the cointegration
5. [6_cointegration.e](examples/6_cointegration_sb.e) - This file implements the cointegration testing for data with structural breaks performed in the blog using the cointegration

## Authors
[Erica Clower](mailto:erica@aptech.com)  
[Aptech Systems, Inc](https://www.aptech.com/)  
[![alt text][1.1]][1]
[![alt text][2.1]][2]
[![alt text][3.1]][3]

<!-- links to social media icons -->
[1.1]: https://www.aptech.com/wp-content/uploads/2019/02/fb.png (Visit Aptech Facebook)
[2.1]: https://www.aptech.com/wp-content/uploads/2019/02/gh.png (Aptech Github)
[3.1]: https://www.aptech.com/wp-content/uploads/2019/02/li.png (Find us on LinkedIn)

<!-- links to your social media accounts -->
[1]: https://www.facebook.com/GAUSSAptech/
[2]: https://github.com/aptech
[3]: https://linkedin.com/in/ericaclower
<!-- Please don't remove this: Grab your social icons from https://github.com/carlsednaoui/gitsocial -->
