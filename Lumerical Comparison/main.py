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

#-------------- params that are saved to RCWA --------------------------------
Nx     = int(1028)
Lx     = 0.5
h      = 0.210
x      = np.linspace(-Lx/2, Lx/2, Nx)

#------------ refractive index of a GMR filter -------------------------------
n_rec = 2.02 # SiN2

#---------------------- create a device --------------------------------------
n1 = rec(x/(0.5*Lx))
n1 = 1 - n1
n1 = n1 * (1 - n_rec) + n_rec


################# Construct device layers ####################################
ER      = np.ones((2, Nx))
ER[0,:] = n1**2
ER[1,:] = n_rec**2
sub_L   = [0.120,0.08] # sublayer thicknesses

################ Vizualize relative permittivity #############################
plt.imshow(ER, aspect = 'auto')
plt.colorbar()

#---------------------- Save data into .mat ----------------------------------

data = {    'x': x,
        'sub_L': sub_L,
           'ER': ER,
           'Lx': Lx}

scipy.io.savemat('RCWA_DATA.mat', data)
np.save('RCWA_DATA.py',data)