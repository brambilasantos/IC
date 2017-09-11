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

