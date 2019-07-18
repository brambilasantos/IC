### Coma SDSS-WISE Selection. Analazing with our galaxie morphology separation ####

#Lw1 vs Lw4 for ETG and N-ETG for Coma Galaxies with a linear fit	
etg = read.table("/home/douglas/Documentos/MEGA/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001",
                 header=T, sep='') 
netg = read.table("/home/douglas/Documentos/MEGA/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001",
                  header=T, sep='') 
possible_miegs = read.table("/home/douglas/Documentos/MEGA/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat", 
                            header=T, sep="")
miegs=read.table("/home/douglas/Documentos/MEGA/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat",
                 header=T, sep="")

grupo = subset(etg, etg$Log_Lw1 > 8.75)
grupo2 = subset(grupo, grupo$Log_Lw4 < 42.2) 

ajuste = lm(grupo2$Log_Lw4 ~ grupo2$Log_Lw1)
ajuste2=lm(I(grupo2$Log_Lw4 + 3*sd(grupo2$Log_Lw4)) ~ grupo2$Log_Lw1)
ajuste3=lm(I(grupo2$Log_Lw4 - 3*sd(grupo2$Log_Lw4)) ~ grupo2$Log_Lw1)

setEPS()
postscript("/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/Graficos/Lw1_vs_Lw4:ETG_regression.eps")
par(mgp = c(2,1,1))
plot(etg$Log_Lw1, etg$Log_Lw4, col='red', pch=16, xlab='Log(Lw1) [Lsun]', ylab='Log(Lw4) [erg/s]', 
     main='Lw1 vs Lw4: Coma Cluster',axes=F, xlim=c(7.55, 10), ylim=c(41.2,43.3))
axis(side=1, at=seq(from=7.55, to=10, by=0.1), font = 2, cex.axis = 1.2, pos =41.2)
axis(side=2, at=seq(from=41.2, to=43.3, by=0.1), font = 2, cex.axis = 1.2, pos = 7.55)
par(new=T)
plot(netg$Log_Lw1, netg$Log_Lw4, col='deepskyblue3', pch=16, axes=F, xlab='', ylab='', main='', 
     xlim=c(7.55, 10), ylim=c(41.2,43.3))
par(new=T)
plot(miegs$Log_Lw1, miegs$Log_Lw4, col='green', lwd=3, pch=8, axes=F, xlab='', ylab='', main='', 
     xlim=c(7.55, 10), ylim=c(41.2,43.3))
par(new=T)
plot(possible_miegs$Log_Lw1, possible_miegs$Log_Lw4, col='black', lwd=3, pch=8, axes=F, xlab='', 
     ylab='', main='', xlim=c(7.55, 10), ylim=c(41.2,43.3))
abline(ajuste, lty=1)
abline(ajuste2, lty=2)
abline(ajuste3, lty=2)
clip(7.55,9.95, 41.2, 43.3)

legend(x=7.55,y=43.3, legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), 
       col=c("red", "deepskyblue3", 'green', 'black'), pch=c(16, 16, 16,8), bty='n')
legend(x=7.55,y=42.95, legend=c('linear fit', expression(bold(paste('3',sigma)))), lty=c(1,2), bty='n')
for(i in 1:6){
  text(possible_miegs$Log_Lw1[i],possible_miegs$Log_Lw4[i]-0.07, possible_miegs$names[i]) 
}
for(i in 1:8){
  text(miegs$Log_Lw1[i],miegs$Log_Lw4[i]-0.07, miegs$name[i])  
}
dev.off()


#Plot for Stelar Mass vs Specific Star Formation (Log_M vs sSFR)
etg = read.table("/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001", 
                 header=T, sep='') 
netg = read.table("/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001", 
                  header=T, sep='') 
possible_miegs = read.table("/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat", 
                            header=T, sep="")
miegs=read.table("/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat", 
                 header=T, sep="")

setEPS()
postscript("/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/Graficos/M_vs_sSFR:Coma.eps")
par(mgp = c(2,1,1))
plot(netg$Log_M_stellar, netg$Log_sSFR, col='deepskyblue3', pch=16, 
     xlab=expression(bold(paste('Log(',M['stelar'],')'))), 
     ylab='Log(sSFR)', 
     main=expression(bold(paste(M[stelar],' vs sSFR: Coma Cluster'))),
     xlim=c(7.8, 11.5), ylim=c(-8.5,-15.5), cex.lab = 1.4, font.lab = 2, axes=F)
axis(side=1, at=seq(from=7.5, to=11.5, by=0.5), font = 2, cex.axis = 1.2, pos=-8.5)
axis(side=2, at=seq(from=-8.5, to=-15.5, by=-0.5), font = 2, cex.axis = 1.2, pos=7.8)
par(new=T)
plot(etg$Log_M_stellar, etg$Log_sSFR, col='red', pch=16, axes=F, xlab='', ylab='', 
     main='', xlim=c(7.8, 11.5), ylim=c(-8.5,-15.5))
par(new=T)
plot(miegs$Log_M_stellar, miegs$Log_sSFR, col='green', lwd=3, pch=0, axes=F, xlab='', ylab='', 
     main='', xlim=c(7.8, 11.5), ylim=c(-8.5,-15.5), cex = 1.7)
par(new=T)
plot(possible_miegs$Log_M_stellar, possible_miegs$Log_sSFR, col='black',lwd=3, pch=2, axes=F, 
     xlab='', ylab='', main='', xlim=c(7.8, 11.5), ylim=c(-8.5,-15.5), cex = 1.7)
legend(7.81,-15.5, legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), 
       col=c("red", "deepskyblue3", 'green', 'black'), pch=c(16, 16, 8,8), bty='n')
for(i in 1:6){
  text(possible_miegs$Log_M_stellar[i],possible_miegs$Log_sSFR[i]-0.2, possible_miegs$names[i])  
}
for(i in 1:8){
  text(miegs$Log_M_stellar[i],miegs$Log_sSFR[i]+0.2, miegs$name[i])  
}
dev.off()

#Plot for Stelar Mass vs Specific Star Formation (Salim data)
etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_paulo+salim.dat', 
                 header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_paulo+salim.dat', 
                  header=T, sep='')
possible_miegs = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible-miegs_paulo+salim.dat', 
                            header=T, sep='')
miegs = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Miegs(riguccini)_paulo+salim.dat', 
                   header=T, sep='')
#stellar mass -> col10
#SFR 	        -> col12	
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Salim-M_vs_sSFR:Coma.eps")
plot(etg$col10, etg$col12 - etg$col10, col='red', pch=16, 
     xlab=expression(bold(paste('Log(',M['stellar'],')   ', '[',M[sun],']')))), 
     ylab=expression(bold(paste('Log(sSFR)')))), 
     main=expression(bold(paste(M[stelar],' vs sSFR: Coma Cluster With Salim Data')))),
     axes=F, xlim=c(8.0, 11.0), ylim=c(-13.0,-9))
axis(side=1, at=seq(from=8, to=11.0, by=0.1))
axis(side=2, at=seq(from=-13.0, to=-9, by=1))
par(new=T)
plot(netg$col10, netg$col12 - netg$col10, col='deepskyblue3', pch=16, axes=F, xlab='', 
     ylab='', main='', xlim=c(8.0, 11.0), ylim=c(-13.0,-9))
par(new=T)
plot(miegs$col10, miegs$col12 - miegs$col10, col='green3', lwd=3, pch=8, axes=F, xlab='', 
     ylab='', main='', xlim=c(8.0, 11.0), ylim=c(-13.0,-9))
par(new=T)
plot(possible_miegs$col10, possible_miegs$col12 - possible_miegs$col10, col='red',lwd=3, 
     pch=8, axes=F, xlab='', ylab='', main='', xlim=c(8.0, 11.0), ylim=c(-13.0,-9))
legend("bottomleft", legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), 
       col=c("red", "deepskyblue3", 'green3', 'red'), pch=c(16, 16, 8,8), bty='n')
y= possible_miegs$col12 - possible_miegs$col10
for(i in 1:6){
	text(possible_miegs$col10[i], y[i] + 0.2, possible_miegs$names[i], col='black')
}
for(i in 1:8){
	text(miegs$col10[i], (miegs$col12[i] - miegs$col10[i]) + 0.2, miegs$name[i], col='green3')
}
dev.off()

#Plot for Stelar Mass vs Star Formation Rate (Salim data)
etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_paulo+salim.dat'
                 , header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_paulo+salim.dat', 
                  header=T, sep='')
possible_miegs= read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible-miegs_paulo+salim.dat',
                           header=T, sep='')
miegs= read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Miegs(riguccini)_paulo+salim.dat', 
                  header=T, sep='')
#stellar mass -> col10
#SFR 	      -> col12	
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Salim-M_vs_SFR:Coma.eps")
plot(etg$col10, etg$col12, col='red', pch=16, 
     xlab=expression(bold(paste('Log(',M['stellar'],')   ', '[',M[sun],']')))), 
     ylab=expression(bold(paste('Log(SFR)')))), 
     main=expression(bold(paste(M[stelar],' vs SFR: Coma Cluster With Salim Data')))),
     axes=F, xlim=c(8.5, 11.0), ylim=c(-2.7,1.0))
axis(side=1, at=seq(from=8.5, to=11.0, by=0.1))
axis(side=2, at=seq(from=-2.7, to=1.0, by=0.1))
par(new=T)
plot(netg$col10, netg$col12, col='deepskyblue3', pch=16, axes=F, xlab='', ylab='', 
     main='', xlim=c(8.5, 11.0), ylim=c(-2.7,1.0))
par(new=T)
plot(miegs$col10, miegs$col12, col='green3', lwd=3, pch=8, axes=F, xlab='', ylab='', 
     main='', xlim=c(8.5, 11.0), ylim=c(-2.7,1.0))
par(new=T)
plot(possible_miegs$col10, possible_miegs$col12, col='red',lwd=3, pch=8, axes=F, xlab='', 
     ylab='', main='', xlim=c(8.5, 11.0), ylim=c(-2.7,1.0))
legend("bottomleft", legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), 
       col=c("red", "deepskyblue3", 'green3', 'red'), pch=c(16, 16, 8,8), bty='n')
y= possible_miegs$col12
for(i in 1:6){
	text(possible_miegs$col10[i], y[i] + 0.2, possible_miegs$names[i], col='black')
}
for(i in 1:8){
	text(miegs$col10[i], miegs$col12[i]+ 0.2, miegs$name[i], col='green3')
}
dev.off()


#Plot for Stelar Mass vs Star Formation Rate (Coma+Salim data)
etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/etg_dr12+salim.dat', header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/netg_dr12+salim.dat', header=T, sep="")
laurie = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/dr12+salim_laurie_miegs.dat', 
                    header=T, sep='')
douglas = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/dr12+salim_possible_miegs.dat', 
                     header=T, sep='')

etg_sem = 0
netg_sem = 0
for(i in 1:246){
	if( etg$col10[i] == -99 || etg$col12[i] == -99){
		etg_sem = etg_sem + 	1
	}
}

setEPS()
postscript('/media/douglas13/ESD-USB/UFRJ/IC/Coma_Analize/Graficos/dr12+salim_M_vs_SFR.eps')
par(mgp = c(2,1,1))
plot(netg$col10, netg$col12, xlim=c(8,12), ylim = c(-4,1), col='deepskyblue3', pch=16, 
     xlab=expression(bold(paste('Log(',M['stellar'],')   ', '[',M[sun],']')))), 
     ylab=expression(bold(paste('Log(SFR)   ','[',M[sun],'/year]')))), 
     cex=0.8, cex.lab = 1.4, font.lab = 2, axes=F)
title(expression(bold(paste(M[stelar],' vs SFR: dr12 + salim')))), line=-0.05, cex.main = 1.5,
      font.main = 2)
axis(side=1, at=seq(from=8, to=12, by=.5), font = 2, cex.axis = 1.2, pos = -4)
axis(side=2, at=seq(from=-4, to=1, by=1.), font = 2, cex.axis = 1.2, pos = 8)
par(new=T)
plot(etg$col10, etg$col12, xlim=c(8,12), ylim = c(-4,1), col='red', pch=16, 
     axes=F, xlab='', ylab='', main='')
par(new=T)
plot(laurie$col10, laurie$col12, xlim=c(8,12), ylim = c(-4,1), col='green3', pch=0, lwd=3, cex=1.5,
     axes=F, xlab='', ylab='', main='')
par(new=T)
plot(douglas$col10, douglas$col12, xlim=c(8,12), ylim = c(-4,1), col='black', pch=2, 
     lwd=3, cex=1.5, axes=F, xlab='', ylab='', main='')
legend(x=8., y=-3., legend=c("etg", 'n-etg','Riguccini+15', 'possible miegs'), 
       col=c("red", "deepskyblue3", 'green3', 'black'), pch=c(16, 16, 0,2), bty='n')
for(i in 3:6){
  text(douglas$col10[i], douglas$col12[i] -0.2, douglas$names[i], col='black', font=2)
}
for(i in 1:2){
  text(douglas$col10[i]-0.2, douglas$col12[i], douglas$names[i], col='black', font=2)
}
for(i in 1:8){
  text(laurie$col10[i], laurie$col12[i]+ 0.2, laurie$name[i], col='green3', font=2 )
}
dev.off()

#M vs sSFR (dr12+salim)
setEPS()
postscript('/media/douglas13/ESD-USB/UFRJ/IC/Coma_Analize/Graficos/dr12+salim_M_vs_sSFR.eps')
y2 = etg$col12 - etg$col10
y1 = netg$col12 - netg$col10
par(mgp = c(2,1,1))
plot(netg$col10, y1, xlim=c(8,12), ylim = c(-13.5,-8.5), col='deepskyblue3', pch=16,
     xlab=expression(bold(paste('Log(',M['stellar'],')   ', '[',M[sun],']')))), 
     ylab=expression(bold(paste('Log(sSFR)')))), 
     cex=0.8, cex.lab = 1.4, font.lab = 2, axes=F)
title(expression(bold(paste(M[stelar],' vs sSFR: dr12 + salim')))), line=-0.05, cex.main = 1.5,
      font.main = 2)
axis(side=1, at=seq(from=8, to=12, by=.5), font = 2, cex.axis = 1.2, pos = -13.5)
axis(side=2, at=seq(from=-13.5, to=-8.5, by=0.5), font = 2, cex.axis = 1.2, pos = 8)
par(new=T)
plot(etg$col10, y2, xlim=c(8,12), ylim = c(-13.5,-8.5), col='red', pch=16, 
     axes=F, xlab='', ylab='', main='')
par(new=T)
plot(laurie$col10, laurie$col12 - laurie$col10, xlim=c(8,12), ylim = c(-13.5,-8.5), 
     col='green3', pch=0, cex=1.5, lwd=3, axes=F, xlab='', ylab='', main='')
par(new=T)
plot(douglas$col10, douglas$col12 - douglas$col10, xlim=c(8,12), ylim = c(-13.5,-8.5), 
     col='black', pch=2, lwd=3, cex=1.5, axes=F, xlab='', ylab='', main='')
legend(x=8, y=-12.5, legend=c("etg", 'n-etg','Riguccini+15', 'possible miegs'), 
       col=c("red", "deepskyblue3", 'green3', 'black'), pch=c(16, 16, 0,2), bty='n')
for(i in 1:6){
  text(douglas$col10[i] - 0.1, (douglas$col12[i] - douglas$col10[i] ), douglas$names[i], 
       col='black', font=2)
}
lista = c(1,2,3,5,6,8)
for(i in lista){
  text(laurie$col10[i], (laurie$col12[i] - laurie$col10[i]) + 0.2, laurie$name[i], 
       col='green3', font=2)
}
text(laurie$col10[4], (laurie$col12[4] - laurie$col10[4]-0.2), laurie$name[4], 
     col='green3', font=2)
text(laurie$col10[7]-0.1, (laurie$col12[7] - laurie$col10[7])+0.2, laurie$name[7], 
     col='green3', font=2)
dev.off()


#delta_ra vs delta_dec

etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/membros.dat', 
                 header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', 
                  header=T, sep='')
laurie = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat',
                    header=T, sep='')
douglas = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', 
                     header=T, sep='')

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
postscript('/media/douglas13/ESD-USB/UFRJ/IC/Coma_Analize/Graficos/delta_ra-delta_dec.eps')
par(mgp = c(2,1,1))
plot(netg$sep_ra, netg$sep_dec, col='deepskyblue3',pch=16, 
     xlab=expression(bold(paste(Delta,'ra [degrees]')))), 
     ylab=expression(bold(paste(Delta,'dec [degrees]')))), 
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), cex=0.8, cex.lab = 1.4, font.lab = 2, axes=F)
title(main=expression(bold(paste(Delta,'ra vs ',Delta,'dec WISE data')))), line = -0.05, font.main = 2, 
      cex.main = 1.5)
axis(side=1, at=seq(from= -2.5, to=2.5, by=1), font = 2, cex.axis = 1.2, pos = -2.5)
axis(side=2, at=seq(from=-2.5, to=2.5, by=1), font = 2, cex.axis = 1.2, pos = -2.5)		
par(new=T)
plot(etg$sep_ra, etg$sep_dec, col='red', main='', pch=16, xlab='', ylab='', 
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F)
par(new=T)
plot(laurie$sep_ra, laurie$sep_dec, col='green3', main='', pch=0, xlab='', ylab='', 
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F, lwd=3, cex=1.5)
par(new=T)
plot(douglas$sep_ra, douglas$sep_dec, col='black', main='', pch=2, xlab='', ylab='', 
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), axes=F, lwd=3, cex =1.5)
legend(x=-2.5, y=-1.5, legend=c('etg','netg','riguccini+15','possible miegs'), 
       pch=c(16,16,0,2), col=c('red','deepskyblue3','green3','black'),bty='n')

for(i in 1:6){
	text(douglas$sep_ra[i], douglas$sep_dec[i] +0.2, douglas$names[i], col='black', font =2)
}

text(laurie$sep_ra[1] -0.2, laurie$sep_dec[1], laurie$name[1], col='green3', font =2)
text(laurie$sep_ra[2] , laurie$sep_dec[2] - 0.2, laurie$name[2], col='green3', font =2)
text(laurie$sep_ra[3] , laurie$sep_dec[3] + 0.2, laurie$name[3], col='green3', font =2)
text(laurie$sep_ra[4] , laurie$sep_dec[4] + 0.2, laurie$name[4], col='green3', font =2)
text(laurie$sep_ra[5] + 0.2, laurie$sep_dec[5], laurie$name[5], col='green3', font =2)
text(laurie$sep_ra[6] - 0.2, laurie$sep_dec[6], laurie$name[6], col='green3', font =2)
text(laurie$sep_ra[7] - 0.2, laurie$sep_dec[7], laurie$name[7], col='green3', font =2)
text(laurie$sep_ra[8] + 0.2, laurie$sep_dec[8], laurie$name[8], col='green3', font =2)
dev.off()

#Normalizado por r200
r200 = 2.34
setEPS()
postscript('/media/douglas13/ESD-USB/UFRJ/IC/Coma_Analize/Graficos/poicionamento_normalizado.eps')
par(mgp = c(2,1,1))
plot(netg$sep_ra/r200, netg$sep_dec/r200, col='deepskyblue3', 
     pch=16, xlab=expression(bold(paste(Delta,'ra/',R[200])))), 
     ylab=expression(bold(paste(Delta,'dec/',R[200])))), 
     xlim=c(-1,1), ylim=c(-1,1), cex=0.8, cex.lab = 1.4, font.lab = 2, axes=F)
title(expression(bold(paste(Delta,'ra/',R[200], ' vs ',Delta,'dec/',R[200], ' WISE data')))),
      line = -0.05, font.main = 2, cex.main = 1.5)
axis(side=1, at=seq(from= -1, to=1, by=0.5), font = 2, cex.axis = 1.2, pos = -1)
axis(side=2, at=seq(from=-1, to=1, by=0.5), font = 2, cex.axis = 1.2, pos = -1)		
par(new=T)
plot(etg$sep_ra/r200, etg$sep_dec/r200, col='red', main='', 
     pch=16, xlab='', ylab='', xlim=c(-1,1), ylim=c(-1,1), axes=F)
par(new=T)
plot(laurie$sep_ra/r200, laurie$sep_dec/r200, col='green3', main='', 
     pch=0, xlab='', ylab='', xlim=c(-1,1), ylim=c(-1,1), axes=F, lwd=3, cex = 1.5)
par(new=T)
plot(douglas$sep_ra/r200, douglas$sep_dec/r200, col='black', main='', 
     pch=2, xlab='', ylab='', xlim=c(-1,1), ylim=c(-1,1), axes=F, lwd=3, cex = 1.5)
legend(x=-1., y=-0.5, legend=c('etg','non-etg','riguccini+15','possible miegs'), 
       pch=c(16,16,0,2), col=c('red','deepskyblue3','green3','black'),bty='n')

for(i in 1:5){
  text(douglas$sep_ra[i]/r200, douglas$sep_dec[i]/r200 +0.09, douglas$names[i], col='black', font=2)
}
text(douglas$sep_ra[6]/r200, douglas$sep_dec[6]/r200 -0.09, douglas$names[6], col='black', font=2)

text(laurie$sep_ra[1]/r200 +0.09, laurie$sep_dec[1]/r200, laurie$name[1], col='green3', font=2)
text(laurie$sep_ra[2]/r200 , laurie$sep_dec[2]/r200 - 0.09, laurie$name[2], col='green3', font=2)
text(laurie$sep_ra[3]/r200 , laurie$sep_dec[3]/r200 + 0.09, laurie$name[3], col='green3', font=2)
text(laurie$sep_ra[4]/r200, laurie$sep_dec[4]/r200 + 0.09, laurie$name[4], col='green3', font=2)
text(laurie$sep_ra[5]/r200 + 0.09, laurie$sep_dec[5]/r200, laurie$name[5], col='green3', font=2)
text(laurie$sep_ra[6]/r200 - 0.09, laurie$sep_dec[6]/r200, laurie$name[6], col='green3', font=2)
text(laurie$sep_ra[7]/r200 - 0.09, laurie$sep_dec[7]/r200, laurie$name[7], col='green3', font=2)
text(laurie$sep_ra[8]/r200 + 0.09, laurie$sep_dec[8]/r200, laurie$name[8], col='green3', font=2)
dev.off()

#delta_ra vs delta_dec for SDSS Coma semple

data = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/Paulo_Coma_Selection/cluster.gals.sel.shiftgap.iter.00001', header=T, sep='')
laurie = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='')
douglas = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep='')

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
postscript('/media/douglas13/ESD-USB/UFRJ/IC/Coma_Analize/Graficos/SDSS-delta_ra-vs-delta_dec.eps')
par(mgp = c(2,1,1))
plot(netg_m$sep_ra, netg_m$sep_dec, col='deepskyblue3', 
     pch=16, xlab=expression(bold(paste(Delta,'ra [degrees]')))), 
     ylab=expression(bold(paste(Delta,'dec [degrees]')))), 
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), cex=0.8, cex.lab = 1.4, font.lab = 2, axes=F)
title(expression(bold(paste(Delta,'ra vs ',Delta,'dec for SDSS Coma Selection')))), line = -0.05,
      font.main = 2, cex.main = 1.2)
axis(side=1, at=seq(from= -2.5, to=2.5, by=1), font = 2, cex.axis = 1.2, pos = -2.5)
axis(side=2, at=seq(from=-2.5, to=2.5, by=1), font = 2, cex.axis = 1.2, pos = -2.5)		
par(new=T)
plot(netg_i$sep_ra, netg_i$sep_dec, col='deepskyblue3', main='', xlab='',ylab='',pch=8,
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), cex=0.8, axes=F)
par(new=T)
plot(etg_m$sep_ra, etg_m$sep_dec, col='red', main='', xlab='',ylab='',pch=16,
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), cex=0.9, axes=F)
par(new=T)
plot(etg_i$sep_ra, etg_i$sep_dec, col='red', main='', xlab='',ylab='',pch=8,
     xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), cex=0.9, axes=F)
par(new=T)
plot(douglas_m$sep_ra, douglas_m$sep_dec, col='black', main='', xlab='',ylab='',
     pch=0,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), cex = 1.2, lwd=2, axes=F)
par(new=T)
plot(douglas_i$sep_ra, douglas_i$sep_dec, col='black', main='', xlab='',ylab='',
     pch=0 ,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), cex=1.2, lwd=2, axes=F)
par(new=T)
plot(laurie$sep_ra, laurie$sep_dec, col='green3', main='', xlab='',ylab='',pch=0,
     lwd=3,xlim=c(-2.5,2.5), ylim=c(-2.5,2.5), cex = 1.2, axes=F)
for(i in 1:6){
	text(douglas$sep_ra[i], douglas$sep_dec[i] +0.16, douglas$names[i], col='black')
}
text(laurie$sep_ra[1] +0.16, laurie$sep_dec[1], laurie$name[1], col='black', font =2 )
text(laurie$sep_ra[2] , laurie$sep_dec[2] - 0.16, laurie$name[2], col='black', font =2)
text(laurie$sep_ra[3] , laurie$sep_dec[3] + 0.16, laurie$name[3], col='black', font =2)
text(laurie$sep_ra[4] , laurie$sep_dec[4] + 0.16, laurie$name[4], col='black', font =2)
text(laurie$sep_ra[5] + 0.16, laurie$sep_dec[5], laurie$name[5], col='black', font =2)
text(laurie$sep_ra[6] - 0.16, laurie$sep_dec[6], laurie$name[6], col='black', font =2)
text(laurie$sep_ra[7] - 0.16, laurie$sep_dec[7], laurie$name[7], col='black', font =2)
text(laurie$sep_ra[8] + 0.16, laurie$sep_dec[8], laurie$name[8], col='black', font =2)
legend(x = -2.5, y = -1.9, legend=c('members','interloopers'),pch=c(16,8),col=c('gray','gray'), bty='n')
legend(x = 1.0, y = -1.5, legend=c('etg','netg','riguccini+15','possbile miegs'), 
       pch=c(1,1,0,0), col=c('red','deepskyblue3','green3','black'), bty='n')
dev.off()

#Normalizado
r200 = 1.34
setEPS()
postscript('/media/douglas13/ESD-USB/UFRJ/IC/Coma_Analize/Graficos/SDSS-delta_ra-vs-delta_dec(normalized).eps')
par(mgp = c(2,1,1))
plot(netg_m$sep_ra/r200, netg_m$sep_dec/r200, col='deepskyblue3', 
     pch=16, xlab=expression(bold(paste(Delta,'ra/',R[200])))), 
     ylab=expression(bold(paste(Delta,'dec [degrees]')))), 
     xlim=c(-2,2), ylim=c(-2,2), cex=0.8, cex.lab = 1.4, font.lab = 2, axes=F)
title(main=expression(bold(paste(Delta,'ra/',R[200], ' vs ',Delta,'dec/',R[200], ' for SDSS Coma Selection')))),
      line = -0.05, font.main = 2, cex.main = 1.2)
axis(side=1, at=seq(from= -2., to=2., by=0.5), font = 2, cex.axis = 1.2, pos = -2.)
axis(side=2, at=seq(from=-2., to=2., by=0.5), font = 2, cex.axis = 1.2, pos = -2.)		
par(new=T)
plot(netg_i$sep_ra/r200, netg_i$sep_dec/r200, col='deepskyblue3', main='', xlab='',ylab='',pch=8, 
     xlim=c(-2,2), ylim=c(-2,2), cex=0.8, axes=F)
par(new=T)
plot(etg_m$sep_ra/r200, etg_m$sep_dec/r200, col='red', main='', xlab='',ylab='',pch=16, 
     xlim=c(-2,2), ylim=c(-2,2), cex=0.9, axes=F)
par(new=T)
plot(etg_i$sep_ra/r200, etg_i$sep_dec/r200, col='red', main='', xlab='',ylab='',pch=8, 
     xlim=c(-2,2), ylim=c(-2,2), cex=0.9, axes=F)
par(new=T)
plot(douglas_m$sep_ra/r200, douglas_m$sep_dec/r200, col='black', main='', xlab='',ylab='',
     pch=0, xlim=c(-2,2), ylim=c(-2,2), cex=1.2, lwd=2, axes=F)
par(new=T)
plot(douglas_i$sep_ra/r200, douglas_i$sep_dec/r200, col='black', main='', xlab='',ylab='',
     pch=0, xlim=c(-2,2), ylim=c(-2,2), cex=1.2, lwd=2, axes=F)
par(new=T)
plot(laurie$sep_ra/r200, laurie$sep_dec/r200, col='green3', main='', xlab='',ylab='',pch=0,
     xlim=c(-2,2), ylim=c(-2,2), cex=1.2, lwd=2, axes=F)
legend(x=.9, y=-1.5, legend=c('members','interloopers'),pch=c(16,0),col=c('gray','gray'), bty='n')
legend(x=-2, y=-1.15, legend=c('etg','netg','riguccini+15','possbile miegs'), pch=c(1,1,0,0), 
       col=c('red','deepskyblue3','green3','black'), bty='n')
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

dev.off()




#Lw4/Lw1 vs Lw1 ETG and N-ETG for SDSS Coma sample

etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/membros.dat', 
                 header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', 
                  header=T, sep='')
laurie = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', 
                    header=T, sep='')
douglas = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', 
                     header=T, sep='')
laurie$Log_Lw_ratio = laurie$Log_Lw4 - laurie$Log_Lw1

setEPS()
postscript('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/Graficos/Lw1_vs_Lwratio.eps')
par(mgp = c(2,1,1))
plot(netg$Log_Lw1, netg$Log_Lw_ratio, pch = 16, col='deepskyblue3',
     xlab=expression(bold(paste('Log(',L[3.4],') [',L[sun],']'))), 
     ylab=expression(bold(paste('Log(',L[22]/L[3.4],') [erg/s',L[sun],']'))),
     xlim = c(7.5,10), ylim = c(31.4,34.4), 
     axes=F, cex.lab = 1.5, font.lab = 1.5)
title(expression(bold(paste('Log(',L[3.4],') vs Log(',L[22]/L[3.4],') for Coma'))), line = -0.1,
      font.main = 2, cex.main = 1.2)
axis(side=1, at=seq(from=7.5, to=10, by=0.5), cex.axis = 1.3, font = 2, pos = 31.4)
axis(side=2, at=seq(from=31.4, to=34.4, by=0.4), cex.axis = 1.3, font = 2, pos = 7.5)
par(new=T)
plot(etg$Log_Lw1, etg$Log_Lw_ratio, pch = 16, col='red', xlab='', ylab='',
     xlim = c(7.5,10), ylim = c(31.4,34.4), axes=F, cex = 1.2)
par(new=T)
plot(laurie$Log_Lw1, laurie$Log_Lw_ratio, pch = 0, col='green', xlab='', ylab='',
     xlim = c(7.5,10), ylim = c(31.4,34.4), axes=F, lwd = 4, cex = 1.4)
par(new=T)
plot(douglas$Log_Lw1, douglas$Log_Lw_ratio, pch = 2, col='black', xlab='', ylab='',
     xlim = c(7.5,10), ylim = c(31.4,34.4), axes=F, lwd = 4, cex = 1.7)
text(7.8,33,'gaussians')

abline(h=32.915, col='black',lty=2,lwd=2)

text(7.8,32.8,'intersection')
for(i in 1:6){
  text(douglas$Log_Lw1[i], douglas$Log_Lw_ratio[i] -0.12, douglas$names[i], col='black', 
       font = 2, cex = 1.1)
}
for(i in 1:8){
  text(laurie$Log_Lw1[i]+0.12, laurie$Log_Lw_ratio[i], laurie$name[i], col='green', font = 2, 
       cex = 1.1)
}
legend(x = 7.51, y = 32.2, legend=c('etg', 'non-etg', 'riguccini+15', 'possible miegs'), 
       pch=c(16,16,0,2), col=c('red','deepskyblue3','green','black'), bty='n')
dev.off()

# W3/W1 vs W1
etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001',
                 header=T, sep="")
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001',
                  header=T, sep="")
laurie = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', 
                    header=T, sep='')
douglas = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', 
                     header=T, sep="")
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ETG_Non-ETG_LW3ratio vs LW1.eps')
plot(netg$Log_Lw1, netg$Log_Lw3 - netg$Log_Lw1, 
     main = 'Lw3/Lw1 vs Lw1 for Coma Cluster data', 
     xlab = 'Log(Lw1)   [Lsun]', 
     ylab = 'Log(Lw3/Lw1)   [erg/sLsun]', col='deepskyblue3', 
     pch=16, xlim = c(7.5,10), ylim=c(-1.5,0.5), axes=F)
axis(side=1, at=seq(from=7.5, to=10.0, by=0.1))
axis(side=2, at=seq(from=-1.5, to=0.5, by=0.1))
par(new=T)
plot(etg$Log_Lw1, etg$Log_Lw3 - etg$Log_Lw1, main = '', xlab = '', ylab = '', 
     col='red', pch=16, xlim = c(7.5,10), ylim=c(-1.5,0.5), axes=F)
par(new=T)
plot(laurie$Log_Lw1, laurie$Log_Lw3 - laurie$Log_Lw1, main = '', xlab = '', 
     ylab = '', col='green', lwd=3, pch=8, xlim = c(7.5,10), ylim=c(-1.5,0.5), axes=F)
par(new=T)
plot(douglas$Log_Lw1, douglas$Log_Lw3 - douglas$Log_Lw1, main = '', xlab = '', 
     ylab = '', col='red', lwd=3, pch=8, xlim = c(7.5,10), ylim=c(-1.5,0.5), axes=F)
for(i in 1:6){
  text(douglas$Log_Lw1[i], (douglas$Log_Lw3[i] - douglas$Log_Lw1[i]) + 0.1, 
       douglas$names[i], col='black')}
for(i in 1:8){
  text(laurie$Log_Lw1[i], (laurie$Log_Lw3[i] - laurie$Log_Lw1[i]) + 0.1, 
       laurie$name[i], col='green3')}
legend('bottomleft', legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), 
       pch=c(16,16,8,8), col=c('red','deepskyblue3','green3','red'), bty='n')
dev.off()

### M vs SFR MPA-JHU data

etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/etg_MPA-JHU.dat', 
                 header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/netg_MPA-JHU.csv', 
                  header=T, sep=',')
possible_miegs = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/possible_miegs-MPA-JHU.csv', 
                  header=T, sep=',')
miegs = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/miegs-MPA-JHU.csv', 
                   header=T, sep=',')
setEPS()
postscript("D:/UFRJ/IC/Coma_Analize/Graficos/MPA-JHU-M_vs_SFR.eps")
par(mgp = c(2,1,1))
plot(netg$alog_mass_tot, netg$alog_sfr_tot, col='deepskyblue3', pch=16, 
     xlab=expression(bold(paste('Log(',M['stellar'],')   ', '[',M[sun],']'))), 
     ylab=expression(bold(paste('Log(SFR)'))), 
     axes=F, xlim=c(8, 12), ylim=c(-3.6,0.8), cex.lab = 1.4, font.lab = 2)
title(expression(bold(paste(M[stelar],' vs SFR: Coma Cluster MPA-JHU Data'))), line = -0.05)
axis(side=1, at=seq(from=8, to=12, by=0.5), 
     label = c(8.0,8.5,9.0,9.5,10.0,10.5,11.0,11.5,12.0),
     font = 2, cex.axis = 1.2, pos = -3.62)
axis(side=2, at=seq(from=-3.6, to=0.8, by=0.4), font = 2, cex.axis = 1.2, pos = 7.88)
par(new=T)
plot(etg$alog_mass_tot, etg$alog_sfr_tot, col='red', pch=16, 
     xlab='', ylab='', main='', axes=F, 
     xlim=c(8, 12), ylim=c(-3.6,0.8))
par(new=T)
plot(miegs$alog_mass_tot, miegs$alog_sfr_tot, col='green3', pch=0, 
     lwd=3, xlab='', ylab='', main='', axes=F, cex = 1.5,
     xlim=c(8, 12), ylim=c(-3.6,0.8))
par(new=T)
plot(possible_miegs$alog_mass_tot, possible_miegs$alog_sfr_tot, col='black', 
     pch=2, lwd=3, xlab='', ylab='', cex = 1.5, 
     main='', axes=F, xlim=c(8, 12), ylim=c(-3.6,0.8))
legend(x = 10.7, y = -2.5, legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), 
       pch=c(16,16,0,2), col=c('red','deepskyblue3', 'green3', 'black'), bty='n')

for(i in 1:6){
	text(possible_miegs$alog_mass_tot[i], possible_miegs$alog_sfr_tot[i] - 0.2, 
       possible_miegs$X_names[i], col='black')
}
for(i in 1:8){
	text(miegs$alog_mass_tot[i], miegs$alog_sfr_tot[i] + 0.2, miegs$X_name[i], col='green3')
}
dev.off()


setEPS()
postscript("/home/walner/Documentos/UFRJ/IC/MIEGS/Coma_Analize/Graficos/MPA-JHU-M_vs_sSFR.eps")
par(mgp = c(2,1,1))
plot(netg$alog_mass_tot, netg$alog_ssfr_tot, col = 'deepskyblue3', 
     xlab=expression(bold(paste('Log (',M['stellar'],')   ', '[',M[sun],']'))),
     ylab=expression(bold(paste('Log (sSFR)   ', "[Gy",r^-1,']'))), cex.lab = 1.4, font.lab = 2,
     xlim = c(7.5, 12.0), ylim = c(-13,-8), pch = 16, axes = F)
title(expression(bold(paste(M[stelar],' vs sSFR: Coma Cluster - SDSS'))), line = -0.04)
axis(side=1, at=seq(from=7.5, to=12, by = 0.5), 
     font = 2, cex.axis = 1.2, pos = -13)
axis(side=2, at=seq(from=-13, to=-8, by=0.5), font = 2, cex.axis = 1.2, 
     pos = 7.5)
par(new=T)
plot(etg$alog_mass_tot, etg$alog_ssfr_tot, col='red', xlab='', ylab='',
     main='', xlim = c(7.5, 12.0), ylim = c(-13,-8), pch = 16, axes = F)
par(new=T)
plot(possible_miegs$alog_mass_tot, possible_miegs$alog_ssfr_tot, col='black', xlab='', ylab='',
     main='', xlim = c(7.5, 12.0), ylim = c(-13,-8), pch = 2, axes = F, cex = 1.5, lwd = 3)
par(new=T)
plot(miegs$alog_mass_tot, miegs$alog_ssfr_tot, col='green3', xlab='', ylab='',
     main='', xlim = c(7.5, 12.0), ylim = c(-13,-8), pch = 0, axes = F, cex = 1.5, lwd = 3)
legend('topright', legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), 
       pch=c(16,16,0,2), col=c('red','deepskyblue3','green3','black'), bty='n')
for(i in 1:6){
  text(possible_miegs$alog_mass_tot[i], possible_miegs$alog_ssfr_tot[i] - 0.2, 
       possible_miegs$X_names[i], col='black', font=2, cex = 1.1)
}
for(i in 2:8){
  text(miegs$alog_mass_tot[i], miegs$alog_ssfr_tot[i] + 0.2, miegs$X_name[i], col='green3', 
       font=2, cex=1.1)
}
text(miegs$alog_mass_tot[1] + 0.2, miegs$alog_ssfr_tot[1], miegs$X_name[1], col='green3', 
     font=2, cex=1.1)
dev.off()

### sSFR(salim) vs sSFR(MPA-JHU)####

etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/etg_salim+mpa.dat', 
                 header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/netg_salim+mpa.dat', 
                  header=T, sep='')
laurie = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/laurie_salim+mpa.dat', 
                    header=T, sep='')
candidates = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/candidates_salim+mpa.dat', 
                        header=T,sep='')

#stellar mass -> col10
#SFR          -> col12

etg_ssfr_salim = etg$col12 - etg$col10
netg_ssfr_salim = netg$col12 - netg$col10
laurie_ssfr_salim = laurie$col12 - laurie$col10
candidates_ssfr_salim = candidates$col12 - candidates$col10

setEPS()
postscript('D:/UFRJ/IC/Coma_Analize/Graficos/sSFR(salim)_vs_sSFR(MPA-JHU).eps')
par(mgp = c(2,1,1))
plot(netg_ssfr_salim, netg$alog_ssfr_tot, col='deepskyblue3', pch=16, 
     xlab = "Log(sSFR) [Salim]", ylab = "Log(sSFR) [MPA-JHU]", 
     xlim = c(-13.5, -8.5), ylim= c(-13.0, -8.5), axes=F, cex.lab = 1.4, font.lab = 2)
title('Log sSFR (Salim) vs Log sSFR (MPA-JHU)', line = -0.2)
axis(side=1, at=seq(from=-13.5, to=-8.5, by=.5), font = 2, cex.axis = 1.2, pos = -13)
axis(side=2, at=seq(from= -13.0, to=-8.5, by=0.5), font = 2, cex.axis = 1.2, pos = -13.5)
par(new=T)
plot(etg_ssfr_salim, etg$alog_ssfr_tot, col='red', pch=16, xlab='', ylab='', main='', 
  xlim = c(-13.5, -8.5), ylim= c(-13.0, -8.5), axes=F)
par(new=T)
plot(laurie_ssfr_salim, laurie$alog_ssfr_tot, col='green', lwd=3, pch=0, cex = 1.2, 
     xlab='', ylab='', main='', xlim = c(-13.5, -8.5), ylim= c(-13.0, -8.5), axes=F)
par(new=T)
plot(candidates_ssfr_salim, candidates$alog_ssfr_tot, col='black', lwd=2, pch=2, cex = 1.2, 
     xlab='', ylab='', main='', xlim = c(-13.5, -8.5), ylim= c(-13.0, -8.5), axes=F)
for(i in 1:6){
  text(candidates_ssfr_salim[i], candidates$alog_ssfr_tot[i] + 0.15, 
  candidates$names[i], col='black', font = 2)}
for(i in 1:7){
  text(laurie_ssfr_salim[i], laurie$alog_ssfr_tot[i] + 0.15, 
  laurie$name[i], col='green', font = 2)}
text(laurie_ssfr_salim[8], laurie$alog_ssfr_tot[8] - 0.15, 
     laurie$name[8], col='green', font = 2)
legend(x=-13.4, y=-8.5, legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), 
       pch=c(16,16,0,2), col=c('red','deepskyblue3','green','black'), bty='n')
dev.off()


#color - mag(dered) plots para MPA-JHU

etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/etg_MPA-JHU.dat', 
                 header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/netg_MPA-JHU.dat', 
                  header=T, sep='')
douglas = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/possible_miegs-MPA-JHU.dat', 
                     header=T, sep='')
laurie = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/miegs-MPA-JHU.dat', 
                    header=T, sep='')

etg_gr = etg$dered_g - etg$dered_r
netg_gr = netg$dered_g - netg$dered_r
douglas_gr = douglas$dered_g - douglas$dered_r
laurie_gr = laurie$dered_g - laurie$dered_r

setEPS()
postscript('D:/UFRJ/IC/Coma_Analize/Graficos/g-r_vs_r-MPA-JHU.eps')
par(mgp = c(2,1,1))
plot(netg$dered_r, netg_gr, col='deepskyblue3', pch=16, xlab = "r", 
     ylab ='g-r', xlim = c(11.3, 18.4), ylim= c(0.09, 1), axes=F, cex.lab = 1.7)
title('Color-mag for MPA-JHU data', line = -.2, font.lab = 2)
axis(side=1, at=seq(from= 11.3, to=18.5, by=1), cex.axis = 1.2, font=2, pos = 0.09)
axis(side=2, at=seq(from= 0.09, to=1, by=0.1), cex.axis = 1.2, font=2, pos = 11.3)
par(new=T)
plot(etg$dered_r, etg_gr, col='red', pch=16, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(0.09, 1), axes=F)
par(new=T)
plot(douglas$dered_r, douglas_gr, col='red', pch=16, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(0.09, 1), axes=F)
par(new=T)
plot(douglas$dered_r, douglas_gr, col='black', pch=2, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(0.09, 1), axes=F, cex=1.5, lwd=3)
par(new=T)
plot(laurie$dered_r, laurie_gr, col='deepskyblue3', pch=16, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(.09, 1), axes=F)
par(new=T)
plot(laurie$dered_r, laurie_gr, col='green', pch=0, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(.09, 1), axes=F, cex=1.5, lwd=3)
for(i in 1:6){
  text(douglas$dered_r[i], douglas_gr[i] + 0.05, 
       douglas$X_names[i], col='black', lwd=2, font = 2, cex=1)}
for(i in 1:8){
  text(laurie$dered_r[i], laurie_gr[i] + 0.05, 
       laurie$X_name[i], col='green', lwd=2, font = 2, cex=1)}

legend(x=11.35, y=0.32, legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), 
       pch=c(16,16,0,2), col=c('red','deepskyblue3','green3','black'), bty='n')
dev.off()



#color - mag(dered) plots para Salim

etg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/etg_dr12+salim.dat', 
                 header=T, sep='')
netg = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/netg_dr12+salim.dat', 
                  header=T, sep='')
douglas = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/dr12+salim:possible_miegs.dat', 
                     header=T, sep='')
laurie = read.table('/home/doug/Documentos/MEGA/Graduação/IC-Paulo/MIEGS/Coma_Analize/dr12+salim:laurie_miegs.dat', 
                    header=T, sep='')
etg_gr = etg$dered_g - etg$dered_r
netg_gr = netg$dered_g - netg$dered_r
douglas_gr = douglas$dered_g - douglas$dered_r
laurie_gr = laurie$dered_g - laurie$dered_r

setEPS()
postscript('D:/UFRJ/IC/Coma_Analize/Graficos/g-r_vs_r-Salim.eps')
par(mgp = c(2,1,1))
plot(netg$dered_r, netg_gr, col='deepskyblue3', pch=16, xlab = "r", 
     ylab ='g-r', xlim = c(11.3, 18.4), ylim= c(0.09, 0.95), axes=F, cex.lab = 1.4, 
     font.lab=2)
title('Color-mag for Salim data', line = -.2)
axis(side=1, at=seq(from= 11.3, to=18.5, by=1), cex.axis = 1.2, font=2, pos = 0.09)
axis(side=2, at=seq(from= 0.10, to=1, by=0.1), cex.axis = 1.2, font=2, pos = 11.3)
par(new=T)
plot(etg$dered_r, etg_gr, col='red', pch=16, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(0.09, 0.95), axes=F)
par(new=T)
plot(douglas$dered_r, douglas_gr, col='red', pch=16, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(.09, 0.95), axes=F)
par(new=T)
plot(douglas$dered_r, douglas_gr, col='black', pch=2, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(.09, 0.95), axes=F, cex=1.5, 
     lwd=2, font=2)
par(new=T)
plot(laurie$dered_r, laurie_gr, col='deepskyblue3', pch=16, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(.09, 0.95), axes=F)
par(new=T)
plot(laurie$dered_r, laurie_gr, col='green', pch=0, xlab = "", 
     ylab ='', main= '', xlim = c(11.3, 18.4), ylim= c(.09, 0.95), 
     axes=F, cex=1.5, lwd=2, cex.lab = 1.5, font=2)
for(i in 1:6){
  text(douglas$dered_r[i], douglas_gr[i] + 0.05, 
       douglas$X_names[i], col='black', lwd=2, font=2)}
for(i in 1:8){
  text(laurie$dered_r[i], laurie_gr[i] + 0.05, 
       laurie$X_name[i], col='green', lwd=2, font=2)}
legend(x=11.35, y=0.32, legend=c('etg', 'netg', 'riguccini+15', 'possible miegs'), 
       pch=c(16,16,0,2), col=c('red','deepskyblue3','green3','black'), bty='n')
dev.off()
