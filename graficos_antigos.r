### LW1 vs LW4 : Shifgap selection -> ALL GALAXIES###
coma_shifgap = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep="")
miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
members = subset(coma_shifgap, coma_shifgap$iflag == 0)
interlopers = subset(coma_shifgap, coma_shifgap$iflag == 1) 
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/WISE_LW1vsLW4.coma_shifgap_all.eps")
plot(members$Log_Lw1, members$Log_Lw4, col = 'red', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4) [erg/s]', main = "Lw1 vs Lw4 : cluster.gals.sel", cex.lab=1.35, cex.main = 1.35, axes=F)
axis(side=1, at=seq(from=min(members$Log_Lw1), to=max(interlopers$Log_Lw1), by=0.5))
axis(side=2, at=seq(from=41, to=43.5, by=0.5))	

points(x = interlopers$Log_Lw1, y = interlopers$Log_Lw4, pch = 16, col = 'blue')

points(x = miegs$Log_Lw1, y = miegs$Log_Lw4, pch = 8)
dev.off()

### LW1 vs LW4/LW1 : Shifgap selection -> ALL GALAXIES###
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/WISE_LW1vsLW4_LW1.coma_shifgap_all.eps")
y1 = members$Log_Lw4 - members$Log_Lw1 
y2 = interlopers$Log_Lw4 - interlopers$Log_Lw1
y3 = miegs$Log_Lw4 - miegs$Log_Lw1
plot(members$Log_Lw1, y1, col='red', pch=16, xlab='Log(Lw1)[Lsun]', ylab='Log(Lw4/Lw1)[erg/sLsun]', main='Lw1 vs Lw4 : culster.gals.sel', cex.lab=1.35, cex.main = 1.35)
points(x = interlopers$Log_Lw1, y = y2, col='blue', pch=16)
points(x = miegs$Log_Lw1, y = y3, col = 'black', pch=8)

dev.off()


### LW1 vs LW4 : WISE-tab-coma-5hmpc -> ALL GALAXIES ###

coma_5hmpc = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/WISE_tab_coma_5hmpc_dr12_plops.dat', header=T, sep="")

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/WISE_LW1vsLW4.coma_5hmpc_all.eps')
plot(coma_5hmpc$Log_Lw1, coma_5hmpc$Log_Lw4, col ='red', pch=16, xlab='Log(Lw1) [Lsun]', ylab='Log(Lw4/Lw1)[erg/sLsun]', main='Lw1 vs Lw4 : coma_5hmpc_dr12', cex.lab=1.35, cex.main = 1.35)
points(x = LTG$Log_Lw1, y = LTG$Log_Lw4, pch = 16, col='green')
points(x = miegs$Log_Lw1, y = miegs$Log_Lw4, pch = 8)

dev.off()

### LW1 vs LW4/LW1 : Shifgap selection -> ALL GALAXIES ###
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/All_galaxies/WISE_Lw1vsratio.coma_5hmpc_all.eps")
y1 = coma_5hmpc$Log_Lw4 - coma_5hmpc$Log_Lw1 
y3 = miegs$Log_Lw4 - miegs$Log_Lw1
plot(coma_5hmpc$Log_Lw1, y1, col='red', pch=16, xlab='Log(Lw1)[Lsun]', ylab='Log(Lw4/Lw1)[erg/sLsun]', main='Lw1 vs Lw4 : culster.gals.sel', cex.lab=1.35, cex.main = 1.35)
points(x = miegs$Log_Lw1, y = y3, col = 'black', pch=8)

dev.off()


### LW1 vs LW4 and LW4/LW1 vs LW1 : Shifgap selection -> ETG, LTG ###
ETG_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
LTG_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
ETG_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
LTG_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")

ETG_members = subset(ETG_shifgap, ETG_shifgap$iflag == 0)       #pontos fechados vermelhos (pch=16)
ETG_interlopers = subset(ETG_shifgap, ETG_shifgap$iflag == 1)	#pontos abertos vermelhos (pch=1)
LTG_members = subset(LTG_shifgap, LTG_shifgap$iflag == 0)	#pontos fechados azuis (pch=16)
LTG_interlopers = subset(LTG_shifgap, LTG_shifgap$iflag == 1)	#pontos abertos azuis (pch=1)
#Todas as miegs de riguccini+15 são membros

setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ETG_LTG-galaxies/ETG_Non-ETG_WISE_LW1vsLW4.coma_shifgap.eps", onefile=F, horizontal=F)
plot(ETG_members$Log_Lw1, ETG_members$Log_Lw4, col = 'red', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4) [erg/s]', main = "Lw1 vs Lw4 : Coma Cluster", cex.lab=1.35, cex.main = 1.35,axes=F, ylim=(c(41.3, 43.3)), xlim=(c(7.6,10)))
axis(side=1, at=seq(from= 7.6, to=10, by=0.2))
axis(side=2, at=seq(from=41.3, to=44, by=0.2))	
par(new=T)
plot(ETG_interlopers$Log_Lw1, ETG_interlopers$Log_Lw4, pch = 2, col = 'red', xlab = "", ylab = '', main ="", axes=F, ylim=(c(41.3, 43.3)), xlim=(c(7.6,10)))
par(new=T)
plot(LTG_members$Log_Lw1, LTG_members$Log_Lw4, pch = 16, col = 'blue', xlab = "", ylab = '', main = "", axes=F, ylim=(c(41.3, 43.3)), xlim=(c(7.6,10)))
par(new=T)
plot(LTG_interlopers$Log_Lw1, LTG_interlopers$Log_Lw4, pch = 2, col = 'blue', xlab = "", ylab = '', main = "", axes=F, ylim=(c(41.3, 43.3)), xlim=(c(7.6,10)))
par(new=T)
plot(ETG_miegs$Log_Lw1, ETG_miegs$Log_Lw4, col='red', pch=8, xlab='', ylab='', main='', cex=2, lwd=2,axes=F, ylim=(c(41.3, 43.3)), xlim=(c(7.6,10)))
par(new=T)
plot(LTG_miegs$Log_Lw1, LTG_miegs$Log_Lw4, col='green', pch=8, xlab='', ylab='', main='', cex=2, lwd=2, axes=F, ylim=(c(41.3, 43.3)), xlim=(c(7.6,10)))

legend('topleft', legend=c('ETG','Non-ETG','riguccini+15', 'Interloopers', 'Members'), col=c('red','blue','green','gray','gray'), pch=c(15,15,15,2,16), bty='n') 
dev.off()


setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ETG_LTG-galaxies/ETG_Non-ETG_WISE_LW1vsLwratio.coma_shifgap.eps')
plot(ETG_members$Log_Lw1, ETG_members$Log_Lw_ratio, col = 'red', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4/Lw1) [erg/sLsun]', main = "Lw1 vs Lw4/Lw1 : Coma Cluster", cex.lab=1.35, cex.main = 1.35,axes=F, ylim=(c(31.8, 34.2)), xlim=(c(7.6,10)))
axis(side=1, at=seq(from= 7.6, to=10, by=0.2))
axis(side=2, at=seq(from=31.8, to=34.2, by=0.2))	
par(new=T)
plot(ETG_interlopers$Log_Lw1, ETG_interlopers$Log_Lw_ratio, pch = 2, col = 'red', xlab = "", ylab = '', main ="", axes=F, ylim=(c(31.8, 34.2)), xlim=(c(7.6,10)))
par(new=T)
plot(LTG_members$Log_Lw1, LTG_members$Log_Lw_ratio, pch = 16, col = 'blue', xlab = "", ylab = '', main = "", axes=F, ylim=(c(31.8, 34.2)), xlim=(c(7.6,10)))
par(new=T)
plot(LTG_interlopers$Log_Lw1, LTG_interlopers$Log_Lw_ratio, pch = 2, col = 'blue', xlab = "", ylab = '', axes=F, main = "", ylim=(c(31.8, 34.2)), xlim=(c(7.6,10)))
par(new=T)
y1=ETG_miegs$Log_Lw4 - ETG_miegs$Log_Lw1
y2=LTG_miegs$Log_Lw4 - LTG_miegs$Log_Lw1
plot(ETG_miegs$Log_Lw1, y1, col='red', pch=8, xlab='', ylab='', main='', axes=F, cex=2, lwd=2, ylim=(c(31.8, 34.2)), xlim=(c(7.6,10)))
par(new=T)
plot(LTG_miegs$Log_Lw1, y2, col='green', pch=8, xlab='', ylab='', main='', axes=F, cex=2, lwd=2, ylim=(c(31.8, 34.2)), xlim=(c(7.6,10)))
par(new=T)
plot(Lost_miegs$Log_Lw1, y3, col='green', pch=8, xlab='', ylab='', main='', axes=F, cex=2, lwd=2, ylim=(c(31.8, 34.2)), xlim=(c(7.6,10)))

legend('bottomleft', legend=c('ETG','Non-ETG','riguccini+15', 'Interloopers', 'Members'), col=c('red','blue','green','gray','gray'), pch=c(15,15,15,2,16), bty='n') 
text(8.21,33.61, '1')
text(8.11,33.86, '2')
text(8.94,33.62, '3')
text(9.62,33.0, '4')
text(8.62,33.80, '5')
text(9.23,33.62, '6')
dev.off()


### LW1 vs LW4 : coma_5hmpc selection -> ETG, LTG ###
ETG_coma = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_tab_coma_5hmpc_dr12_plopes.dat', header=T, sep="")
LTG_coma = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_tab_coma_5hmpc_dr12_plopes.dat', header=T, sep="")
ETG_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
LTG_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
Lost_gals = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Lost_gals/Lost_gal_WISE_tab_coma_5hmpc_dr12_plops.dat', header=T, sep='')
Lost_gals2 = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Lost_gals/Lost_gal2_WISE_tab_coma_5hmpc_dr12_plops.dat', header=T, sep='')
Lost_miegs =  read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Lost_gals/Lost_miegs_WISE_tab_coma_5hmpc_dr12_plops.dat', header=T, sep="")

setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ETG_LTG-galaxies/ETG-LTG_WISE_LW1vsLW4.coma_5hmpc.eps")
plot(ETG_coma$Log_Lw1, ETG_coma$Log_Lw4, col = 'red', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4) [erg/s]', main = "Lw1 vs Lw4 : tab_coma_5hmpc_dr12_plopes", cex.lab=1.35, cex.main = 1.35, axes=F, ylim=(c(41.1, 44.5)), xlim=(c(7.4,10.8)))
axis(side=1, at=seq(from= 7.4, to=10.8, by=0.2))
axis(side=2, at=seq(from=41.1, to=44.5, by=0.2))	
par(new=T)
plot(LTG_coma$Log_Lw1, LTG_coma$Log_Lw4, col='blue', pch=16, xlab='', ylab='', main='', axes=F, ylim=(c(41.1, 44.5)), xlim=(c(7.4,10.8)))
par(new=T)
plot(ETG_miegs$Log_Lw1, ETG_miegs$Log_Lw4, col='red', pch=8, xlab='', ylab='', main='', cex=2.5, lwd=4, axes=F, ylim=(c(41.1, 44.5)), xlim=(c(7.4,10.8)))
par(new=T)
plot(LTG_miegs$Log_Lw1, LTG_miegs$Log_Lw4, col='black', pch=8, xlab='', ylab='', main='', cex=2.5, lwd=4, axes=F, ylim=(c(41.1, 44.5)), xlim=(c(7.4,10.8)))
par(new=T)
plot(Lost_gals$Log_Lw1, Lost_gals$Log_Lw4, col='green', pch=16, xlab='', ylab='', main='', axes=F, ylim=(c(41.1, 44.5)), xlim=(c(7.4,10.8)))
par(new=T)
plot(Lost_gals2$Log_Lw1, Lost_gals2$Log_Lw4, col='green', pch=16, xlab='', ylab='', main='', axes=F, ylim=(c(41.1, 44.5)), xlim=(c(7.4,10.8)))
par(new=T)
plot(Lost_miegs$Log_Lw1, Lost_miegs$Log_Lw4, col='yellow', pch=8, xlab='', ylab='', main='', cex=2.5, lwd=4, axes=F, ylim=(c(41.1, 44.5)), xlim=(c(7.4,10.8)))
legend('topleft', legend=c('ETG','Non-ETG','Non-ETG: Miegs','Others','Others: Miegs'), col=c('red','blue','black','green','yellow'), pch=c(16,16,8,16,8)) 

dev.off()


setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ETG_LTG-galaxies/ETG-LTG_WISE_LW1vsLWratio.coma_5hmpc.eps"')
plot(ETG_coma$Log_Lw1, ETG_coma$Log_Lw_ratio, col = 'red', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4/Lw1) [erg/sLsun]', main = "Lw1 vs Lw4/Lw1 : tab_coma_5hmpc_dr12_plopes", cex.lab=1.35, cex.main = 1.35, axes=F, ylim=(c(31.9, 34.9)), xlim=(c(7.4,10.8)))
axis(side=1, at=seq(from= 7.4, to=10.8, by=0.2))
axis(side=2, at=seq(from=31.9, to=34.9, by=0.2))	
par(new=T)
plot(LTG_coma$Log_Lw1, LTG_coma$Log_Lw_ratio, col='blue', pch=16, xlab='', ylab='', main='', axes=F, ylim=(c(31.9, 34.6)), xlim=(c(7.4,10.8)))
y1=ETG_miegs$Log_Lw4 - ETG_miegs$Log_Lw1
y2=LTG_miegs$Log_Lw4 - LTG_miegs$Log_Lw1
y3=Lost_miegs$Log_Lw4 - Lost_miegs$Log_Lw1
par(new=T)
plot(ETG_miegs$Log_Lw1, y1, col='red', pch=8, xlab='', ylab='', main='', cex=2.5, lwd=4, axes=F, ylim=(c(31.9, 34.6)), xlim=(c(7.4,10.8)))
par(new=T)
plot(LTG_miegs$Log_Lw1, y2, col='black', pch=8, xlab='', ylab='', main='', cex=2.5, lwd=4, axes=F, ylim=(c(31.9, 34.6)), xlim=(c(7.4,10.8)))
par(new=T)
plot(Lost_gals$Log_Lw1, Lost_gals$Log_Lw_ratio, col='green', pch=16, xlab='', ylab='', main='', axes=F, ylim=(c(31.9, 34.6)), xlim=(c(7.4,10.8)))
par(new=T)
plot(Lost_gals2$Log_Lw1, Lost_gals2$Log_Lw_ratio, col='green', pch=16, xlab='', ylab='', main='', axes=F, ylim=(c(31.9, 34.6)), xlim=(c(7.4,10.8)))
par(new=T)
plot(Lost_miegs$Log_Lw1, y3, col='yellow', pch=8, xlab='', ylab='', main='', cex=2.5, lwd=4, axes=F, ylim=(c(31.9, 34.6)), xlim=(c(7.4,10.8)))
legend('bottomleft', legend=c('ETG','Non-ETG','Non-ETG: Miegs','Others','Others: Miegs'), col=c('red','blue','black','green','yellow'), pch=c(16,16,8,16,8)) 

dev.off()

### LW1 vs LW4 and LW4/LW1 vs LW1 : Shifgap selection -> Trans, Poten ###
miegs_tran_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Tran_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
miegs_tran_coma = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Tran_WISE_MIEGS_tab_coma_5hmpc_dr12_plops.dat', herader=T, sep="")
miegs_pot_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Pot_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
miegs_pot_coma = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Pot_WISE_MIEGS_tab_coma_5hmpc_dr12_plops.dat', header=T, sep="")
tran_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Tran_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
pot_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Pot_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
miegs_pot_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Pot_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
miegs_tran_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Tran_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")

tran_members = subset(tran_shifgap, tran_shifgap$iflag == 0)       	#circulos fechados vermelhos
tran_interlopers = subset(tran_shifgap, tran_shifgap$iflag == 1)	#circulos abertos vermelhos (pch=1)
pot_members = subset(pot_shifgap, pot_shifgap$iflag == 0)		#circulos fechados azuis
pot_interlopers = subset(pot_shifgap, pot_shifgap$iflag == 1)		#circulos abertos azuis (pch=1)

setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Transition-galaxies/Tran-Pot_WISE_LW1vsLW4.coma_shifgap.eps")
plot(tran_members$Log_Lw1, tran_members$Log_Lw4, col = 'red', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4) [erg/s]', main = "Lw1 vs Lw4 : cluster.gals.sel - TRANSITION Galaxies", cex.lab=1.35, cex.main = 1.35,axes=F, ylim=(c(41.4, 43.2)), xlim=(c(8.0,10)))
axis(side=1, at=seq(from= 8.0, to=10, by=0.2))
axis(side=2, at=seq(from=41.4, to=43.2, by=0.2))	
par(new=T)
plot(tran_interlopers$Log_Lw1, tran_interlopers$Log_Lw4, pch = 1, col = 'red', xlab = "", ylab = '', main ="", axes=F, ylim=(c(41.4, 43.2)), xlim=(c(8.0,10)))
par(new=T)
plot(pot_members$Log_Lw1, pot_members$Log_Lw4, pch = 16, col = 'blue', xlab = "", ylab = '', main = "", axes=F, ylim=(c(41.4, 43.2)), xlim=(c(8.0,10)))
par(new=T)
plot(pot_interlopers$Log_Lw1, pot_interlopers$Log_Lw4, pch = 1, col = 'blue', xlab = "", ylab = '', main = "", axes=F, ylim=(c(41.4, 43.2)), xlim=(c(8.0,10)))
par(new=T)
plot(miegs_tran_shifgap$Log_Lw1, miegs_tran_shifgap$Log_Lw4, col='red', pch=8, xlab='', ylab='', main='', axes=F, ylim=(c(41.4, 43.2)), xlim=(c(8.0,10)))
par(new=T)
plot(miegs_pot_shifgap$Log_Lw1, miegs_pot_shifgap$Log_Lw4, col='blue', pch=8, xlab='', ylab='', main='', axes=F, ylim=(c(41.4, 43.2)), xlim=(c(8.0,10)))

legend('topleft', legend=c('Transtion-Members','Transition-Interlopers','Potential-Members','Potential-Interlopers','Miegs_Potential-Members'), col=c('red','red','blue','blue','blue'), pch=c(16,1,16,1,8)) 

dev.off()


setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Transition-galaxies/Tran-Pot_WISE_LW1vsLwratio.cima_shifgap.eps')
plot(tran_members$Log_Lw1, tran_members$Log_Lw_ratio, col = 'red', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4/Lw1) [erg/sLsun]', main = "Lw1 vs Lw4/LW1 : cluster.gals.sel - TRANSITION Galaxies", cex.lab=1.35, cex.main = 1.35,axes=F, ylim=(c(32.2, 34.4)), xlim=(c(8.0,10)))
axis(side=1, at=seq(from= 8.0, to=10, by=0.2))
axis(side=2, at=seq(from=32.2, to=34.4, by=0.2))	
par(new=T)
plot(tran_interlopers$Log_Lw1, tran_interlopers$Log_Lw_ratio, pch = 1, col = 'red', xlab = "", ylab = '', main ="", axes=F, ylim=(c(32.2, 34.4)), xlim=(c(8.0,10)))
par(new=T)
plot(pot_members$Log_Lw1, pot_members$Log_Lw_ratio, pch = 16, col = 'blue', xlab = "", ylab = '', main = "", axes=F, ylim=(c(32.2, 34.4)), xlim=(c(8.0,10)))
par(new=T)
plot(pot_interlopers$Log_Lw1, pot_interlopers$Log_Lw_ratio, pch = 1, col = 'blue', xlab = "", ylab = '', main = "", axes=F, ylim=(c(32.2, 34.4)), xlim=(c(8.0,10)))
par(new=T)
y1=miegs_tran_shifgap$Log_Lw4 - miegs_tran_shifgap$Log_Lw1
y2=miegs_pot_shifgap$Log_Lw4 - miegs_pot_shifgap$Log_Lw1
plot(tran_miegs$Log_Lw1, y1, col='red', pch=8, xlab='', ylab='', main='', axes=F, ylim=(c(32.2, 34.4)), xlim=(c(8.0,10)))
par(new=T)
plot(miegs_pot_shifgap$Log_Lw1, y2, col='blue', pch=8, xlab='', ylab='', main='', axes=F, ylim=(c(32.2, 34.4)), xlim=(c(8.0,10)))
legend('topright', legend=c('Transtion-Members','Transition-Interlopers','Potential-Members','Potential-Interlopers','Miegs_Potential-Members'), col=c('red','red','blue','blue','blue'), pch=c(16,1,16,1,8)) 
dev.off()

### LW1 vs LW4 : coma_5hmpc selection -> Trans, Poten ###

tran_coma = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Tran_WISE_tab_coma_5hmpc_dr12_plopes.dat', header=T, sep="")
pot_coma = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Pot_WISE_tab_coma_5hmpc_dr12_plopes.dat', header=T, sep="")
tran_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Tran_WISE_MIEGS_tab_coma_5hmpc_dr12_plops.dat', header=T, sep="")
pot_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Pot_WISE_MIEGS_tab_coma_5hmpc_dr12_plops.dat', header=T, sep="")

setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Transition-galaxies/Tran-Pot_WISE_LW1vsLW4.coma_5hmpc.eps")
plot(pot_coma$Log_Lw1, pot_coma$Log_Lw4, col = 'blue', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4) [erg/s]', main = "Lw1 vs Lw4 : tab_coma_5hmpc_dr12_plopes - TRANSITION", cex.lab=1.35, cex.main = 1.35, axes=F, ylim=(c(41.4, 44.8)), xlim=(c(7.6,10.6)))

axis(side=1, at=seq(from= 7.6, to=10.6, by=0.2))
axis(side=2, at=seq(from=41.4, to=44.8, by=0.2))	
par(new=T)
plot(tran_coma$Log_Lw1, tran_coma$Log_Lw4, col='red', pch=16, xlab='', ylab='', main='', axes=F, ylim=(c(41.4, 44.8)), xlim=(c(7.6,10.6)))
par(new=T)
plot(tran_miegs$Log_Lw1, tran_miegs$Log_Lw4, col='red', pch=8, xlab='', ylab='', main='', axes=F, ylim=(c(41.4, 44.8)), xlim=(c(7.6,10.6)))
par(new=T)
plot(pot_miegs$Log_Lw1, pot_miegs$Log_Lw4, col='blue', pch=8, xlab='', ylab='', main='', axes=F, ylim=(c(41.4, 44.8)), xlim=(c(7.6,10.6)))
legend('topleft', legend=c('Potential','Transition','Trans-Miegs','Pot-Miegs'), col=c('blue','red','red','blue'), pch=c(16,16,8,8)) 

dev.off()


setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Transition-galaxies/Tran-Pot_WISE_LW1vsLWratio.coma_5hmpc.eps"')
plot(pot_coma$Log_Lw1, pot_coma$Log_Lw_ratio, col = 'blue', pch = 16, xlab = "Log(Lw1) [Lsun]", ylab = 'Log(Lw4/Lw1) [erg/sLsun]', main = "Lw1 vs Lw4/Lw1 : tab_coma_5hmpc_dr12_plopes - TRANSITION", cex.lab=1.35, cex.main = 1.35, axes=F, ylim=(c(32.1, 34.6)), xlim=(c(7.4,10.8)))
axis(side=1, at=seq(from= 7.4, to=10.8, by=0.2))
axis(side=2, at=seq(from=32.1, to=34.6, by=0.2))	
par(new=T)
plot(tran_coma$Log_Lw1, tran_coma$Log_Lw_ratio, col='red', pch=16, xlab='', ylab='', main='', axes=F, ylim=(c(32.1, 34.6)), xlim=(c(7.4,10.8)))
y1=tran_miegs$Log_Lw4 - tran_miegs$Log_Lw1
y2=pot_miegs$Log_Lw4 - pot_miegs$Log_Lw1
par(new=T)
plot(tran_miegs$Log_Lw1, y1, col='red', pch=8, xlab='', ylab='', main='', axes=F, ylim=(c(32.1, 34.6)), xlim=(c(7.4,10.8)))
par(new=T)
plot(pot_miegs$Log_Lw1, y2, col='blue', pch=8, xlab='', ylab='', main='', axes=F, ylim=(c(32.1, 34.6)), xlim=(c(7.4,10.8)))
legend('topleft', legend=c('Potential','Transition','Trans-Miegs','Pot-Miegs'), col=c('blue','red','red','blue'), pch=c(16,16,8,8)) 

dev.off()


#Histograma Log(Lw4/Lw1) ETG and N-ETG for Coma Region
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_tab_coma_5hmpc_dr12_plopes.dat', header=T, sep='')
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_tab_coma_5hmpc_dr12_plopes.dat', header=T, sep='')
ratio_etg = etg$Log_Lw4 - etg$Log_Lw1
ratio_netg = netg$Log_Lw4 - netg$Log_Lw1
mean_etg = mean(ratio_etg)
mean_netg = mean(ratio_netg)
std_etg = sqrt(var(ratio_etg))
std_netg = sqrt(var(ratio_netg))
seq1 = seq(from=31.9, to=35, by=0.25)
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Antigos/Histo_coma_selection_5hmpc.eps")
hist(ratio_netg, main="Hist LW4/LW1 Coma Region", xlab='Log(LW4/LW1)[erg/sLsun]', prob=T, border='blue', breaks=seq1, axes=F)
hist(ratio_etg, main="", xlab='', prob=T, border='red', axes=F, add=T, breaks=seq1)
axis(side=1, at=seq(from= 31.5, to=35, by=0.5))
axis(side=2, at=seq(from=0, to=1.2, by=0.2))	
curve(dnorm(x, mean = mean_etg, sd=std_etg), add=T, col='red')
curve(dnorm(x, mean = mean_netg, sd=std_netg), add=T, col='blue')
legend("topleft", legend=c("ETG", "N-ETG"), col=c("red", "blue"), pch=c(16, 16))
dev.off()


#Histograma Log(Lw4/Lw1) ETG's Members and Members+N_Members
etg_c = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='') 
etg_c = subset(etg_c, etg_c$iflag == 0)
etg_r = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_tab_coma_5hmpc_dr12_plopes.dat', header=T, sep='')
ratio_etg_c = etg_c$Log_Lw4 - etg_c$Log_Lw1
ratio_etg_r = etg_r$Log_Lw4 - etg_r$Log_Lw1
mean_etg_c = mean(ratio_etg_c)
mean_etg_r = mean(ratio_etg_r)
std_etg_c = sqrt(var(ratio_etg_c))
std_etg_r = sqrt(var(ratio_etg_r))
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Antigo/Hist_ETG_menber&not+members.eps")
hist(ratio_etg_c, main="Hist LW4/LW1 Members and members+N-Members", xlab='Log(LW4/LW1)[erg/sLsun]', prob=T, border='red', axes=F, xlim=c(31, 35), ylim=c(0,1.2))
hist(ratio_etg_r, main="", xlab='', prob=T, border='blue', axes=F, add=T, xlim=c(31, 35), ylim=c(0,1.2))
axis(side=1, at=seq(from= 31, to=35, by=0.5))
axis(side=2, at=seq(from=0, to=1.2, by=0.2))	
curve(dnorm(x, mean = mean_etg_c, sd=std_etg_c), add=T, col='red')
curve(dnorm(x, mean = mean_etg_r, sd=std_etg_r), add=T, col='blue')
legend("topleft", legend=c("coma", "region"), col=c("red", "blue"), pch=c(16, 16), bty='n')
dev.off()

#Histograma Log(Lw4/Lw1) ETG's Members and N-Members usando apenas fontes do aglomerado e fontes da região (excluindo aquelas no aglomerado)
etg_c = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/membros.dat', header=T, sep='') 
etg_c = subset(etg_c, etg_c$iflag == 0)
etg_r = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/nao_membros.dat', header=T, sep='')
ratio_etg_c = etg_c$Log_Lw4 - etg_c$Log_Lw1
ratio_etg_r = etg_r$Log_Lw4 - etg_r$Log_Lw1
mean_etg_c = mean(ratio_etg_c)
mean_etg_r = mean(ratio_etg_r)
std_etg_c = sqrt(var(ratio_etg_c))
std_etg_r = sqrt(var(ratio_etg_r))
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Hist_ETG_member&not.eps")
hist(ratio_etg_c, main="Hist LW4/LW1 Members and N-Members", xlab='Log(LW4/LW1)[erg/sLsun]', prob=T, border='red', axes=F, xlim=c(31, 35), ylim=c(0,1.2))
hist(ratio_etg_r, main="", xlab='', prob=T, border='blue', axes=F, add=T, xlim=c(31, 35), ylim=c(0,1.2))
axis(side=1, at=seq(from= 31, to=35, by=0.5))
axis(side=2, at=seq(from=0, to=1.2, by=0.2))	
curve(dnorm(x, mean = mean_etg_c, sd=std_etg_c), add=T, col='red')
curve(dnorm(x, mean = mean_etg_r, sd=std_etg_r), add=T, col='blue')
lines(c(mean_etg_c + std_etg_c,mean_etg_c - std_etg_c), c(0.875, 0.875))
lines(c(mean_etg_r + std_etg_r,mean_etg_r - std_etg_r), c(0.841, 0.841))
legend("topleft", legend=c("coma", "region"), col=c("red", "blue"), pch=c(16, 16))
legend('topright', legend= 'error bars', lty=1)
dev.off()

