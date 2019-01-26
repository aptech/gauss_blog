# GAUSS blog: Repeating simulations from older versions
This code accompanies the Aptech blog [Repeating simulations from older versions of GAUSS](https://www.aptech.com/blog/repeating-simulations-from-older-versions-of-gauss/) which was published on 12/10/2018.

## Getting Started
### Prerequisites
The program files require a working copy of **GAUSS 18+**. Many can be run on earlier versions with some small revisions.

## Example files
Three program files are included:
1. [example1](example1.e) - This file contains an example of the simplest case of replacing a single usage of `rndn` to `_rndng10`.
2. [example2](example2.e) - This file contains an example of the case of using a `#define` statement to replace multiple occurrences of `rndn` with `_rndng10`.
3. [example3](example3.e) - This file contains an example making GAUSS codeand is that uses `rndn` and is portable between versions of GAUSS.

## Authors
*  [Erica Clower](erica@aptech.com) - [Aptech Systems, Inc](www.aptech.com)
