### Clustering dos dados usando Mclust ###
	#Mclust é um algoritimo que testa a aglomeração dos dados

#for ETGs
data = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/membros.dat', header=T, sep="")
data = subset(data, select=c(Log_Lw1, Log_Lw_ratio))
library(mclust)

fit =   Mclust(data, modelname=bic)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/ETG_Mclust(best_fit)_plots.pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-ETG_Mclust(best_fit).txt')

fit = 	Mclust(data, G=2)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/ETG_Mclust(2_grups)_plots.pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-ETG_Mclust(2_grups).txt')


#for Non-ETGs
data = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep='')
data = subset(data, select = c(Log_Lw1,Log_Lw_ratio))

fit = Mclust(data, modelname=bic)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/Non-ETG_Mclust(best_fit).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-NETG_Mclust(best_fit).txt')


#for M vs SSF (dr12 + salim)
library(mclust)
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_dr12+salim.dat', header=T, sep='')
etg = subset(etg, etg$col10 > -99, select = c(col10, col12))

fit = Mclust(etg)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/etg-dr12+salim:SSF_Mclust(best_fit).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit1)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-etg-dr12+salim:SSF_Mclust(best_fit).txt')

netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_dr12+salim.dat', header=T, sep='')
netg = subset(netg, netg$col10 > -99, select = c(col10, col12))

fit = Mclust(netg)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/netg-dr12+salim:SSF_Mclust(best_fit).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit2)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-netg-dr12+salim:SSF_Mclust(best_fit).txt')

# M vs sSFR dr12+salim
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_dr12+salim.dat', header=T, sep='')
etg = subset(etg, etg$col10 > -99, select = c(col10, col12))
etg$col11 = etg$col12 - etg$col10
etg$col12 <- NULL

fit = Mclust(etg)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/etg-dr12+salim:sSSF_Mclust(best_fit).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-etg-dr12+salim:sSSF_Mclust(best_fit).txt')

fit = Mclust(etg, G=2)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/etg-dr12+salim:sSSF_Mclust(2_groups).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-etg-dr12+salim:sSSF_Mclust(2_groups).txt')

netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_dr12+salim.dat', header=T, sep='')
netg = subset(netg, netg$col10 > -99, select = c(col10, col12))
netg$col11 = netg$col12 - netg$col10
netg$col12 <- NULL

fit = Mclust(netg)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/netg-dr12+salim:sSSF_Mclust(best_fit).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-netg-dr12+salim:sSSF_Mclust(best_fit).txt')


# W3/W1 vs W1
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='')
douglas = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep="")

data = subset(etg, select=c(Log_Lw3, Log_Lw1))
data$ratio = data$Log_Lw3 - data$Log_Lw1
data$Log_Lw3 <- NULL
fit = Mclust(data)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/etg-Lw3ratio_vs_Lw1(best_fit).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-etg-Lw3ratio_vs_Lw1(best_fit).txt')

#clustering para as ETG em MPA-JHU data
library(mclust)
data = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_MPA-JHU.dat', header=T, sep='')
#stellar mass -> col10
#SFR          -> col12
data = subset(data, select = c(alog_mass_tot, alog_ssfr_tot))
fit = Mclust(data)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/etg_MPA-JHU:sSFR-Mclust(best_fit).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-etg_MPA-JHU:sSFR-Mclust(best_fit).txt')

fit = Mclust(data, G=2)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/etg_MPA-JHU:sSFR-Mclust(2_group).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-etg_MPA-JHU:sSFR-Mclust(2_group).txt')

#clustering para as NETG em MPA-JHU data
library(mclust)
data = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_MPA-JHU.dat', header=T, sep='')
#stellar mass -> col10
#SFR          -> col12
data = subset(data, select = c(alog_mass_tot, alog_ssfr_tot))
fit = Mclust(data)
pdf('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/netg_MPA-JHU:sSFR-Mclust(best_fit).pdf')
par(mfrow = c(2,2))
plot(fit, what = 'BIC')
plot(fit, what = 'classification')
plot(fit, what = 'uncertainty')
plot(fit, what = 'density')
dev.off()
s = summary(fit)
capture.output(s, file='/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Graficos/Mclust/summary-netg_MPA-JHU:sSFR-Mclust(best_fit).txt')


# Checar o overlap entre as etg do Salim e da MPA-JHU
library(mclust)
etg_mpa = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_MPA-JHU.dat', header=T, sep='')
etg_mpa = subset(etg_mpa, select = c(alog_mass_tot, alog_ssfr_tot))
fit = Mclust(etg_mpa, G=2)
candidates_mpa = subset(fit$data, fit$classification == 2)
candidates_mpa = data.frame(candidates_mpa)
#write.table(candidates_mpa, '/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Mclust_candidates-MPA.dat', 
            #row.names=F, col.names=T, sep=' ')

library(mclust)
etg_salim = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_dr12+salim.dat', header=T, sep='')
etg_salim = subset(etg_salim, etg_salim$col10 > -99, select = c(col10, col12))
etg_salim$col11 = etg_salim$col12 - etg_salim$col10
etg_salim$col12 <- NULL
fit = Mclust(etg_salim, G=2)
candidates_salim = subset(fit$data, fit$classification == 1)
candidates_salim = data.frame(candidates_salim)
etg_salim = subset(fit$data, fit$classification == 2)
#write.table(candidates_salim, '/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/Mclust_candidates-Salim.dat', 
#            row.names=F, col.names=T, sep=' ')
