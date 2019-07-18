

png('/home/douglas/Imagens/mclust_free.png')
#seleção de dados
data = read.table("/home/douglas/Documentos/MEGA/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001",
                   header=T, sep='')
etg = subset(data, select = c(Log_Lw1, Log_Lw_ratio)) #deixa apenas as colunas a serem usadas
plot(etg$Log_Lw1, etg$Log_Lw_ratio, col='white', xlabel = 'Log (Lw1)', ylabel = 'Log (Lw4/Lw1)') #plotando os eixos

par(new=T)
etg = scale(etg) #deixando os valores em ordem crescente
library(mclust) #chamando o Mclust

fit = Mclust(etg , modelname=bic) #fitando e deixando o algoritmo decidir a quantidade de clusters existentes
par(mgp = c(2,1,1))
plot(fit, what='classification', xlab='', ylab = '', axes=F) #fitando o clusters
dev.off()

#########################################################################################################

#mesmo princípio, agora para mostrar os BICs (Bayesian Information Criterion)

png('/home/douglas/Imagens/mclust_free-bic.png')
data = read.table("/home/douglas/Documentos/MEGA/IC-Paulo/MIEGS/Coma_Analize/WISE_ergs/ETG_and_non-ETG/ETG_WISE_cluster.gals.sel.shifgap.iter.00001",
                  header=T, sep='')
etg = subset(data, select = c(Log_Lw1, Log_Lw_ratio))
etg = scale(etg)
library(mclust, modelname=bic)

fit = Mclust(etg , modelname=bic)
par(mgp = c(2,1,1))
plot(fit, what='BIC')
dev.off()


