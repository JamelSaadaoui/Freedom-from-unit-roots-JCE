***Time Series Properties of Institutions***
**Colin O'Reilly and Ryan Murphy**
**5-15-23**
**Tests - 5 Year**

***EFW and Polity 1970-2015***
clear
*cd "G:\My Drive\Research Paper\Cointegration\Data"
use balanced_efwpolity19702015_5.dta

*Set Variables* 
global EFW Summary
global EFW2 Area2
global democ1 democ 
global democ2 autoc

**Tests for Cross-sectional Dependence**
 
 xtcd2 $EFW, noest
 mat cd_t = r(CD)
 mat cd_p = r(p)
 mat EFW1 = (cd_t\ cd_p)
 mat list EFW1
 
   xtcd2 $EFW2, noest
 mat cd_t = r(CD)
 mat cd_p = r(p)
 mat EFW2 = (cd_t\ cd_p)
 mat list EFW2

 xtcd2 $democ1, noest
  mat cd_t = r(CD)
 mat cd_p = r(p)
 mat democ1 = (cd_t\ cd_p)
 mat list democ1
 
 xtcd2 $democ2, noest
 mat cd_t = r(CD)
 mat cd_p = r(p)
 mat democ2 = (cd_t\ cd_p)
 mat list democ2

 mat CD = (EFW1, EFW2, democ1, democ2)
 mat list CD
 
 
 ***1st Gen Unitroot***

 *Democracy*
 
 *Not Demeand*
 *xtunitroot ht $EFW
 xtunitroot ips $democ1,  lags(aic 1)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X1 =  (t\p\n_g\n_t)
 mat list X1
  
 *xtunitroot fisher $democ1, lags(1) pp
 xtunitroot fisher $democ1,  lags(1) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X2 =  (t\p\n_g\n_t)
 mat list X2
 
 *xtunitroot ht $democ1
 xtunitroot ips $democ1,  lags(aic 3)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X3 =  (t\p\n_g\n_t)
 mat list X3
 
 *xtunitroot fisher $democ1, lags(3) pp
 xtunitroot fisher $democ1,  lags(3) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X4 =  (t\p\n_g\n_t)
 mat list X4
 	 
		
 mat X_original_$democ1 = X1,X2,X3,X4
 mat list X_original_$democ1
		
	*Trend*
	 xtunitroot ips $EFW,  lags(aic 3) trend
	 xtunitroot fisher $EFW,  lags(3) dfuller trend /*need fewer lags*/
	  
	 xtunitroot ips $EFW,  lags(aic 3) 
	 xtunitroot fisher $EFW,  lags(1) dfuller  drift /*need fewer lags*/
 
 *Demeand*
 *xtunitroot ht $democ1,  demean 
 xtunitroot ips $democ1,  demean lags(aic 1) 
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X1 =  (t\p\n_g\n_t)
 mat list X1
 
 *xtunitroot fisher $democ1,  demean lags(1) pp
 xtunitroot fisher $democ1,  demean lags(1) dfuller 
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X2 =  (t\p\n_g\n_t)
 mat list X2
 
 
 *xtunitroot ht $democ1,  demean 
 xtunitroot ips $democ1,  demean lags(aic 3)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X3 =  (t\p\n_g\n_t)
 mat list X3
 *xtunitroot fisher $democ1,  demean lags(3) pp
 xtunitroot fisher $democ1,  demean lags(3) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X4 =  (t\p\n_g\n_t)
 mat list X4
 
 mat X_demean_$democ1 = X1,X2,X3,X4
 
 
 mat list X_demean_$democ1
 
 mat list X_original_$democ1
 
 
 **Autocracy**
 
 *Not Demeand*
 *xtunitroot ht $democ2
 xtunitroot ips $democ2,  lags(aic 1)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X1 =  (t\p\n_g\n_t)
 mat list X1
  
 *xtunitroot fisher $democ2, lags(1) pp
 xtunitroot fisher $democ2,  lags(1) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X2 =  (t\p\n_g\n_t)
 mat list X2
 
 *xtunitroot ht $democ2
 xtunitroot ips $democ2,  lags(aic 3)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X3 =  (t\p\n_g\n_t)
 mat list X3
 
 *xtunitroot fisher $democ2, lags(3) pp
 xtunitroot fisher $democ2,  lags(3) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X4 =  (t\p\n_g\n_t)
 mat list X4
 	 
		
 mat X_original_$democ2 = X1,X2,X3,X4
 *mat X_original = X3,X4
 mat list X_original_$democ2
		
 
 *Demeand*
 *xtunitroot ht $democ2,  demean 
 xtunitroot ips $democ2,  demean lags(aic 1) 
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X1 =  (t\p\n_g\n_t)
 mat list X1
 
 *xtunitroot fisher $democ2,  demean lags(1) pp
 xtunitroot fisher $democ2,  demean lags(1) dfuller 
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X2 =  (t\p\n_g\n_t)
 mat list X2
 
 
 *xtunitroot ht $democ2,  demean 
 xtunitroot ips $democ2,  demean lags(aic 3)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X3 =  (t\p\n_g\n_t)
 mat list X3
 *xtunitroot fisher $democ2,  demean lags(3) pp
 xtunitroot fisher $democ2,  demean lags(3) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X4 =  (t\p\n_g\n_t)
 mat list X4
 
 mat X_demean_$democ2 = X1,X2,X3,X4
 *mat X_demean = X3,X4
 mat list X_demean_$democ2
 mat list X_original_$democ2
 
 
 mat $democ1 = X_original_$democ1, X_demean_$democ1
 mat $democ2 = X_original_$democ2, X_demean_$democ2 
 mat list $democ1
 mat list $democ2
 
 
 
 *EFW*
 
 *Not Demeand*
 *xtunitroot ht $EFW
 xtunitroot ips $EFW,  lags(aic 1)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X1 =  (t\p\n_g\n_t)
 mat list X1
  
 *xtunitroot fisher $EFW, lags(1) pp
 xtunitroot fisher $EFW,  lags(1) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X2 =  (t\p\n_g\n_t)
 mat list X2
 
 *xtunitroot ht $EFW
 xtunitroot ips $EFW,  lags(aic 3)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X3 =  (t\p\n_g\n_t)
 mat list X3
 
 *xtunitroot fisher $EFW, lags(3) pp
 xtunitroot fisher $EFW,  lags(3) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X4 =  (t\p\n_g\n_t)
 mat list X4
 	 
		
 mat X_original = X1,X2,X3,X4
 *mat X_original = X3,X4
 mat list X_original

 
 *Demeand*
 *xtunitroot ht $EFW,  demean 
 xtunitroot ips $EFW,  demean lags(aic 1) 
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X1 =  (t\p\n_g\n_t)
 mat list X1
 
 *xtunitroot fisher $EFW,  demean lags(1) pp
 xtunitroot fisher $EFW,  demean lags(1) dfuller 
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X2 =  (t\p\n_g\n_t)
 mat list X2
 
 
 *xtunitroot ht $EFW,  demean 
 xtunitroot ips $EFW,  demean lags(aic 3)
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(wtbar)
 mat p = r(p_wtbar)
 mat X3 =  (t\p\n_g\n_t)
 mat list X3
 *xtunitroot fisher $EFW,  demean lags(3) pp
 xtunitroot fisher $EFW,  demean lags(3) dfuller
 mat n_g = r(N_g)
 mat n_t = r(N_t)
 mat t = r(Z)
 mat p = r(p_Z)
 mat X4 =  (t\p\n_g\n_t)
 mat list X4
 
 mat X_demean = X1,X2,X3,X4
 *mat X_demean = X3,X4
 mat list X_demean
 
 mat list X_original 
 
 **Collect Results**
 mat EFW = X_original, X_demean
 mat list EFW
 
 
 
 
**Collect Results**
mat list EFW 
mat list $democ1
mat list $democ2
 
 

 
 
 
 *********************************************************************************
 
 ***Second Generation Tests***
 
 
  *Unit Root Tests CIPS*
 
 xtcips $EFW, maxl(1) bglag(1) q
 mat t = r(cips)
 mat cv = r(cv)
 mat X1 = t\cv'
 mat list X1
 xtcips $EFW, maxl(3) bglag(1) q
 mat t = r(cips)
 mat cv = r(cv)
 mat X2 = t\cv'
 mat list X2
  
 
 xtcips $democ1, maxl(1) bglag(1) q
 mat t = r(cips)
 mat cv = r(cv)
 mat X5 = t\cv'
 mat list X5
 xtcips $democ1, maxl(3) bglag(1) q
 mat t = r(cips)
 mat cv = r(cv)
 mat X6 = t\cv'
 mat list X6
 
 
 xtcips $democ2, maxl(1) bglag(1) q
 mat t = r(cips)
 mat cv = r(cv)
 mat X7 = t\cv'
 mat list X7
 xtcips $democ2, maxl(3) bglag(1) q
 mat t = r(cips)
 mat cv = r(cv)
 mat X8 = t\cv'
 mat list X8
  
 
 mat CIPS = X1,X2,X5,X6,X7,X8
 mat list CIPS
 
 
 mat CIPS_1lag = X1,X5,X7
 mat list CIPS_1lag
 
 
 
 