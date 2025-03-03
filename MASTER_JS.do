// Close previous logs
capture log close _all

// Start a new log called PCAinst                                
log using OM25.log, name(OM25) text replace

// README
// The following files replicate the analysis in "Freedom from Unit Roots? The Time Series Properties of Democracy and Economic Freedom" by Colin O'Reilly and Ryan Murphy. Estimation is performed using STATA 17. 

// Data Flies:
// timseriesdata1970-2020.dta
// timseriesdata_annual_1970-2020.dta
// timseriesdata1950-2020.dta
//
// Data Build Files:
// This file draws on the data files listed above to create the data needed for analysis. 
do "Generate Datasets Final_JS.do"

// Analysis Files:
// The following files run cross-sectional dependence tests, first-generation unit root tests, and second-generation unit root tests on their respective samples.
 
do "Time Series Institutions - Tests - efw_vdem -  1950-2020 Final_JS.do"
// -	Main text, primary sample.
do "Time Series Institutions - Tests - kof_vdem -  annual 1970-2020 Final_JS.do"
// -	Main text, alternative sample.
do "Time Series Institutions - Tests - efw_polity - 1970-2015 Final_JS.do"
// -	Appendix, alternative measure of democracy 
do "Time Series Institutions - Tests - efw_freedomhouse -  1975-2020 Final_JS.do"
// -	Appendix, alternative measure of democracy 
do "Time Series Institutions - Tests - efw_vdem -  1950-2020 Final_JS.do"
// -	Appendix, extended sample. 

// The following files conduct the SPSM test procedure and then conduct first and second generation cointegration tests.
do "Loop 1970-2020 Final_JS.do"
do "Loop Annual kof vdem 1970-2020 Final_JS.do"
do "Loop 1970-2020 Final_JS.do"

// Close the log and exit the program
log close _all
exit

**# End of Program for the Institution PCA
