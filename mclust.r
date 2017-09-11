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


# W3/W1 vs W1
etg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
netg = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_cluster.gals.sel.shifgap.iter.00001', header=T, sep="")
laurie = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/Non-ETG_WISE_Miegs_plopes_coma_shifgap_selection.dat', header=T, sep='')
douglas = read.table('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/WISE_ergs/ETG_and_non-ETG/possible_miegs.dat', header=T, sep="")

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

