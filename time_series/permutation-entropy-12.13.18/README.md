# GAUSS blog: Permutation Entropy
This code accompanies the Aptech blog [Permutation entropy](https://www.aptech.com/blog/permutation-entropy/) which was published on 12/14/2018.

## Getting Started
### Prerequisites
The program files require a working copy of GAUSS 18+. Many can be run on earlier versions with some small revisions.

In addition it requires the **pe** library included in this repository.

The **pe** library includes:
1. The original permutation entropy source code.
2. All data files used in the Aptech blog.
3. All program files for replicating the examples in the Aptech blog.

### Installing
The **pe** library can be easily installed using the **GAUSS Application Installer**, as shown below:

1. Download the zipped folder [pe.zip](pe.zip).
2. Use the [GAUSS Application Installer](https://www.aptech.com/support/installation/using-the-applications-installer-wizard/) by selecting **Tools>Install Application**.
3. Before using the functions created by **pe** you will need to load the newly created **pe** library. This can be done in a number of ways:
  *  Navigate to the library tool view window and click the small wrench located next to the **pe** library. Select **Load Library**.
  *  Enter `library pe` on the command line.
  *  Put the line `library pe;` at the beginning of your program files.

## Data
The data used in the blog is contained in two files
1. [djia_1901to2018.csv](examples/djia_1901to2018.csv) - This contains the daily [Dow Jones Industrial Average](https://us.spindices.com/indices/equity/dow-jones-industrial-average) from 1901 to 2018.  
2. [segmented_djia.dat](examples/setmented_djia.dat) - This contains to the DJIA data in [djia_1901to2018.csv](examples/djia_1901to2018.csv) segmented for the rolling window permutation entropy estimation.

## Example files
Three program files are included:
1. [blog1_example.e](examples/blog1_example.e) - This file contains the **GAUSS** code to compute the permutation entropy.
2. [segment_data.e](examples/segment_data.e) - This file contains the **GAUSS** code to segment the DJIA data prior to running the rolling window permutation entropy estimation.
3. [tventropy.e](examples/tventropy.e) - This file contains the **GAUSS** code to compute the rolling window permutation entropy.

**Note:** All data files and program files for the blog will be installed in with the **pe** library in the **gaussHome** > **pkgs** > **pe** > **examples** directory.

## Authors
Erica Clower 
[email us](mailto:eclower@aptech.com)  
[LinkedIn](https://linkedin.com/in/ericaclower)  
[Aptech Systems, Inc](https://www.aptech.com/)
