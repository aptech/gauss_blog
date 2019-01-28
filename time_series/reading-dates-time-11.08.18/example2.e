// Load the temperature data
temp_data = loadd("temperature.csv", "loadMyDates($day) + Phoenix + Seattle");

// Procedure for converting dates
proc (1) = loadMyDates(str);
    local fmt;
 
    // %B - full month name
    // %e - day of month
    // %Y - 4 digit year
    fmt = "%B-%e-%Y";
 
    retp(strctoposix(str, fmt));
endp;
