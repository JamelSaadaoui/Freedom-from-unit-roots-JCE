**Create Datasets for Analysis**
*cd "G:\My Drive\Research Paper\Cointegration\Data"


***Create Primary Dataset 1970-2020 5-year***


**Balance**
*EFW and Polity 1970-2015*
use timseriesdata1970-2020.dta ,clear
global start 1970
	global end 2015
	drop if Year<$start
	drop if Year>$end
	save unbalanced5.dta , replace
	
	*Balance the panel*
	rename EFW Summary
	gen var2 = $end - $start
	gen var = (($end-$start) / 5)
	egen sum_count = count(Summary), by(code)
	drop if sum_count <= var 
	egen democ_count = count(democ), by(code)
	drop if democ_count <= var
	egen autoc_count = count(autoc), by(code)
	drop if autoc_count <= var
	egen xconst_count = count(xconst), by(code)
	drop if xconst_count <= var
	
	xtset code Year , del(5)	
	xtdes
	save balanced_efwpolity19702015_5.dta , replace 


*EFW and Freedom House**
use timseriesdata1970-2020.dta ,clear
	global start 1975
	global end 2020
	drop if Year<$start
	drop if Year>$end
	save unbalanced5.dta , replace
	
	*Balance the panel*
	rename EFW Summary
	gen var2 = $end - $start
	gen var = (($end-$start) / 5)
	egen sum_count = count(Summary), by(code)
	drop if sum_count <= var 
	egen PR_count = count(PR), by(code)
	drop if PR_count <= var
	egen CL_count = count(CL), by(code)
	drop if CL_count <= var
	
	xtset code Year , del(5)	
	xtdes
	save balanced_efwpfreedomhouse19752020_5.dta , replace 

	
*EFW and Vdem 1970-2020*
use timseriesdata1970-2020.dta , clear
	global start 1970
	global end 2020
	drop if Year>$end
	drop if Year<$start
	save unbalanced5.dta , replace
	
	*Balance the panel*
	rename EFW Summary
	gen var2 = $end - $start
	gen var= ($end-$start) / 5
	egen sum_count = count(Summary), by(code)
	drop if sum_count <= var
	egen polyarchy_count = count(v2x_polyarchy), by(code)
	drop if polyarchy_count <= var

	
	xtset code Year , del(5)	
	xtdes
	save balanced_efwvdem19702020_5.dta , replace 

	
	
***Create Annual Dataset 1970-2020***

**Balance**
*KOF and VDem annual 1970-2020*
use timseriesdata_annual_1970-2020.dta ,clear
global start 1970
	global end 2020
	drop if year<$start
	drop if year>$end
	save unbalanced1.dta , replace
	
	*Balance the panel*
	gen var = $end - $start
	egen kof_count = count(KOFGI), by(code)
	drop if kof_count <= var 
	egen polyarchy_count = count(v2x_polyarchy), by(code)
	drop if polyarchy_count <= var
	
	xtset code year , del(1)	
	xtdes
	save balanced_kofvdem19702020_1.dta , replace 

	
	

***Create Extended Dataset 1950-2020 5-year***


	
*EFW and Vdem 1950-2020*
use timseriesdata1950-2020.dta , clear
	global start 1950
	global end 2020
	drop if Year<$start
	save unbalanced5.dta , replace
	
	*Balance the panel*
	rename EFW Summary
	gen var2 = $end - $start
	gen var= ($end-$start) / 5
	egen sum_count = count(Summary), by(code)
	drop if sum_count <= var
	egen polyarchy_count = count(v2x_polyarchy), by(code)
	drop if polyarchy_count <= var

	
	xtset code Year , del(5)	
	xtdes
	save balanced_efwvdem19502020_5.dta , replace 
	
	
	
	