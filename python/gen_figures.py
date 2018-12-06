#!/usr/bin/env python

import matplotlib.pyplot as plt 
import pandas as pd 
import numpy as np 
import seaborn as sns
from scipy.stats import norm


# for i in range(0,2**4):
# 	for j in range(0,2**4):
# 		print("%d * %d = %d" % (i,j,i*j))
labels = ['a','b','z','cycles_baseline','cycles_es_naive','cycles_es_imp']
#df = pd.DataFrame(columns=labels)

def main():
	import pandas as pd

	#df = pd.DataFrame(columns=['a','b','z','cycles_baseline','cycles_es_naive','cycles_es_imp'])
	a = pd.Series()
	b = pd.Series()
	z = pd.Series()
	cycles_baseline = pd.Series()
	cycles_es_naive = pd.Series()
	cycles_es_imp   = pd.Series()

	for i in range(0,2**4):
		for j in range(0,2**4):
			#print(i+j)
			#df.at[i+j,'a'] = i
			#df.at[i+j,'b'] = j
			#df.at[i+j,'z'] = i*j
			#df.at[i+j,'cycles_baseline'] = 2**8
			#df.at[i+j,'cycles_es_naive'] = (2**4)*j
			#df.at[i+j,'cycles_es_imp']   = (2**4)*min(i,j)
			#df2 = pd.DataFrame([0,1,2,3,4,5],columns=labels)
			#s = pd.Series([0,1,2,3,4,5])
			#a_temp = pd.Series(i)
			a = np.append(a,i)
			b = np.append(b,j)
			z = np.append(z,i*j)
			cycles_baseline  = np.append(cycles_baseline,2**8)
			cycles_es_naive  = np.append(cycles_es_naive,j*(2**4))
			cycles_es_imp    = np.append(cycles_es_imp,min(i,j)*(2**4))

			#print(new_df.head())
			#df = df.append(new_df)

	#x = np.random.normal(size=100)
	#sns.distplot(df['cycles_es_naive'])
	#plt.show()
	#print(df.head(1000))
	#print(a)
	#print(b)
	#print(cycles_es_naive)
	d = {'a' : a, 'b' : b, "z" : z,'cycles_baseline': cycles_baseline,'cycles_es_naive':cycles_es_naive,'cycles_es_imp':cycles_es_imp}
	df = pd.DataFrame(d)
	#print(df.head(100))
	#sns.distplot(df['cycles_es_naive'],bins=10)
	print(df.cycles_es_naive.unique())


	#this data shows naive way is completely dependant on size of b input
	# for i in df.cycles_es_naive.unique():
	# 	print("Cycle count = %d" % i)
	# 	print(df.loc[df.cycles_es_naive == i])

	for i in df.cycles_es_imp.unique():
		print("Cycle count = %d" % i)
		print(df.loc[df.cycles_es_imp == i])


	df_hm_naive = df.pivot("a","b","cycles_es_naive")
	#print(df_hm_naive.to_string())
	df_hm_imp = df.pivot("a","b","cycles_es_imp")





	plt.figure(1)
	ax1 = sns.distplot(df['cycles_es_naive'],bins=16,norm_hist=False,hist_kws=dict(edgecolor="k", linewidth=1))
	ax1.set(xlabel="cycles",ylabel="density",title="4-bit multiply with early shutoff - naive version")
	#plt.show()
	plt.figure(2)
	ax2 = sns.distplot(df['cycles_es_imp'],bins=16,norm_hist=False,hist_kws=dict(edgecolor="k", linewidth=1))
	ax2.set(xlabel="cycles",ylabel="density",title="4-bit multiply with input-aware early shutoff")
	#plt.xlim(0,250)
	plt.figure(3)
	ax3 = sns.distplot(df['cycles_baseline'],norm_hist=True,hist_kws=dict(edgecolor="k", linewidth=1))
	ax3.set(xlabel="cycles",ylabel="density",title="4-bit multiply without early shutoff")
	#plt.rcParams["patch.force_edgecolor"] = True
	plt.show()

	#print(df.to_string())
	#print(df.loc[])


	plt.figure(4)
	ax4 = sns.heatmap(df_hm_naive)
	ax4.set(title="Heat Map of Cycle Time for Varying Input Combinations - Naive Early Shutoff")
	plt.show()

	plt.figure(5)
	ax5 = sns.heatmap(df_hm_imp)
	ax5.set(title="Heat Map of Cycle Time for Varying Input Combinations - Input-Aware Early Shutoff")

	plt.show()


if __name__ == '__main__':
	main()


