***Time Series Properties of Institutions***
**Colin O'Reilly and Ryan Murphy**
**5-15-23**
**Tests - 5 Year**
**EFW and Vdem 1950-2020**


**Run Loop Panel Unit Root Test CIPS**


*EFW*
clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_efwvdem19502020_5.dta
sort Countries Year
encode Countries, gen(id)
xtset id Year , del(5)

*Set Variables* 
global EFW Summary
global Area2 Area2
global democ1 v2x_polyarchy
global democ2 v2x_delibdem

tabstat $EFW $democ1 $democ2 , s(mean sd min max n) c(s) 
xtsum $EFW $democ1 $democ2

 mat def S = (.\.\.\.)
 mat def D =(.)
 
 forvalues i = 1(1)60 {

 xtcips $EFW, maxl(3) bglag(1) 
	display `i'
  	mat def cips = r(cips)
	mat def cv = r(cv)
	mat X1 = cips\cv'
	if (X1[1,1]<X1[2,1]) {
	mat S = S,X1
	mat list S

	mat W = r(W)
	mat list  W
	svmat W , name(W)
	drop W2 W4 W5 W6 
	rename W1 ccode
	rename W3 t
	egen min_t = min(t)
	gen loc_min_t = ccode if min_t == t
	egen loc_min_id = max(loc_min_t)
	tab loc_min_id
	mkmat loc_min_id , mat(id)
	mat def d = id[1,1]
	list id if loc_min_id == id
	mat D = D\d
	mat list S
	drop if id == loc_min_id
	drop ccode t min_t loc_min_t loc_min_id 
	}
	
}

mat list S
mat list D	

	
	
	list Countries id if Year == 2020, nol
	
	
	
 
		

*Polyarchy*
clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_efwvdem19502020_5.dta
sort Countries Year
encode Countries, gen(id)
xtset id Year , del(5)

*Set Variables* 
global EFW Summary
global Area2 Area2
global democ1 v2x_polyarchy
global democ2 v2x_delibdem

 mat def S = (.\.\.\.)
 mat def D =(.)
 
 forvalues i = 1(1)60 {

 xtcips $democ1, maxl(1) bglag(1)
	display `i'
  	mat def cips = r(cips)
	mat def cv = r(cv)
	mat X1 = cips\cv'
	if (X1[1,1]<X1[2,1]) {
	mat S = S,X1
	mat list S

	mat W = r(W)
	mat list  W
	svmat W , name(W)
	drop W2 W4 W5 W6 
	rename W1 ccode
	rename W3 t
	egen min_t = min(t)
	gen loc_min_t = ccode if min_t == t
	egen loc_min_id = max(loc_min_t)
	tab loc_min_id
	mkmat loc_min_id , mat(id)
	mat def d = id[1,1]
	list id if loc_min_id == id
	mat D = D\d
	mat list S
	drop if id == loc_min_id
	drop ccode t min_t loc_min_t loc_min_id 
 }

}

mat list S
mat list D	
	
	
	list Countries id if Year == 2020, nol
	
	
		

*Deliberative*

clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_efwvdem19502020_5.dta
sort Countries Year
encode Countries, gen(id)
xtset id Year , del(5)

*Set Variables* 
global EFW Summary
global Area2 Area2
global democ1 v2x_polyarchy
global democ2 v2x_delibdem

 mat def S = (.\.\.\.)
 mat def D =(.)
 
 forvalues i = 1(1)60 {

 xtcips $democ2, maxl(1) bglag(1)
	display `i'
  	mat def cips = r(cips)
	mat def cv = r(cv)
	mat X1 = cips\cv'
	if (X1[1,1]<X1[2,1]) {
	mat S = S,X1
	mat list S

	mat W = r(W)
	mat list  W
	svmat W , name(W)
	drop W2 W4 W5 W6 
	rename W1 ccode
	rename W3 t
	egen min_t = min(t)
	gen loc_min_t = ccode if min_t == t
	egen loc_min_id = max(loc_min_t)
	tab loc_min_id
	mkmat loc_min_id , mat(id)
	mat def d = id[1,1]
	list id if loc_min_id == id
	mat D = D\d
	mat list S
	drop if id == loc_min_id
	drop ccode t min_t loc_min_t loc_min_id 
 }

}

mat list S
mat list D	
	
	
	list Countries id if Year == 2020, nol
	
	
	
*****Cointegration Tests******
	
	
*EFW and Polyarchy*	

clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_efwvdem19502020_5.dta
sort Countries Year
encode Countries, gen(id)
xtset id Year , del(5)

*Set Variables* 
global EFW Summary
global democ1 v2x_polyarchy



twoway (line $EFW Year if Countries == "Norway") (line $EFW Year if Countries == "Taiwan", lp(dash))

local var 74	35	40	28	37	57	16	66	5	59	8	38	27	2	40	1	76	34	14	44	9	19	32	23	63	28	45	29




foreach j in `var' { 

	
drop if id == `j' 
}
	list Countries id if Year == 2020, nol

*first gen*
 xtcointtest pedroni $EFW $democ1 
 mat def stat = r(stats)'
 mat def p = r(p)'
 mat def n = r(N)
 mat def g = r(N_g)
 mat def t = r(N_t)
 mat def l = r(adf_lags)
 mat def N = (g,t,l)
 mat def C1 = (stat,p,N')
 mat list C1
 
 xtcointtest pedroni $EFW $democ1 , lags(aic 3)
 mat def stat = r(stats)'
 mat def p = r(p)'
 mat def n = r(N)
 mat def g = r(N_g)
 mat def t = r(N_t)
 mat def l = r(adf_lags)
 mat def N = (g,t,l)
 mat def C2 = (stat,p,N')
 mat list C2
 xtcointtest pedroni $EFW $democ1 , demean
  mat def stat = r(stats)'
 mat def p = r(p)'
 mat def n = r(N)
 mat def g = r(N_g)
 mat def t = r(N_t)
 mat def l = r(adf_lags)
 mat def N = (g,t,l)
 mat def C3 = (stat,p,N')
 mat list C3
 xtcointtest pedroni $EFW $democ1 , demean lags(aic 3)
  mat def stat = r(stats)'
 mat def p = r(p)'
 mat def n = r(N)
 mat def g = r(N_g)
 mat def t = r(N_t)
 mat def l = r(adf_lags)
 mat def N = (g,t,l)
 mat def C4 = (stat,p,N')
 mat list C4
 
 mat list C1
 mat list C2
 mat list C3
 mat list C4
	
	
*second gen*
sort id Year
by id: gen y = _n
xtset id y , del(1)
	
xtwest $EFW $democ1, constant lrwindow(3) lags(1) leads (1) // bootstrap(500)

 
 
*EFW and Deliberative*

clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_efwvdem19502020_5.dta
sort Countries Year
encode Countries, gen(id)
xtset id Year , del(5)

*Set Variables* 
global EFW Summary
global democ1 v2x_delibdem


local var 74	35	40	28	37	57	16	66	5	59	8	38	31	27	34	44	40	2	1	48	19	76





foreach j in `var' {
	
drop if id == `j' 
}
	list Countries id if Year == 2020, nol

*first gen*
 xtcointtest pedroni $EFW $democ1 
 mat def stat = r(stats)'
 mat def p = r(p)'
 mat def n = r(N)
 mat def g = r(N_g)
 mat def t = r(N_t)
 mat def l = r(adf_lags)
 mat def N = (g,t,l)
 mat def C1 = (stat,p,N')
 mat list C1
 
 xtcointtest pedroni $EFW $democ1 , lags(aic 3)
 mat def stat = r(stats)'
 mat def p = r(p)'
 mat def n = r(N)
 mat def g = r(N_g)
 mat def t = r(N_t)
 mat def l = r(adf_lags)
 mat def N = (g,t,l)
 mat def C2 = (stat,p,N')
 mat list C2
 xtcointtest pedroni $EFW $democ1 , demean
  mat def stat = r(stats)'
 mat def p = r(p)'
 mat def n = r(N)
 mat def g = r(N_g)
 mat def t = r(N_t)
 mat def l = r(adf_lags)
 mat def N = (g,t,l)
 mat def C3 = (stat,p,N')
 mat list C3
 xtcointtest pedroni $EFW $democ1 , demean lags(aic 3)
  mat def stat = r(stats)'
 mat def p = r(p)'
 mat def n = r(N)
 mat def g = r(N_g)
 mat def t = r(N_t)
 mat def l = r(adf_lags)
 mat def N = (g,t,l)
 mat def C4 = (stat,p,N')
 mat list C4
 
 mat list C1
 mat list C2
 mat list C3
 mat list C4
 
*second gen*
sort id Year
by id: gen y = _n
xtset id y , del(1)

xtwest $EFW $democ1, constant lrwindow(3) lags(1) leads (1)  // bootstrap(500)
 