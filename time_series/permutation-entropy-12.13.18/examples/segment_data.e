new;
cls;

library pe;

row_range={ 1, 31519 };

x = csvReadM(__FILE_DIR $+"DJIA_1901_to_2018.csv",row_range,2);
x = packr(x);

// Set window size
year = 1;  
win = 252 * year;

// Segmenting the data
x_seg = segmentEntropyData(x, win);


