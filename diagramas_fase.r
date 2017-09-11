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



