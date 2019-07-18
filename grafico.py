import matplotlib.pyplot as plt
#pacote para trabalhar com matrizes
import numpy as np
#pacote para importar e exportar dados e trabalhar comd dataframes
import pandas as pd
import seaborn as sns
from astropy.io import ascii 
def init_plotting(x=9,y=7):
    plt.rcParams['figure.figsize'] = (x,y)
    plt.rcParams['font.size'] = 20
    #plt.rcParams['font.family'] = 'Times New Roman'
    plt.rcParams['axes.labelsize'] = plt.rcParams['font.size']
    plt.rcParams['axes.titlesize'] = 0.75*plt.rcParams['font.size']
    plt.rcParams['legend.fontsize'] = 0.65*plt.rcParams['font.size']
    plt.rcParams['xtick.labelsize'] = plt.rcParams['font.size']
    plt.rcParams['ytick.labelsize'] = plt.rcParams['font.size']
    plt.rcParams['xtick.major.size'] = 3
    plt.rcParams['xtick.minor.size'] = 3
    plt.rcParams['xtick.major.width'] = 1
    plt.rcParams['xtick.minor.width'] = 1
    plt.rcParams['ytick.major.size'] = 3
    plt.rcParams['ytick.minor.size'] = 3
    plt.rcParams['ytick.major.width'] = 1
    plt.rcParams['ytick.minor.width'] = 1
    plt.rcParams['legend.frameon'] = True
    plt.rcParams['legend.loc'] = 'best'
    plt.rcParams['axes.linewidth'] = 1
init_plotting()
etg = ascii.read('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/etg_MPA-JHU.dat')
netg = ascii.read('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/netg_MPA-JHU.dat')
douglas = ascii.read('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/possible_miegs-MPA-JHU.dat')
laurie = ascii.read('/home/brambila/IC/IC-Paulo/PROJECT/Coma_Analize/miegs-MPA-JHU.dat')

etg = etg.to_pandas()
netg = netg.to_pandas()
douglas = laurie.to_pandas()
laurie = laurie.to_pandas()

etg_gr = etg.dered_g - etg.dered_r
netg_gr = netg.dered_g - netg.dered_r
douglas_gr = douglas.dered_g - douglas.dered_r
laurie_gr = laurie.dered_g - laurie.dered_r



plt.figure()
sns.set(color_codes=True)
p = sns.JointGrid(x = etg.dered_r, y = etg_gr)
p = p.plot_joint(plt.scatter, color='r')

p.x = netg.dered_r ;p.y = netg_gr
p = p.plot_joint(plt.scatter, color='b')

p.ax_marg_x.hist(etg.dered_r, alpha = 0.1,  color='r')
p.ax_marg_y.hist(etg_gr, orientation = 'horizontal', alpha = 0.1,  color='r')
p.ax_marg_x.hist(netg.dered_r, alpha = 0.1, range = (np.min(etg.dered_r), np.max(etg.dered_r)), color='b')
p.ax_marg_y.hist(netg_gr, orientation = 'horizontal', alpha = 0.1, range = (np.min(netg_gr), np.max(netg_gr)), color='b')

plt.savefig('teste.eps')