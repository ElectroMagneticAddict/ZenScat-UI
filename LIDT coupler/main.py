# -*- coding: utf-8 -*-
"""
Created on Tue May 14 15:27:07 2024

@author: JC_DENTON
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy

#------------------- rectangle function --------------------------------------
def rec(x):
    return abs(x) <= 0.5

#-------------- params list from paper ---------------------------------------
Params = [2.01,15,0.092,0.136,0.105]

#-------------- params that are saved to RCWA --------------------------------
Nx     = int(1028)
Lx     = 0.502
h      = 0.185
x      = np.linspace(-Lx/2, Lx/2, Nx)

#--------------------- params list extraction --------------------------------
n_rec     = Params[0] #HfO2
layer_num = int(Params[1])
L_n2      = Params[2]
L_n3      = Params[3]
w_rec     = Params[4]

#--------------------- relative permittivities -------------------------------
er1 = 2.17**2
er2 = 1.47**2

n1 = rec(x/w_rec)
n1 = 1 - n1
n1 = n1 * (1 - n_rec) + n_rec
n2 = er1 * np.ones(Nx)
n3 = er2 * np.ones(Nx)

########################## Construct a device ###############################
ER      = np.ones((layer_num + 1, Nx))
ER[0,:] = n1**2

sub_L = np.zeros(layer_num + 1)

#-------------------------- arrange layers ----------------------------------
for i in range(1,layer_num + 1):
    if i%2 == 0:
        sub_L[i] = L_n3
        ER[i,:]  = er1
    else:
        sub_L[i] = L_n2
        ER[i,:]  = er2

sub_L[0] = h
sub_L[1] = 0.04

################ Vizualize relative permittivity #############################
plt.imshow(ER, aspect = 'auto')

#---------------------- Save data into .mat ----------------------------------
data = {    'x': x,
        'sub_L': sub_L,
           'ER': ER,
           'Lx': Lx}
 
scipy.io.savemat('RCWA_DATA.mat', data)
np.save('RCWA_DATA.py',data)