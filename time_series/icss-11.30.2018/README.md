[![alt text][1.1]][1]
[![alt text][2.1]][2]
[![alt text][3.1]][3]

# GAUSS blog: A Simple Test for Structural Breaks in Variance
This code accompanies the Aptech blog [A Simple Test for Structural Breaks in Variance](https://www.aptech.com/blog/a-simple-test-for-structural-breaks-in-variance/) which was published on 11/30/2018.

## Getting Started
### Prerequisites
The program files require a working copy of **GAUSS 18+**. Many can be run on earlier versions with some small revisions.

The **icss** library includes:
1. The original **GAUSS** ICSS code provided by [Josep Lluís Carrion-i-Silvestre](https://webgrec.ub.edu/webpages/personal/cat/000698_carrion.ub.edu.html).
2. All data files used in the [Aptech blog](https://www.aptech.com/blog/).
3. All program files for replicating the examples in the [Aptech blog](https://www.aptech.com/blog/).

### Installing
The **icss** library can be easily installed using the **GAUSS Application Installer** , as shown below:

1. Download the zipped folder [icss.zip](icss.zip).
2. Use the [GAUSS Application Installer](https://www.aptech.com/support/installation/using-the-applications-installer-wizard/) by selecting **Tools>Install Application**.
3. Before using the functions created by **icss** you will need to load the newly created **icss** library. This can be done in a number of ways:
  *   Navigate to the **Library Tool View Window** and click the small wrench located next to the **icss** library. Select **Load Library**.
  *  Enter `library icss` on the command line.
  *  Put the line `library icss;` at the beginning of your program files.

## Data
The data used in the blog is contained in four files

1. [sp.dat](examples/sp.dat)
2. [nik.dat](examples/nik.dat)
3. [han.dat](examples/han.dat)
4. [ftse.dat](examples/ftse.dat)

## Example files
Three example files are included:
1. [blog_icss.e](examples/blog_icss.e) - This file contains the **GAUSS** code to perform all estimations in the blog.
2. [example.e](examples/example.e) - This file contains the original example provided by [Josep Lluís Carrion-i-Silvestre](https://webgrec.ub.edu/webpages/personal/cat/000698_carrion.ub.edu.html) .

**Note:** All data files and program files for the blog will be installed in with the **icss** library in the **gaussHome** > **pkgs** > **icss** > **examples** directory.

## Authors
[Erica Clower](mailto:eclower@aptech.com)  
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
