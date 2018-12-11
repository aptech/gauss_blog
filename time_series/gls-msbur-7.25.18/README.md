# GAUSS blog: GLS testing with multiple structural breaks
This code accompanies the Aptech blog [Why the GLS unit root test with multiple
structural breaks?]( https://www.aptech.com/blog/the-changing-trend-in-home-values/) which was published on 7/25/2018.

## Getting Started
### Prerequisites
The program files require a working copy of GAUSS 18+. Many can be run on earlier versions with some small revisions.

In addition it requires the [Time Series MT](https://store.aptech.com/gauss-applications-category/time-series-mt.html) application from Aptech and the *msbur* library included in this repository.

### Installing
The *msbur* library can be easily installed using the GAUSS application installation wizard, as shown below:

1. Download the zipped folder [msbur.zip](msbur.zip).
2. Use the [GAUSS Application Installer](https://www.aptech.com/support/installation/using-the-applications-installer-wizard/) by selecting *Tools>Install Application*.
3. Before using the functions created by *msbur* you will need to load the newly created `msbur` library. This can be done in a number of ways:
  *   Navigate to the library tool view window and click the small wrench located next to the `msbur` library. Select `Load Library`.
  *  Enter `library msbur` in the program input/output window.
  *  Put the line `library msbur;` at the beginning of your program files.

## Data
The data used in the blog is contained in three files

1. [housing_wa.dat](https://github.com/ec78/gauss_blog/blob/master/time_series/gls-msbur-7.25.18/housing_wa.dat) - This contains the Washington Housing Price Index, Seasonally Adjusted from the [Federal Housing Finance Agency's House Price Index Dataset](https://www.fhfa.gov/DataTools/Downloads/Pages/House-Price-Index-Datasets.aspx), observed quarterly.  
2. [housing_ar.dat](https://github.com/ec78/gauss_blog/blob/master/time_series/gls-msbur-7.25.18/housing_ar.dat) - This contains the Arizona Housing Price Index, Seasonally Adjusted from the [Federal Housing Finance Agency's House Price Index Dataset](https://www.fhfa.gov/DataTools/Downloads/Pages/House-Price-Index-Datasets.aspx), observed quarterly.
3. [zhiv_cities.csv](zhiv_cities.csv) -- This contains the historic [Zillow Home Value Index](https://www.zillow.com/research/data/) in Phoenix and Seattle, observed monthly.

## Program files
Two program files are included:
1. [sb_unit_root.gss](sb_unit_root.gss) - This file contains the GAUSS code to perform all unit root testing done in the blog. It requires both the *tsmt* and *msbur* libraries to run.
2. [glsmsbur_plots.gss](glsmsbur_plots.gss) - This file contains the GAUSS code to generate all graphs included in the blog.

## Authors
*  Erica Clower - [Aptech Systems, Inc](www.aptech.com)
