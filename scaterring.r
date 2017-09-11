### Coma SDSS-WISE Selection. Analazing with our galaxie morphology separation ####

#Lw1 vs Lw4 for ETG and N-ETG for Coma Galaxies with a linear fit	
etg = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep='') 
netg = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep='') 
possible_miegs = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat", header=T, sep="")
miegs=read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat", header=T, sep="")

grupo = subset(etg, etg$Log_Lw1 > 8.75)
grupp2 = subset(grupo, grupo$Log_Lw4 < 42.2) 

ajuste = lm(grupo2$Log_Lw4 ~ grupo2$Log_Lw1)
ajuste2=lm(I(grupo2$Log_Lw4 + 3*sd(grupo2$Log_Lw4)) ~ grupo2$Log_Lw1)
ajuste3=lm(I(grupo2$Log_Lw4 - 3*sd(grupo2$Log_Lw4)) ~ grupo2$Log_Lw1)

setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Lw1_vs_Lw4:ETG_regression.eps")
plot(etg$Log_Lw1, etg$Log_Lw4, col='red', pch=16, xlab='Log(Lw1) [Lsun]', ylab='Log(Lw4) [erg/s]', main='Lw1 vs Lw4: Coma Cluster',axes=F, xlim=c(7.55, 10), ylim=c(41.2,43.3))
axis(side=1, at=seq(from=7.55, to=10, by=0.1))
axis(side=2, at=seq(from=41.2, to=43.3, by=0.1))
par(new=T)
plot(netg$Log_Lw1, netg$Log_Lw4, col='deepskyblue3', pch=16, axes=F, xlab='', ylab='', main='', xlim=c(7.55, 10), ylim=c(41.2,43.3))
par(new=T)
plot(miegs$Log_Lw1, miegs$Log_Lw4, col='green', lwd=3, pch=8, axes=F, xlab='', ylab='', main='', xlim=c(7.55, 10), ylim=c(41.2,43.3))
par(new=T)
plot(possible_miegs$Log_Lw1, possible_miegs$Log_Lw4, col='black', lwd=3, pch=8, axes=F, xlab='', ylab='', main='', xlim=c(7.55, 10), ylim=c(41.2,43.3))
abline(ajuste, lty=1)
abline(ajuste2, lty=2)
abline(ajuste3, lty=2)
legend(x=7.55,y=43.3, legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), col=c("red", "deepskyblue3", 'green', 'black'), pch=c(16, 16, 16,8), bty='n')
legend(x=7.55,y=42.95, legend=c('linear fit', expression(paste('3',sigma))), lty=c(1,2), bty='n')
for(i in 1:6){
  text(possible_miegs$Log_Lw1[i],possible_miegs$Log_Lw4[i]-0.07, possible_miegs$names[i]) 
}
for(i in 1:8){
  text(miegs$Log_Lw1[i],miegs$Log_Lw4[i]-0.07, miegs$name[i])  
}
dev.off()


#Plot for Stelar Mass vs Specific Star Formation (Log_M vs sSFR)
etg = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep='') 
netg = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep='') 
possible_miegs = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat", header=T, sep="")
miegs=read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat", header=T, sep="")

setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/M_vs_sSFR:Coma.eps")
plot(etg$Log_M_stellar, etg$Log_sSFR, col='red', pch=16, xlab=expression(paste('Log(',M['stelar'],')')), ylab='Log(sSFR)', main=expression(paste(M[stelar],' vs sSFR: Coma Cluster')),axes=F, xlim=c(7.8, 11.0), ylim=c(-8.5,-15.5))
axis(side=1, at=seq(from=7.8, to=11.0, by=0.1))
axis(side=2, at=seq(from=-8.5, to=-15.5, by=-0.1))
par(new=T)
plot(netg$Log_M_stellar, netg$Log_sSFR, col='deepskyblue3', pch=16, axes=F, xlab='', ylab='', main='', xlim=c(7.8, 11.0), ylim=c(-8.5,-15.5))
par(new=T)
plot(miegs$Log_M_stellar, miegs$Log_sSFR, col='green', lwd=3, pch=8, axes=F, xlab='', ylab='', main='', xlim=c(7.8, 11.0), ylim=c(-8.5,-15.5))
par(new=T)
plot(possible_miegs$Log_M_stellar, possible_miegs$Log_sSFR, col='black',lwd=3, pch=8, axes=F, xlab='', ylab='', main='', xlim=c(7.8, 11.0), ylim=c(-8.5,-15.5))
legend("topleft", legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), col=c("red", "deepskyblue3", 'green', 'black'), pch=c(16, 16, 8,8), bty='n')
for(i in 1:6){
  text(possible_miegs$Log_M_stellar[i],possible_miegs$Log_sSFR[i]-0.2, possible_miegs$names[i])  
}
for(i in 1:8){
  text(miegs$Log_M_stellar[i],miegs$Log_sSFR[i]+0.2, miegs$name[i])  
}
dev.off()

#Plot for Stelar Mass vs Specific Star Formation (Salim data)
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_paulo+salim.dat', header=T, sep='')
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_paulo+salim.dat', header=T, sep='')
possible_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible-miegs_paulo+salim.dat', header=T, sep='')
miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Miegs(riguccini)_paulo+salim.dat', header=T, sep='')
#stellar mass -> col10
#SFR 	        -> col12	
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Salim-M_vs_sSFR:Coma.eps")
plot(etg$col10, etg$col12 - etg$col10, col='red', pch=16, xlab=expression(paste('Log(',M['stellar'],')   ', '[',M[sun],']')), ylab=expression(paste('Log(sSFR)')), main=expression(paste(M[stelar],' vs sSFR: Coma Cluster With Salim Data')),axes=F, xlim=c(8.0, 11.0), ylim=c(-13.0,-9))
axis(side=1, at=seq(from=8, to=11.0, by=0.1))
axis(side=2, at=seq(from=-13.0, to=-9, by=1))
par(new=T)
plot(netg$col10, netg$col12 - netg$col10, col='deepskyblue3', pch=16, axes=F, xlab='', ylab='', main='', xlim=c(8.0, 11.0), ylim=c(-13.0,-9))
par(new=T)
plot(miegs$col10, miegs$col12 - miegs$col10, col='green3', lwd=3, pch=8, axes=F, xlab='', ylab='', main='', xlim=c(8.0, 11.0), ylim=c(-13.0,-9))
par(new=T)
plot(possible_miegs$col10, possible_miegs$col12 - possible_miegs$col10, col='red',lwd=3, pch=8, axes=F, xlab='', ylab='', main='', xlim=c(8.0, 11.0), ylim=c(-13.0,-9))
legend("bottomleft", legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), col=c("red", "deepskyblue3", 'green3', 'red'), pch=c(16, 16, 8,8), bty='n')
y= possible_miegs$col12 - possible_miegs$col10
for(i in 1:6){
	text(possible_miegs$col10[i], y[i] + 0.2, possible_miegs$names[i], col='black')
}
for(i in 1:8){
	text(miegs$col10[i], (miegs$col12[i] - miegs$col10[i]) + 0.2, miegs$name[i], col='green3')
}
dev.off()

#Plot for Stelar Mass vs Star Formation Rate (Salim data)
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_paulo+salim.dat', header=T, sep='')
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_paulo+salim.dat', header=T, sep='')
possible_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and
_non-ETG/possible-miegs_paulo+salim.dat', header=T, sep='')
miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Miegs(riguccini)_paulo+salim.dat', header=T, sep='')
#stellar mass -> col10
#SFR 	      -> col12	
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Salim-M_vs_SFR:Coma.eps")
plot(etg$col10, etg$col12, col='red', pch=16, xlab=expression(paste('Log(',M['stellar'],')   ', '[',M[sun],']')), ylab=expression(paste('Log(SFR)')), main=expression(paste(M[stelar],' vs SFR: Coma Cluster With Salim Data')),axes=F, xlim=c(8.5, 11.0), ylim=c(-2.7,1.0))
axis(side=1, at=seq(from=8.5, to=11.0, by=0.1))
axis(side=2, at=seq(from=-2.7, to=1.0, by=0.1))
par(new=T)
plot(netg$col10, netg$col12, col='deepskyblue3', pch=16, axes=F, xlab='', ylab='', main='', xlim=c(8.5, 11.0), ylim=c(-2.7,1.0))
par(new=T)
plot(miegs$col10, miegs$col12, col='green3', lwd=3, pch=8, axes=F, xlab='', ylab='', main='', xlim=c(8.5, 11.0), ylim=c(-2.7,1.0))
par(new=T)
plot(possible_miegs$col10, possible_miegs$col12, col='red',lwd=3, pch=8, axes=F, xlab='', ylab='', main='', xlim=c(8.5, 11.0), ylim=c(-2.7,1.0))
legend("bottomleft", legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), col=c("red", "deepskyblue3", 'green3', 'red'), pch=c(16, 16, 8,8), bty='n')
y= possible_miegs$col12
for(i in 1:6){
	text(possible_miegs$col10[i], y[i] + 0.2, possible_miegs$names[i], col='black')
}
for(i in 1:8){
	text(miegs$col10[i], miegs$col12[i]+ 0.2, miegs$name[i], col='green3')
}
dev.off()

#Plot for Stelar Mass vs Star Formation Rate (Coma+Salim data)
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_dr12+salim.dat', header=T, sep="")
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_dr12+salim.dat', header=T, sep="")
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/dr12+salim:laurie_miegs.dat', header=T, sep='')
douglas = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/dr12+salim:possible_miegs.dat', header=T, sep='')

etg_sem = 0
netg_sem = 0
for(i in 1:246){
	if( etg$col10[i] == -99 || etg$col12[i] == -99){
		etg_sem = etg_sem + 	1
	}
}

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/dr12+salim:M_vs_SFR')
plot(etg$col10, etg$col12, xlim=c(8,12), ylim = c(-4,0.7), col='red', pch=16, axes=F, xlab=expression(paste('Log(',M['stellar'],')   ', '[',M[sun],']')), ylab=expression(paste('Log(SFR)   ','[',M[sun],'/year]')), main=expression(paste(M[stelar],' vs SFR: dr12 + salim')))
axis(side=1, at=seq(from=8, to=12, by=0.1))
axis(side=2, at=seq(from=-4, to=0.7, by=0.1))
par(new=T)
plot(netg$col10, netg$col12, xlim=c(8,12), ylim = c(-4,0.7), col='deepskyblue3', pch=16, axes=F, xlab='', ylab='', main='')
par(new=T)
plot(laurie$col10, laurie$col12, xlim=c(8,12), ylim = c(-4,0.7), col='green3', pch=8, lwd=3, axes=F, xlab='', ylab='', main='')
par(new=T)
plot(douglas$col10, douglas$col12, xlim=c(8,12), ylim = c(-4,0.7), col='red', pch=8, lwd=3, axes=F, xlab='', ylab='', main='')
legend("bottomleft", legend=c("etg", 'n-etg','Riguccini+15', 'possible miegs'), col=c("red", "deepskyblue3", 'green3', 'red'), pch=c(16, 16, 8,8), bty='n')
for(i in 1:6){
	text(douglas$col10[i], douglas$col12[i] + 0.2, douglas$names[i], col='black')
}
for(i in 1:8){
	text(laurie$col10[i], laurie$col12[i]+ 0.2, laurie$name[i], col='green3')
}
dev.off()

#M vs sSFR (dr12+salim)
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/dr12+salim:M_vs_sSFR')
y1 = etg$col12 - etg$col10
y2 = netg$col12 - netg$col10

plot(etg$col10, y1, xlim=c(8,12), ylim = c(-13.5,-8.5), col='red', pch=16, axes=F, xlab=expression(paste('Log(',M['stellar'],')   ', '[',M[sun],']')), ylab=expression(paste('Log(sSFR)')), main=expression(paste(M[stelar],' vs sSFR: dr12 + salim')))
axis(side=1, at=seq(from=8, to=12, by=0.1))
axis(side=2, at=seq(from=-13.5, to=-8.5, by=0.1))
par(new=T)
plot(netg$col10, y2, xlim=c(8,12), ylim = c(-13.5,-8.5), col='deepskyblue3', pch=16, axes=F, xlab='', ylab='', main='')
par(new=T)
plot(laurie$col10, laurie$col12 - laurie$col10, xlim=c(8,12), ylim = c(-13.5,-8.5), col='green3', pch=8, lwd=3, axes=F, xlab='', ylab='', main='')
par(new=T)
plot(douglas$col10, douglas$col12 - douglas$col10, xlim=c(8,12), ylim = c(-13.5,-8.5), col='red', pch=8, lwd=3, axes=F, xlab='', ylab='', main='')
legend("topright", legend=c("etg", 'n-etg','Riguccini+15', 'possible miegs'), col=c("red", "deepskyblue3", 'green3', 'red'), pch=c(16, 16, 8,8), bty='n')
for(i in 1:6){
	text(douglas$col10[i], (douglas$col12[i] - douglas$col10[i] ) + 0.2, douglas$names[i], col='black')
}
for(i in 1:8){
	text(laurie$col10[i], (laurie$col12[i] - laurie$col10[i])+ 0.2, laurie$name[i], col='green3')
}
dev.off()

#delta_ra vs delta_dec

etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/membros.dat', header=T, sep='')
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='')
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='')
douglas = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep='')

ra_centro = (194.940) ; dec_centro = (27.833)
etg$sep_ra = ((etg$ra) - ra_centro)*cos(((etg$dec+dec_centro)*pi/180)/2)
etg$sep_dec = (etg$dec) - dec_centro

netg$sep_ra = ((netg$ra) - ra_centro)*cos(((netg$dec+dec_centro)*pi/180)/2)
netg$sep_dec = (netg$dec) - dec_centro

laurie$sep_ra = ((laurie$ra) - ra_centro)*cos(((laurie$dec+dec_centro)*pi/180)/2)
laurie$sep_dec = (laurie$dec) - dec_centro

douglas$sep_ra = ((douglas$ra) - ra_centro)*cos(((douglas$dec+dec_centro)*pi/180)/2)
douglas$sep_dec = (douglas$dec) - dec_centro

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/delta_ra-delta_dec.eps')
plot(netg$sep_ra, netg$sep_dec, col='deepskyblue3', main=expression(paste(Delta,'ra vs ',Delta,'dec WISE data')), pch=16, xlab=expression(paste(Delta,'ra [degrees]')), ylab=expression(paste(Delta,'dec [degrees]')), xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
axis(side=1, at=seq(from= -2.5, to=2.5, by=0.5))
axis(side=2, at=seq(from=-2.5, to=2.5, by=0.5))		
par(new=T)
plot(etg$sep_ra, etg$sep_dec, col='red', main='', pch=16, xlab='', ylab='', xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
par(new=T)
plot(laurie$sep_ra, laurie$sep_dec, col='green3', main='', pch=8, xlab='', ylab='', xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F, lwd=2)
par(new=T)
plot(douglas$sep_ra, douglas$sep_dec, col='black', main='', pch=8, xlab='', ylab='', xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F, lwd=2)
legend('bottomright', legend=c('etg','non-etg','riguccini+15','possible miegs'), pch=c(16,16,8,8), col=c('red','deepskyblue3','green3','black'),bty='n')

for(i in 1:6){
	text(douglas$sep_ra[i], douglas$sep_dec[i] +0.15, douglas$names[i], col='black')
}

text(laurie$sep_ra[1] +0.15, laurie$sep_dec[1], laurie$name[1], col='green3')
text(laurie$sep_ra[2] , laurie$sep_dec[2] - 0.15, laurie$name[2], col='green3')
text(laurie$sep_ra[3] , laurie$sep_dec[3] + 0.15, laurie$name[3], col='green3')
text(laurie$sep_ra[4] , laurie$sep_dec[4] + 0.15, laurie$name[4], col='green3')
text(laurie$sep_ra[5] + 0.15, laurie$sep_dec[5], laurie$name[5], col='green3')
text(laurie$sep_ra[6] - 0.15, laurie$sep_dec[6], laurie$name[6], col='green3')
text(laurie$sep_ra[7] - 0.15, laurie$sep_dec[7], laurie$name[7], col='green3')
text(laurie$sep_ra[8] + 0.15, laurie$sep_dec[8], laurie$name[8], col='green3')
dev.off()
#Normalizado por r200
r200 = 1.34
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/delta_ra-delta_dec(normalized).eps')
plot(netg$sep_ra/r200, netg$sep_dec/r200, col='deepskyblue3', main=expression(paste(Delta,'ra/',R[200], ' vs ',Delta,'dec/',R[200], ' WISE data')), pch=16, xlab=expression(paste(Delta,'ra/',R[200])), ylab=expression(paste(Delta,'dec/',R[200])), xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)
axis(side=1, at=seq(from= -1.5, to=1.5, by=0.5))
axis(side=2, at=seq(from=-1.5, to=1.5, by=0.5))		
par(new=T)
plot(etg$sep_ra/r200, etg$sep_dec/r200, col='red', main='', pch=16, xlab='', ylab='', xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)
par(new=T)
plot(laurie$sep_ra/r200, laurie$sep_dec/r200, col='green3', main='', pch=8, xlab='', ylab='', xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F, lwd=2)
par(new=T)
plot(douglas$sep_ra/r200, douglas$sep_dec/r200, col='black', main='', pch=8, xlab='', ylab='', xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F, lwd=2)
legend('bottomright', legend=c('etg','non-etg','riguccini+15','possible miegs'), pch=c(16,16,8,8), col=c('red','deepskyblue3','green3','black'),bty='n')

for(i in 1:5){
	text(douglas$sep_ra[i]/r200, douglas$sep_dec[i]/r200 +0.15, douglas$names[i], col='black')
}
text(douglas$sep_ra[6]/r200, douglas$sep_dec[6]/r200 -0.15, douglas$names[6], col='black')

text(laurie$sep_ra[1]/r200 +0.15, laurie$sep_dec[1]/r200, laurie$name[1], col='darkgreen')
text(laurie$sep_ra[2]/r200 , laurie$sep_dec[2]/r200 - 0.15, laurie$name[2], col='darkgreen')
text(laurie$sep_ra[3]/r200 , laurie$sep_dec[3]/r200 + 0.15, laurie$name[3], col='darkgreen')
text(laurie$sep_ra[4]/r200, laurie$sep_dec[4]/r200 + 0.15, laurie$name[4], col='darkgreen')
text(laurie$sep_ra[5]/r200 + 0.15, laurie$sep_dec[5]/r200, laurie$name[5], col='darkgreen')
text(laurie$sep_ra[6]/r200 - 0.15, laurie$sep_dec[6]/r200, laurie$name[6], col='darkgreen')
text(laurie$sep_ra[7]/r200 - 0.15, laurie$sep_dec[7]/r200, laurie$name[7], col='darkgreen')
text(laurie$sep_ra[8]/r200 + 0.15, laurie$sep_dec[8]/r200, laurie$name[8], col='darkgreen')
dev.off()


#delta_ra vs delta_dec for SDSS Coma semple

data = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Paulo_Coma_Selection/cluster.gals.sel.shiftgap.iter.00001', header=T, sep='')
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='')
douglas = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep='')

ra_centro = (194.940) ; dec_centro = (27.833)
data$sep_ra = ((data$ra) - ra_centro)*cos(((data$dec+dec_centro)*pi/180)/2)
data$sep_dec = (data$dec) - dec_centro

etg = subset(data, data$type == 1) ; netg= subset(data, data$type == 0)

etg_m = subset(etg, etg$iflag == 0) ; etg_i = subset(etg, etg$iflag == 1)

netg_m = subset(netg, netg$iflag == 0) ; netg_i = subset(netg, netg$iflag == 1)

douglas$sep_ra = ((douglas$ra) - ra_centro)*cos(((douglas$dec+dec_centro)*pi/180)/2)
douglas$sep_dec = (douglas$dec) - dec_centro
douglas_m = subset(douglas, douglas$iflag == 0) ; douglas_i = subset(douglas, douglas$iflag == 1)

laurie$sep_ra = ((laurie$ra) - ra_centro)*cos(((laurie$dec+dec_centro)*pi/180)/2)
laurie$sep_dec = (laurie$dec) - dec_centro

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/SDSS-delta_ra-vs-delta_dec.eps')
plot(netg_m$sep_ra, netg_m$sep_dec, col='deepskyblue3', main=expression(paste(Delta,'ra vs ',Delta,'dec for SDSS Coma Selection')), 
     pch=16, xlab=expression(paste(Delta,'ra [degrees]')), ylab=expression(paste(Delta,'dec [degrees]')), 
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
axis(side=1, at=seq(from= -2.5, to=2.5, by=0.5))
axis(side=2, at=seq(from=-2.5, to=2.5, by=0.5))		
par(new=T)
plot(netg_i$sep_ra, netg_i$sep_dec, col='deepskyblue3', main='', xlab='',ylab='',pch=2,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
par(new=T)
plot(etg_m$sep_ra, etg_m$sep_dec, col='red', main='', xlab='',ylab='',pch=16,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
par(new=T)
plot(etg_i$sep_ra, etg_i$sep_dec, col='red', main='', xlab='',ylab='',pch=2,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
par(new=T)
plot(douglas_m$sep_ra, douglas_m$sep_dec, col='black', main='', xlab='',ylab='',pch=16,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
par(new=T)
plot(douglas_i$sep_ra, douglas_i$sep_dec, col='black', main='', xlab='',ylab='',pch=2,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
par(new=T)
plot(laurie$sep_ra, laurie$sep_dec, col='green3', main='', xlab='',ylab='',pch=8,lwd=2,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
for(i in 1:6){
	text(douglas$sep_ra[i], douglas$sep_dec[i] +0.15, douglas$names[i], col='black')
}
text(laurie$sep_ra[1] +0.15, laurie$sep_dec[1], laurie$name[1], col='black')
text(laurie$sep_ra[2] , laurie$sep_dec[2] - 0.15, laurie$name[2], col='black')
text(laurie$sep_ra[3] , laurie$sep_dec[3] + 0.15, laurie$name[3], col='black')
text(laurie$sep_ra[4] , laurie$sep_dec[4] + 0.15, laurie$name[4], col='black')
text(laurie$sep_ra[5] + 0.15, laurie$sep_dec[5], laurie$name[5], col='black')
text(laurie$sep_ra[6] - 0.15, laurie$sep_dec[6], laurie$name[6], col='black')
text(laurie$sep_ra[7] - 0.15, laurie$sep_dec[7], laurie$name[7], col='black')
text(laurie$sep_ra[8] + 0.15, laurie$sep_dec[8], laurie$name[8], col='black')
legend('bottomleft', legend=c('members','interloopers'),pch=c(16,2),col=c('gray','gray'), bty='n')
legend('bottomright', legend=c('etg','netg','riguccini+15','possbile miegs'), pch=c(1,1,1,1), col=c('red','deepskyblue3','green3','black'), bty='n')
dev.off()
#Normalizado
r200 = 1.34
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/SDSS-delta_ra-vs-delta_dec(normalized).eps')
plot(netg_m$sep_ra/r200, netg_m$sep_dec/r200, col='deepskyblue3', main=expression(paste(Delta,'ra/',R[200], ' vs ',Delta,'dec/',R[200], ' for SDSS Coma Selection')), pch=16, xlab=expression(paste(Delta,'ra/',R[200])), ylab=expression(paste(Delta,'dec [degrees]')), xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)
axis(side=1, at=seq(from= -1.5, to=1.5, by=0.5))
axis(side=2, at=seq(from=-1.5, to=1.5, by=0.5))		
par(new=T)
plot(netg_i$sep_ra/r200, netg_i$sep_dec/r200, col='deepskyblue3', main='', xlab='',ylab='',pch=2, xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)
par(new=T)
plot(etg_m$sep_ra/r200, etg_m$sep_dec/r200, col='red', main='', xlab='',ylab='',pch=16, xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)
par(new=T)
plot(etg_i$sep_ra/r200, etg_i$sep_dec/r200, col='red', main='', xlab='',ylab='',pch=2, xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)
par(new=T)
plot(douglas_m$sep_ra/r200, douglas_m$sep_dec/r200, col='black', main='', xlab='',ylab='',pch=16, xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)
par(new=T)
plot(douglas_i$sep_ra/r200, douglas_i$sep_dec/r200, col='black', main='', xlab='',ylab='',pch=2, xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)
par(new=T)
plot(laurie$sep_ra/r200, laurie$sep_dec/r200, col='green3', main='', xlab='',ylab='',pch=8,lwd=2, xlim=c(-1.5,1.5), ylim=c(-1.5,1.5), axes=F)

text(douglas$sep_ra[1]/r200, (douglas$sep_dec[1]/r200) +0.1, douglas$names[1], col='black')
text(douglas$sep_ra[2]/r200, (douglas$sep_dec[2]/r200) -0.1, douglas$names[2], col='black')
text(douglas$sep_ra[3]/r200, (douglas$sep_dec[3]/r200) +0.1, douglas$names[3], col='black')
text(douglas$sep_ra[4]/r200, (douglas$sep_dec[4]/r200) +0.1, douglas$names[4], col='black')
text(douglas$sep_ra[5]/r200, (douglas$sep_dec[5]/r200) +0.1, douglas$names[5], col='black')
text(douglas$sep_ra[6]/r200, (douglas$sep_dec[6]/r200) -0.1, douglas$names[6], col='black')

text(laurie$sep_ra[1]/r200 +0.1, laurie$sep_dec[1]/r200, laurie$name[1], col='darkgreen')
text(laurie$sep_ra[2]/r200 , laurie$sep_dec[2]/r200 - 0.1, laurie$name[2], col='darkgreen')
text(laurie$sep_ra[3]/r200 , laurie$sep_dec[3]/r200 + 0.1, laurie$name[3], col='darkgreen')
text(laurie$sep_ra[4]/r200 , laurie$sep_dec[4]/r200 + 0.1, laurie$name[4], col='darkgreen')
text(laurie$sep_ra[5]/r200 + 0.1, laurie$sep_dec[5]/r200, laurie$name[5], col='darkgreen')
text(laurie$sep_ra[6]/r200 - 0.1, laurie$sep_dec[6]/r200, laurie$name[6], col='darkgreen')
text(laurie$sep_ra[7]/r200 - 0.1, laurie$sep_dec[7]/r200, laurie$name[7], col='darkgreen')
text(laurie$sep_ra[8]/r200 + 0.1, laurie$sep_dec[8]/r200, laurie$name[8], col='darkgreen')
legend('bottomleft', legend=c('members','interloopers'),pch=c(16,2),col=c('gray','gray'), bty='n')
legend('bottomright', legend=c('etg','netg','riguccini+15','possbile miegs'), pch=c(1,1,1,1), col=c('red','deepskyblue3','green3','black'), bty='n')
dev.off()




#Lw4/Lw1 vs Lw1 ETG and N-ETG for SDSS Coma sample

etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/membros.dat', header=T, sep='')
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='')
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='')
douglas = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep='')
laurie$Log_Lw_ratio = laurie$Log_Lw4 - laurie$Log_Lw1

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Lw1_vs_Lwratio.eps')
plot(etg$Log_Lw1, etg$Log_Lw_ratio, col='red', pch=16, main='Log(Lw1) vs Log(Lw4/Lw1) for Coma', 
     xlab=expression(paste('Log(Lw1) [',L[sun],']')), ylab=expression(paste('Log(Lw4/Lw1) [erg/s',L[sun],']')), 
     xlim=c(7.6,9.8), ylim=c(31.5,34.5), axes=F)
axis(side=1, at=seq(from=7.6, to=9.8, by=0.1))
axis(side=2, at=seq(from= 31.5, to=34.5, by=0.1))
#magaxis(side = 4, ylab = "", labels=F)
par(new=T)
plot(netg$Log_Lw1, netg$Log_Lw_ratio, col='deepskyblue3', pch=16, xlab='', ylab='', main='', 
     xlim=c(7.6,9.8), ylim=c(31.5,34.5), axes=F)
par(new=T)
plot(laurie$Log_Lw1, laurie$Log_Lw_ratio, col='green', pch=8, lwd=2, xlab='', ylab='', main='', 
     xlim=c(7.6,9.8), ylim=c(31.5,34.5), axes=F)
par(new=T)
plot(douglas$Log_Lw1, douglas$Log_Lw_ratio, col='red', pch=8, lwd=2, xlab='', ylab='', main='', 
     xlim=c(7.6,9.8), ylim=c(31.5,34.5), axes=F)
text(7.7,33,'gaussians')
text(7.7,32.8,'intersection')

for(i in 1:6){
	text(douglas$Log_Lw1[i], douglas$Log_Lw_ratio[i] +0.1, douglas$names[i], col='black')
}
for(i in 1:8){
	text(laurie$Log_Lw1[i], laurie$Log_Lw_ratio[i] +0.1, laurie$name[i], col='green')
}
abline(h=32.911, col='black',lty=2,lwd=2)
legend('bottomleft', legend=c('etg', 'non-etg', 'riguccini+15', 'possible miegs'), pch=c(16,16,8,8), 
       col=c('red','deepskyblue3','green','black'), bty='n')
dev.off()


### M vs SFR MPA-JHU data

etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_MPA-JHU.dat', header=T, sep='')
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_MPA-JHU.dat', header=T, sep='')
possible_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/possible_miegs-MPA-JHU.dat', header=T, sep='')
miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/miegs-MPA-JHU.dat', header=T, sep='')
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/MPA-JHU-M_vs_SFR:Coma.eps")
plot(etg$alog_mass_tot, etg$alog_sfr_tot, col='red', pch=16, 
     xlab=expression(paste('Log(',M['stellar'],')   ', '[',M[sun],']')), 
     ylab=expression(paste('Log(SFR)')), main=expression(paste(M[stelar],' vs SFR: Coma Cluster MPA-JHU Data')), 
     axes=F, xlim=c(7.90, 11.5), ylim=c(-3.4,0.6))
axis(side=1, at=seq(from=7.9, to=11.5, by=0.1))
axis(side=2, at=seq(from=-3.4, to=0.6, by=0.5))
par(new=T)
plot(netg$alog_mass_tot, netg$alog_sfr_tot, col='deepskyblue3', pch=16, xlab='', ylab='', main='', axes=F, 
     xlim=c(7.90, 11.5), ylim=c(-3.4,0.6))
par(new=T)
plot(miegs$alog_mass_tot, miegs$alog_sfr_tot, col='green3', pch=8, lwd=3, xlab='', ylab='', main='', axes=F, 
     xlim=c(7.90, 11.5), ylim=c(-3.4,0.6))
par(new=T)
plot(possible_miegs$alog_mass_tot, possible_miegs$alog_sfr_tot, col='red', pch=8, lwd=3, xlab='', ylab='', 
     main='', axes=F, xlim=c(7.90, 11.5), ylim=c(-3.4,0.6))
legend('topleft', legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), pch=c(16,16,8,8), 
       col=c('red','deepskyblue3','green3','red'), bty='n')

for(i in 1:6){
	text(possible_miegs$alog_mass_tot[i], possible_miegs$alog_sfr_tot[i] + 0.15, 
       possible_miegs$X_names[i], col='black')
}
for(i in 1:8){
	text(miegs$alog_mass_tot[i], miegs$alog_sfr_tot[i] + 0.15, miegs$X_name[i], col='green3')
}
dev.off()

setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/MPA-JHU-M_vs_sSFR:Coma.eps")
plot(etg$alog_mass_tot, etg$alog_ssfr_tot, col='red', pch=16, xlab=expression(paste('Log(',M['stellar'],')', '[',M[sun],']')),
  ylab=expression(paste('Log(sSFR)')), 
  main=expression(paste(M[stelar],' vs sSFR: Coma Cluster MPA-JHU Data')),axes=F, 
  xlim=c(7.90, 11.5), ylim=c(-12.6,-8.6))
axis(side=1, at=seq(from=7.9, to=11.5, by=0.1))
axis(side=2, at=seq(from=-12.6, to=-8.6, by=0.5))
par(new=T)
plot(netg$alog_mass_tot, netg$alog_ssfr_tot, col='deepskyblue3', pch=16, xlab='', ylab='', main='', 
  axes=F, xlim=c(7.90, 11.5), ylim=c(-12.6,-8.6))
par(new=T)
plot(miegs$alog_mass_tot, miegs$alog_ssfr_tot, col='green3', pch=8, lwd=3, xlab='', ylab='', main='', 
  axes=F, xlim=c(7.90, 11.5), ylim=c(-12.6,-8.6))
par(new=T)
plot(possible_miegs$alog_mass_tot, possible_miegs$alog_ssfr_tot, col='red', pch=8, lwd=3, xlab='', 
  ylab='', main='', axes=F, xlim=c(7.90, 11.5), ylim=c(-12.6,-8.6))
legend('topright', legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), pch=c(16,16,8,8), 
  col=c('red','deepskyblue3','green3','red'), bty='n')

for(i in 1:6){
	text(possible_miegs$alog_mass_tot[i], possible_miegs$alog_ssfr_tot[i] + 0.15, possible_miegs$X_names[i], col='black')
}
for(i in 1:8){
	text(miegs$alog_mass_tot[i], miegs$alog_ssfr_tot[i] + 0.15, miegs$X_name[i], col='green3')
}
dev.off()


# W3/W1 vs W1
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='')
douglas = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep="")
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ETG_Non-ETG_LW3ratio vs LW1.eps')
plot(netg$Log_Lw1, netg$Log_Lw3 - netg$Log_Lw1, main = 'Lw3/Lw1 vs Lw1 for Coma Cluster data', xlab = 'Log(Lw1)   [Lsun]', ylab = 'Log(Lw3/Lw1)   [erg/sLsun]', col='deepskyblue3', pch=16, xlim = c(7.5,10), ylim=c(-1.5,0.5), axes=F)
axis(side=1, at=seq(from=7.5, to=10.0, by=0.1))
axis(side=2, at=seq(from=-1.5, to=0.5, by=0.1))
par(new=T)
plot(etg$Log_Lw1, etg$Log_Lw3 - etg$Log_Lw1, main = '', xlab = '', ylab = '', col='red', pch=16, xlim = c(7.5,10), ylim=c(-1.5,0.5), axes=F)
par(new=T)
plot(laurie$Log_Lw1, laurie$Log_Lw3 - laurie$Log_Lw1, main = '', xlab = '', ylab = '', col='green', lwd=3, pch=8, xlim = c(7.5,10), ylim=c(-1.5,0.5), axes=F)
par(new=T)
plot(douglas$Log_Lw1, douglas$Log_Lw3 - douglas$Log_Lw1, main = '', xlab = '', ylab = '', col='red', lwd=3, pch=8, xlim = c(7.5,10), ylim=c(-1.5,0.5), axes=F)
for(i in 1:6){
	text(douglas$Log_Lw1[i], (douglas$Log_Lw3[i] - douglas$Log_Lw1[i]) + 0.1, douglas$names[i], col='black')}
for(i in 1:8){
	text(laurie$Log_Lw1[i], (laurie$Log_Lw3[i] - laurie$Log_Lw1[i]) + 0.1, laurie$name[i], col='green3')}
legend('bottomleft', legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), pch=c(16,16,8,8), col=c('red','deepskyblue3','green3','red'), bty='n')
dev.off()

### sSFR(salim) vs sSFR(MPA-JHU)####

etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_salim+mpa.dat', header=T, sep='')
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_salim+mpa.dat', header=T, sep='')
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/laurie_salim+mpa.dat', header=T, sep='')
candidates = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/candidates_salim+mpa.dat', header=T,sep='')

#stellar mass -> col10
#SFR          -> col12

etg_ssfr_salim = etg$col12 - etg$col10
netg_ssfr_salim = netg$col12 - netg$col10
laurie_ssfr_salim = laurie$col12 - laurie$col10
candidates_ssfr_salim = candidates$col12 - candidates$col10

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/sSFR(salim)_vs_sSFR(MPA-JHU).eps')
plot(etg_ssfr_salim, etg$alog_ssfr_tot, col='red', pch=16, xlab = "Log(sSFR) [salim]", 
  ylab = "Log(sSFR) [MPA-JHU]", main= 'Log sSFR (salim) vs Log sSFR (MPA-JHU)', 
  xlim = c(-13.4, -8.5), ylim= c(-13.0, -8.5), axes=F)
axis(side=1, at=seq(from=-13.4, to=-8.5, by=0.1))
axis(side=2, at=seq(from= -13.0, to=-8.5, by=0.1))
par(new=T)
plot(netg_ssfr_salim, netg$alog_ssfr_tot, col='deepskyblue3', pch=16, xlab='', ylab='', main='', 
  xlim = c(-13.4, -8.5), ylim= c(-13.0, -8.5), axes=F)
par(new=T)
plot(laurie_ssfr_salim, laurie$alog_ssfr_tot, col='green3', lwd=3, pch=8, xlab='', ylab='', main='', 
     xlim = c(-13.4, -8.5), ylim= c(-13.0, -8.5), axes=F)
par(new=T)
plot(candidates_ssfr_salim, candidates$alog_ssfr_tot, col='red', lwd=3, pch=8, xlab='', ylab='', main='', 
     xlim = c(-13.4, -8.5), ylim= c(-13.0, -8.5), axes=F)
for(i in 1:6){
  text(candidates_ssfr_salim[i], candidates$alog_ssfr_tot[i] + 0.15, 
  candidates$names[i], col='red')}
for(i in 1:8){
  text(laurie_ssfr_salim[i], laurie$alog_ssfr_tot[i] + 0.15, 
  laurie$name[i], col='black')}
legend('topleft', legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), pch=c(16,16,8,8), 
  col=c('red','deepskyblue3','green3','red'), bty='n')
dev.off()

