/*
** Set up data for Granger-causality blog
** and graphs
**  
*/
new;
cls;
library tspdlib;

// Load data
price_data = loadd(__FILE_DIR $+ "price_data.xls", "date($observation_date) + price_gold + price_oil");

// Deal with missing values
// by replacing missing values
// with previous observations
for i (2, rows(price_data), 1);
    if price_data[i, "price_gold"] .== error(30);
        price_data[i, "price_gold"] = price_data[i-1, "price_gold"];
    endif;
    
    if price_data[i, "price_oil"] .== 0;
        price_data[i, "price_oil"] = price_data[i-1, "price_oil"];
    endif;
    
endfor;

// Check ADF
call adf(price_data[., "price_gold"], 1);
call adf(price_data[., "price_oil"], 1);

// Call KPSS 
call lmkpss(price_data[., "price_gold"], 1);
call lmkpss(price_data[., "price_oil"], 1);

/*
**Granger-causality test
*/

// This sets specifies that the
// Granger-causality test
// Note that data will be tested in 
// differences
test = 0;

// Run test
call granger(price_data[., "price_gold" "price_oil"], test);
