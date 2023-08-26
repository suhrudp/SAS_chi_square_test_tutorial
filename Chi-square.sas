/*IMPORT DATA*/
proc import datafile="/home/u62868661/Datasets/Chi-square/Dancing Cats.csv"
dbms=csv
out=df
replace;
run;

/*SINGLE VARIABLE FREQUENCIES*/
proc freq data=df;
	tables Training Dance / plots=(freqplot);
run;

/*CONTINGENCY TABLES*/
proc freq data=df;
	tables  (Training) *(Dance) / chisq relrisk fisher nocol nocum 
		plots(only)=(freqplot mosaicplot);
run;