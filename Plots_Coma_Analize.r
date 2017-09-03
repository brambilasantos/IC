### Coma SDSS-WISE Selection. Analazing with out galaxie morphology separation ####

#===========================================================================================================================================#
#===========================================================================================================================================#
#===========================================================================================================================================#

coma_shifgap = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep="")

miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")

members = subset(coma_shifgap, coma_shifgap$iflag == 0)
interlopers = subset(coma_shifgap, coma_shifgap$iflag == 1)
 
### LW1 vs LW4 : Shifgap selection -> ALL GALAXIES###
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


#===========================================================================================================================================#
#===========================================================================================================================================#
#===========================================================================================================================================#


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



#===========================================================================================================================================#
#===========================================================================================================================================#
#===========================================================================================================================================#


miegs_tran_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Tran_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
miegs_tran_coma = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Tran_WISE_MIEGS_tab_coma_5hmpc_dr12_plops.dat', herader=T, sep="")
miegs_pot_shifgap = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Pot_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep="")
miegs_pot_coma = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/Transition-Gal/Pot_WISE_MIEGS_tab_coma_5hmpc_dr12_plops.dat', header=T, sep="")


### LW1 vs LW4 and LW4/LW1 vs LW1 : Shifgap selection -> Trans, Poten ###
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

###===============================================================#======================================================================###
x###===============================================================#======================================================================###
###===============================================================#======================================================================###

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
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Histo_coma_selection_5hmpc.eps")
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
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Hist_ETG_menber&not+members.eps")
hist(ratio_etg_c, main="Hist LW4/LW1 Members and members+N-Members", xlab='Log(LW4/LW1)[erg/sLsun]', prob=T, border='red', axes=F, xlim=c(31, 35), ylim=c(0,1.2))
hist(ratio_etg_r, main="", xlab='', prob=T, border='blue', axes=F, add=T, xlim=c(31, 35), ylim=c(0,1.2))
axis(side=1, at=seq(from= 31, to=35, by=0.5))
axis(side=2, at=seq(from=0, to=1.2, by=0.2))	
curve(dnorm(x, mean = mean_etg_c, sd=std_etg_c), add=T, col='red')
curve(dnorm(x, mean = mean_etg_r, sd=std_etg_r), add=T, col='blue')
legend("topleft", legend=c("coma", "region"), col=c("red", "blue"), pch=c(16, 16))
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



#Diagrama de fase velocity vs radius
netg_c = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='') 
etg_c = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='') 
miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='') 
possible_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep="")
etg_c = subset(etg_c, etg_c$iflag == 0)
netg_c = subset(netg_c, etg_c$iflag == 0)
etg_c2 = subset(etg_c, etg_c$iflag == 1)
netg_c2 = subset(netg_c, etg_c$iflag == 1)


setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Phase_Diagram.eps")
plot(etg_c$radius_Mpc, (etg_c$velocity_offset/1000), col='red', pch=16, xlab='Radius [Mpc]', ylab='Relative Velocity [10³ Km/s]', main='Phase-Space Diagram', ylim=c(-4, 4), xlim=c(0, 4), axes=F)
axis(side=1, at=seq(from= 0, to=4, by=0.5))
axis(side=2, at=seq(from=-4, to=4, by=0.5))	
par(new=T)
plot(netg_c$radius_Mpc, (netg_c$velocity_offset/1000), col='deepskyblue3', pch=16, main='', xlab='', ylab='', axes=F,ylim=c(-4, 4), xlim=c(0.0, 4))
par(new=T)
plot(miegs$radius_Mpc, (miegs$velocity_offset/1000), col='green', pch=8, lwd=3, axes=F, xlab='', ylab='',ylim=c(-4, 4), xlim=c(0.0, 4))
par(new=T)
plot(possible_miegs$radius_Mpc, (possible_miegs$velocity_offset/1000), col='black', lwd=3, pch=8, axes=F, xlab='', ylab='', ylim=c(-4, 4), xlim=c(0.0, 4))
par(new=T)
plot(netg_c2$radius_Mpc, (netg_c2$velocity_offset/1000), col='deepskyblue3',pch=1, main='', xlab='', ylab='', axes=F,ylim=c(-4, 4), xlim=c(0.0, 4))
par(new=T)
plot(etg_c2$radius_Mpc, (etg_c2$velocity_offset/1000), col='red',pch=1, main='', xlab='', ylab='', axes=F,ylim=c(-4, 4), xlim=c(0.0, 4))
legend("bottomright", legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), col=c("red", "deepskyblue3", 'green', 'black'), pch=c(16, 16, 8,8), bty='n')
text(possible_miegs$radius_Mpc[1],(possible_miegs$velocity_offset[1]/1000)-0.3, possible_miegs$names[1])
text(possible_miegs$radius_Mpc[2],(possible_miegs$velocity_offset[2]/1000)+0.3, possible_miegs$names[2])
text(possible_miegs$radius_Mpc[3],(possible_miegs$velocity_offset[3]/1000)+0.3, possible_miegs$names[3])
text(possible_miegs$radius_Mpc[4],(possible_miegs$velocity_offset[4]/1000)+0.3, possible_miegs$names[4])
text(possible_miegs$radius_Mpc[5],(possible_miegs$velocity_offset[5]/1000)+0.3, possible_miegs$names[5])
text(possible_miegs$radius_Mpc[6],(possible_miegs$velocity_offset[6]/1000)+0.3, possible_miegs$names[6])

text(miegs$radius_Mpc[1], (miegs$velocity_offset[1]/1000)+0.3, miegs$name[1])
text(miegs$radius_Mpc[2], (miegs$velocity_offset[2]/1000)+0.3, miegs$name[2])
text(miegs$radius_Mpc[3], (miegs$velocity_offset[3]/1000)-0.3, miegs$name[3])
text(miegs$radius_Mpc[4]-0.15,(miegs$velocity_offset[4]/1000), miegs$name[4])
text(miegs$radius_Mpc[5], (miegs$velocity_offset[5]/1000)+0.3, miegs$name[5])
text(miegs$radius_Mpc[6], (miegs$velocity_offset[6]/1000)-0.3, miegs$name[6])
text((miegs$radius_Mpc[7])-0.1, (miegs$velocity_offset[7]/1000), miegs$name[7])
text(miegs$radius_Mpc[8], (miegs$velocity_offset[8]/1000)+0.3, miegs$name[8])

dev.off()


#Diagrama de fase velocity vs radius Normalizado
netg_c = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='') 
etg_c = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='') 
miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='') 
possible_miegs = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep="")
etg_c = subset(etg_c, etg_c$iflag == 0)
netg_c = subset(netg_c, etg_c$iflag == 0)
etg_c2 = subset(etg_c, etg_c$iflag == 1)
netg_c2 = subset(netg_c, etg_c$iflag == 1)
r200 = 2.34 # r200 do aglomerado de Coma
sigma = 904.15 # velocidade de disperção do aglomerado de Coma

v_r200 = 2.34 #raio do Vírial
v_sigma = 1.5*sigma # as velocidades virializadas seram aquelas < que v_sigma

setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/phase_diagram_normalizad.eps")
plot(etg_c$radius_Mpc/r200, abs(etg_c$velocity_offset/sigma), col='red', pch=16, xlab=expression(paste('r'/R[200])), ylab=expression(paste(Delta,"v"/sigma)), main='Phase-Space Diagram', ylim=c(0, 5), xlim=c(0.0, 2), axes=F)
axis(side=1, at=seq(from= 0.0, to=2, by=0.2))
axis(side=2, at=seq(from=-0.0, to=5, by=0.5))	
par(new=T)
plot(netg_c$radius_Mpc/r200, abs(netg_c$velocity_offset/sigma), col='deepskyblue3', pch=16, main='', xlab='', ylab='', axes=F,ylim=c(0, 5), xlim=c(0.0, 2))
par(new=T)
plot(miegs$radius_Mpc/r200, abs(miegs$velocity_offset/sigma), col='green', lwd=3, pch=8, axes=F, xlab='', ylab='',ylim=c(0, 5), xlim=c(0.0, 2))
par(new=T)
plot(possible_miegs$radius_Mpc/r200, abs(possible_miegs$velocity_offset/sigma), col='black', lwd=3, pch=8, axes=F, xlab='', ylab='',ylim=c(0, 5), xlim=c(0.0, 2))
par(new=T)
plot(netg_c2$radius_Mpc/r200, abs(netg_c2$velocity_offset/sigma), col='blue',pch=1, main='', xlab='', ylab='', axes=F,ylim=c(0, 5), xlim=c(0.0, 2))
par(new=T)
plot(etg_c2$radius_Mpc/r200, abs(etg_c2$velocity_offset/sigma), col='red',pch=1, main='', xlab='', ylab='', axes=F,ylim=c(0, 5), xlim=c(0.0, 2))
legend("topleft", legend=c("etg", 'n-etg','miegs from Riguccini+15', 'possible miegs'), col=c("red", "deepskyblue3", 'green', 'black'), pch=c(16, 16, 8,8), bty='n')
segments(0,1.5,1.0,0)
for(i in 1:6){
  text(possible_miegs$radius_Mpc[i]/r200,abs(possible_miegs$velocity_offset[i]/sigma)+0.2, 
       possible_miegs$names[i])
}
for(i in 1:8){
  text(miegs$radius_Mpc[i]/r200,abs(miegs$velocity_offset[i]/sigma)+0.2, miegs$name[i])
}
dev.off()

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
#Histograma Log(sSFR) dr12+salim data
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_dr12+salim.dat', header=T, sep=" ")
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_dr12+salim.dat', header=T, sep=" ")
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/dr12+salim:hist_sSFR.eps')
seq = seq(from=-14.0, to=0, by=0.5)
hist(netg$col12 - netg$col10, main="Hist Log(sSFR) for Coma dr12+salim data", xlab='Log(sSFR)', ylab='', 
     prob=F, border='blue', breaks=seq, axes=F, density=20, col='blue')
hist(etg$col12 - etg$col10, main='', xlab='', ylab='', prob=F, border='red', breaks=seq, axes=F, 
     density=40, col='red', add=T)
axis(side=1, at=seq(from= -14.0, to=0, by=0.5))
axis(side=2, at=seq(from=0, to=200, by=10))	
legend('topright', legend=c('etg', 'netg'), col=c('red','blue'),pch=c(15,15), bty='n')
dev.off()



### Histograma Log(Lw4/Lw1) p/ Coma

etg = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep='') 
netg = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep='') 
miegs = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat", header=T, sep='')
seq = seq(from=31.9, to=33.9, by=0.1)

horiz.hist <- function(x) {
   a <- hist(x, plot=FALSE, breaks=seq)
   barplot(a$density, space=0, horiz=TRUE, col='red')
   width <- a$breaks[2] - a$breaks[1]
   axis(2, at=(pretty(a$breaks) - a$breaks[1])/width,
        labels=pretty(a$breaks))
 }
setEPS()
postscript("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ratio_hist.eps")
layout(matrix(c(1,1,2,1,1,2), nrow = 2, ncol = 3, byrow = T))
plot(etg$Log_Lw1, etg$Log_Lw_ratio, ylim=c(31.9,33.9), col='red', pch=16, lwd=4)
points(x = miegs$Log_Lw1, y=miegs$Log_Lw_ratio, ylim=c(31.9,33.9), col='black', pch=8, lwd=5)
for(i in 1:6){
  text(miegs$Log_Lw1[i], miegs$Log_Lw_ratio[i]+0.1, miegs$names[i])
}
horiz.hist(etg$Log_Lw_ratio)
dev.off()



#Histograma Log(Lw4/Lw1) para ETG e N-ETG no Aglomerado de Coma.
etg = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep='') 
netg = read.table("/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001", header=T, sep='') 

mean_e = mean(etg$Log_Lw_ratio)
std_e = sqrt(var(etg$Log_Lw_ratio)) 
mean_n = mean(netg$Log_Lw_ratio)
std_n = sqrt(var(netg$Log_Lw_ratio)) 
seq_e = seq(from=31.5 , to=34.5, by=0.1)
seq_n = seq(from=31.5 , to=34.5, by=0.1)
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/teste.eps')
hist(netg$Log_Lw_ratio, main='', xlab='', ylab='', prob=T, border='blue', breaks=seq_n, axes=F, density=20, col='blue')
hist(etg$Log_Lw_ratio, main="Hist LW4/LW1 for Coma", xlab='Log(LW4/LW1)[erg/sLsun]', ylab='', prob=T, border='red', breaks=seq_e, axes=F, add=T, density=40, col='red')
axis(side=1, at=seq(from= 31.5, to=34.5, by=0.1), labels=F)
axis(side=4, at=seq(from=0, to=2, by=0.1))	
curve(dnorm(x, mean = mean(etg$Log_Lw_ratio), sd=sqrt(var(etg$Log_Lw_ratio))), add=T, col='red', lwd=2)
curve(dnorm(x, mean = mean(netg$Log_Lw_ratio), sd=sqrt(var(netg$Log_Lw_ratio))), add=T, col='blue', lwd=2)
abline(v=32.911, col='black',lty=2,lwd=2)
legend("right", legend=c("etg",'32 sources', 'n-etg','102 sources'), col=c("red",'red', "blue", 'blue'), pch=c(15,15, 15,15), bty='n')

dev.off()

#Diagrama de fases para amostra de Coma do Paulo

data = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Paulo_Coma_Selection/cluster.gals.sel.shiftgap.iter.00001', header=T, sep='')
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='')
douglas = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep='')
for(i in 1:918){
 if(data$fracDeV_r[i] >= 0.8 && data$conc[i] >= 2.6){
   data$type[i] = 1} 
 else data$type[i] = 0
}
etg = subset(data, data$type == 1)
netg= subset(data, data$type == 0)
etg_m = subset(etg, etg$iflag == 0)
etg_i = subset(etg, etg$iflag == 1)
netg_m = subset(netg, netg$iflag == 0)
netg_i = subset(netg, netg$iflag == 1)
douglas_m = subset(douglas, douglas$iflag == 0)
douglas_i = subset(douglas, douglas$iflag == 1)
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/phase-space-coma_paulo_selection.eps')
plot(netg_m$radius_Mpc, (netg_m$velocity_offset/1000), col='deepskyblue3', pch=16, xlab='Radius [Mpc]', ylab='Relative Velocity [10³ Km/s]', main='Phase-Space Diagram SDSS selection', ylim=c(-4, 4), xlim=c(0, 4), axes=F)
axis(side=1, at=seq(from= 0.0, to=4.5, by=0.5))
axis(side=2, at=seq(from=-5, to=5.0, by=0.5))	
par(new=T)
plot(netg_i$radius_Mpc, (netg_i$velocity_offset/1000), col='deepskyblue3', pch=17, xlab='', ylab='', lwd=3, main='', ylim=c(-4, 4), xlim=c(0, 4), axes=F)
par(new=T)
plot(etg_m$radius_Mpc, (etg_m$velocity_offset/1000), col='red', pch=16, xlab='', ylab='', lwd=3, main='', ylim=c(-4, 4), xlim=c(0, 4), axes=F)
par(new=T)
plot(etg_i$radius_Mpc, (etg_i$velocity_offset/1000), col='red', pch=17, xlab='', ylab='', lwd=3, main='', ylim=c(-4, 4), xlim=c(0, 4), axes=F)
par(new=T)
plot(laurie$radius_Mpc, (laurie$velocity_offset/1000), col='green', pch=16, xlab='', ylab='', lwd=3, main='', ylim=c(-4, 4), xlim=c(0, 4), axes=F)
par(new=T)
plot(douglas_m$radius_Mpc, (douglas_m$velocity_offset/1000), col='black', pch=16, xlab='', ylab='', lwd=3, main='', ylim=c(-4, 4), xlim=c(0, 4), axes=F)
par(new=T)
plot(douglas_i$radius_Mpc, (douglas_i$velocity_offset/1000), col='black', pch=17, xlab='', ylab='', lwd=3, main='', ylim=c(-4, 4), xlim=c(0, 4), axes=F)
for(i in 1:6){
	text(douglas$radius_Mpc[i]+0.05,(douglas$velocity_offset[i]/1000), douglas$names[i], col='black')}
for(i in 1:7){
	text(laurie$radius_Mpc[i], (laurie$velocity_offset[i]/1000 + 0.2), laurie$name[i], col='darkgreen')}
text(laurie$radius_Mpc[8]-0.1, (laurie$velocity_offset[8]/1000), laurie$name[8], col='darkgreen')
legend("bottomleft", legend=c('members','interloopers'), col=c("gray",'gray'), pch=c(16,17), bty='n')
legend("bottomright", legend=c('etg','netg','riguccini+15','possible miegs'), col=c('red','deepskyblue3',"darkgreen",'black'), pch=c(1,1,1,1), bty='n')
dev.off()
#Normalizado
r200 = 2.34
sigma = 904.15
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/phase-space(normalized)-coma_paulo_selection.eps')
plot(netg_m$radius_Mpc/r200, abs(netg_m$velocity_offset/sigma), col='deepskyblue3', pch=16, xlab=expression(paste('r/',R[200])), ylab=expression(paste('|',Delta,'v|/',sigma)), main='Phase-Space Diagram SDSS selection', ylim=c(0, 4.5), xlim=c(0, 1.6), axes=F)
axis(side=1, at=seq(from= 0.0, to=1.6, by=0.2))
axis(side=2, at=seq(from=0, to=4.5, by=0.5))	
par(new=T)
plot(netg_i$radius_Mpc/r200, abs(netg_i$velocity_offset/sigma), col='deepskyblue3', pch=17, xlab='', ylab='', lwd=3, main='', ylim=c(0, 4.5), xlim=c(0, 1.6), axes=F)
par(new=T)
plot(etg_m$radius_Mpc/r200, abs(etg_m$velocity_offset/sigma), col='red', pch=16, xlab='', ylab='', lwd=3, main='', ylim=c(0, 4.5), xlim=c(0, 1.6), axes=F)
par(new=T)
plot(etg_i$radius_Mpc/r200, abs(etg_i$velocity_offset/sigma), col='red', pch=17, xlab='', ylab='', lwd=3, main='', ylim=c(0, 4.5), xlim=c(0, 1.6), axes=F)
par(new=T)
plot(laurie$radius_Mpc/r200, abs(laurie$velocity_offset/sigma), col='green', pch=16, xlab='', ylab='', lwd=3, main='', ylim=c(0, 4.5), xlim=c(0, 1.6), axes=F)
par(new=T)
plot(douglas_m$radius_Mpc/r200, abs(douglas_m$velocity_offset/sigma), col='black', pch=16, xlab='', ylab='', lwd=3, main='', ylim=c(0, 4.5), xlim=c(0, 1.6), axes=F)
par(new=T)
plot(douglas_i$radius_Mpc/r200, abs(douglas_i$velocity_offset/sigma), col='black', pch=17, xlab='', ylab='', lwd=3, main='', ylim=c(0, 4.5), xlim=c(0, 1.6), axes=F)
for(i in 1:6){
	text(douglas$radius_Mpc[i]/r200,abs(douglas$velocity_offset[i]/sigma)+0.15, douglas$names[i], col='black')}
for(i in 1:7){
	text(laurie$radius_Mpc[i]/r200, abs(laurie$velocity_offset[i]/sigma)+0.15, laurie$name[i], col='darkgreen')}
text(laurie$radius_Mpc[8]/r200, abs(laurie$velocity_offset[8]/sigma)-0.15, laurie$name[8], col='darkgreen')
legend("topright", legend=c('members','interloopers'), col=c("gray",'gray'), pch=c(16,17), bty='n')
legend("topleft", legend=c('etg','netg','riguccini+15','possible miegs'), col=c('red','deepskyblue3',"darkgreen",'black'), pch=c(1,1,1,1), bty='n')
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


### Clustering dos dados usando Mclust ###
	#Mclust é um algoritimo que testa a aglomeração dos dados

#for ETGs
data = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/membros.dat', header=T, sep="")
data = subset(data, select=c(Log_Lw1, Log_Lw_ratio))
data = scale(data)
library(mclust)

fit = 	Mclust(data, G=2)

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ETG_Mclust(2_grups)_plots.eps')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/summary-ETG_Mclust(2_grups).txt')

fit = 	Mclust(data, modelname=bic)

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/ETG_Mclust(best_fit)_plots.eps')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/summary-ETG_Mclust(best_fit).txt')

#for Non-ETGs
data = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='')
data = subset(data, select = c(Log_Lw1,Log_Lw_ratio))

fit = Mclust(data)

setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Non-ETG_Mclust(best_fit).eps')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/summary-NETG_Mclust(best_fit).txt')


#for M vs SSF (dr12 + salim)
library(mclust)
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_dr12+salim.dat', header=T, sep='')
etg = subset(etg, etg$col10 > -99)
etg$ra <- NULL;etg$dec <- NULL;etg$zspec <- NULL;etg$zspec.err <- NULL;etg$velocity <- NULL;etg$velocity.err <- NULL;etg$radius_degrees <- NULL;etg$radius_Mpc <- NULL;etg$velocity_of <- NULL;etg$iflag <- NULL;etg$fracDeV_r <- NULL;etg$petroR90_r <- NULL;etg$petroR50_r <- NULL;etg$conc <- NULL;etg$type <- NULL;etg$col1 <- NULL;etg$col2 <- NULL;etg$col3 <- NULL;etg$col4 <- NULL;etg$col5 <- NULL;etg$col6 <- NULL;etg$col7 <- NULL;etg$col8 <- NULL;etg$col9 <- NULL;etg$col11 <- NULL;etg$col13 <- NULL;etg$col14 <- NULL;etg$col15 <- NULL;etg$col16 <- NULL;etg$col17 <- NULL;etg$col18 <- NULL;etg$col19 <- NULL;etg$col20 <- NULL;etg$col21 <- NULL;etg$col22 <- NULL;etg$col23 <- NULL;etg$col24 <- NULL;etg$col25 <- NULL;etg$col26 <- NULL;etg$Separation <- NULL; etg$velocity_offset <- NULL
fit1 = Mclust(etg)
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/etg-dr12+salim:SSF_Mclust(best_fit).eps')
par(mfrow = c(2,2))
plot(fit1, what = 'BIC')
plot(fit1, what = 'classification')
plot(fit1, what = 'uncertainty')
plot(fit1, what = 'density')
dev.off()
s = summary(fit1)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/summary-etg-dr12+salim:SSF_Mclust(best_fit).txt')

netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_dr12+salim.dat', header=T, sep='')
netg = subset(netg, netg$col10 > -99)
netg$ra <- NULL;netg$dec <- NULL;netg$zspec <- NULL;netg$zspec.err <- NULL;netg$velocity <- NULL;netg$velocity.err <- NULL;netg$radius_degrees <- NULL;netg$radius_Mpc <- NULL;netg$velocity_of <- NULL;netg$iflag <- NULL;netg$fracDeV_r <- NULL;netg$petroR90_r <- NULL;netg$petroR50_r <- NULL;netg$conc <- NULL;netg$type <- NULL;netg$col1 <- NULL;netg$col2 <- NULL;netg$col3 <- NULL;netg$col4 <- NULL;netg$col5 <- NULL;netg$col6 <- NULL;netg$col7 <- NULL;netg$col8 <- NULL;netg$col9 <- NULL;netg$col11 <- NULL;netg$col13 <- NULL;netg$col14 <- NULL;netg$col15 <- NULL;netg$col16 <- NULL;netg$col17 <- NULL;netg$col18 <- NULL;netg$col19 <- NULL;netg$col20 <- NULL;netg$col21 <- NULL;netg$col22 <- NULL;netg$col23 <- NULL;netg$col24 <- NULL;netg$col25 <- NULL;netg$col26 <- NULL;netg$Separation <- NULL; netg$velocity_offset <- NULL
fit2 = Mclust(netg)
setEPS()
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/netg-dr12+salim:SSF_Mclust(best_fit).eps')
par(mfrow = c(2,2))
plot(fit2, what = 'BIC')
plot(fit2, what = 'classification')
plot(fit2, what = 'uncertainty')
plot(fit2, what = 'density')
dev.off()
s = summary(fit2)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/summary-netg-dr12+salim:SSF_Mclust(best_fit).txt')

# M vs sSFR dr12+salim
etg$col11 = etg$col12 - etg$col10
etg$col12 <- NULL
fit = Mclust(etg)
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/etg-dr12+salim:sSSF_Mclust(best_fit).eps')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/summary-etg-dr12+salim:sSSF_Mclust(best_fit).txt')

netg$col11 = netg$col12 - netg$col10
netg$col12 <- NULL
fit = Mclust(netg)
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/netg-dr12+salim:sSSF_Mclust(best_fit).eps')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/summary-netg-dr12+salim:sSSF_Mclust(best_fit).txt')


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


data = subset(etg, select=c(Log_Lw3, Log_Lw1))
data$ratio = data$Log_Lw3 - data$Log_Lw1
data$Log_Lw3 <- NULL
fit = Mclust(data)
postscript('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/etg-Lw3ratio_vs_Lw1(best_fit).eps')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/summary-etg-Lw3ratio_vs_Lw1(best_fit).txt')





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


