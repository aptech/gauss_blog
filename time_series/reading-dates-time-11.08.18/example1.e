/*
**  This code accompanies the blog
**  "Reading dates and times in GAUSS"
**  published on 11/08/2018 
**  on the Aptech blog.
*/

// Load the date data
data = loadd("bike_count.xlsx", "date($Time) + Count");
