***Time Series Properties of Institutions***
**Colin O'Reilly and Ryan Murphy**
**5-15-23**
**Tests - 1 Year**
**KOF and Vdem 1970-2020**


**Run Loop Panel Unit Root Test CIPS**


*KOF*
clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_kofvdem19702020_1.dta
sort country year
encode country , gen(id)
xtset id year , del(1)

*Set Variables* 
global EFW KOFGI
global EFW2 Area2
global democ1 v2x_polyarchy
global democ2 v2x_delibdem

 xtsum $EFW $democ1 $democ2


 mat def S = (.\.\.\.)
 mat def D =(.)
 
 forvalues i = 1(1)60 {

 xtcips $EFW, maxl(5) bglag(1) 
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

	
	
	list country id if year == 2020, nol
	

*Polyarchy*
clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_kofvdem19702020_1.dta
sort country year
encode country , gen(id)
xtset id year , del(1)

*Set Variables* 
global EFW KOFGI
global EFW2 Area2
global democ1 v2x_polyarchy
global democ2 v2x_delibdem


 mat def S = (.\.\.\.)
 mat def D =(.)
 
 forvalues i = 1(1)50 {

 xtcips $democ1, maxl(5) bglag(1)
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
	
	
	list country id if year == 2020, nol
	
	
		

*Deliberative**

clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_kofvdem19702020_1.dta
sort country year
encode country, gen(id)
xtset id year , del(1)

*Set Variables* 
global EFW Summary
global EFW2 Area2
global democ1 v2x_polyarchy
global democ2 v2x_delibdem

 mat def S = (.\.\.\.)
 mat def D =(.)
 
 forvalues i = 1(1)40 {

 xtcips $democ2, maxl(5) bglag(1)
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
	
	
	list country id if year == 2020, nol
	
	
	
*****Cointegration Tests******

	
	

*KOF and Polyarchy*	

clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_kofvdem19702020_1.dta
sort country year
encode country, gen(id)
xtset id year , del(1)

*Set Variables* 
global EFW KOFGI
global democ1 v2x_polyarchy





local var 16	127	64	7	42	122	21	62	74	3	33	90	88	108	69	2	72	106	44	43	128	81	51	114	92	36	114	112	99	66	37	113	122	26	35	50	87	83	34	74




foreach j in `var' {
	
drop if id == `j' 
}
	list country id if year == 2020, nol

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
 
 xtcointtest pedroni $EFW $democ1 , lags(aic 4)
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
 xtcointtest pedroni $EFW $democ1 , demean lags(aic 4)
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
sort id year
by id: gen y = _n
xtset id y , del(1)

xtwest $EFW $democ1, constant lrwindow(3) lags(3) leads(3) // bootstrap(500)
xtwest $EFW $democ1, constant lrwindow(3) lags(1 5) leads(1 5) // bootstrap(500)

 
*Kof and Deliberative*

clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_kofvdem19702020_1.dta
sort country year
encode country, gen(id)
xtset id year , del(1)

*Set Variables* 
global EFW KOFGI
global democ1 v2x_delibdem


local var 16	127	64	7	42	122	21	62	74	3	33	90	88	108	69	2	72	106	44	43	128	81	51	114	92	36	112	113	37	99	50	54

			



foreach j in `var' {
	
drop if id == `j' 
}
	list country id if year == 2020, nol

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
 
 xtcointtest pedroni $EFW $democ1 , lags(aic 4)
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
 xtcointtest pedroni $EFW $democ1 , demean lags(aic 4)
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
sort id year
by id: gen y = _n
xtset id y , del(1)

xtwest $EFW $democ1, constant lrwindow(3) lags(3) leads(3) // bootstrap(500)
xtwest $EFW $democ1, constant lrwindow(3) lags(1 5) leads(1 5) // bootstrap(500)
