// Generate dates
dt_start_str = "01/20/1980";
displayFormat = "%m/%d/%Y";
inc = 15;
unit = "days";
n = 250;

date_vec = buildDates(dt_start_str, inc, unit, n, displayFormat);

print "Original Dates: "; 
date_vec[1:5, "Dates"];

day = get_day(date_vec[., "Dates"]);
year = get_year(date_vec[., "Dates"]);
month = get_month(date_vec[., "Dates"]);

print "Day: ";
day[1:5];

print "Year: ";
year[1:5];

print "Month: ";
month[1:5];

fn get_month(x) = strtof(posixtostrc(x, "%m"));
fn get_day(x) = strtof(posixtostrc(x, "%d"));
fn get_year(x) = strtof(posixtostrc(x, "%y"));


proc (1) = buildDates(dt_start_str, inc, unit, n, displayFormat);
    local dt_start, dt_vec, dt_vec_str;
    
    // Jan 20, 1980
    dt_start = strcToPosix(dt_start_str, displayFormat);

    // Create a sequence of 250 dates separated by 15 days
    dt_vec = seqaPosix(dt_start, inc, unit, n);

    // Convert to POSIX dates to dataframe
    dt_vec_str = setcoltypes(dt_vec, "date");
    dt_vec_str = setcolnames(dt_vec_str, "Dates");

    retp(dt_vec_str);
endp;
