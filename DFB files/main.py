# -*- coding: utf-8 -*-
"""
Created on Tue Apr 29 09:17:17 2025

@author: toran
"""

import numpy as np
import matplotlib.pyplot as plt
import scipy

#-------------- Params list for DFB ------------------------------------------
def rec(x):
    return abs(x) <= 0.5

#-----------------------------------------------------------------------------

params = [0.53366 , 0.10988 ,  0.10061 ,0.1] # Init params

Lx     = params[0]
sub_L  = params[1:]

#-------------- Params that are saved to RCWA --------------------------------
Nx     = int(1028) 
# Lx     = 0.35
x      = np.linspace(-Lx/2, Lx/2, Nx)

#--------------------- Homogeneous layer count --------------------------------
layer_num = 3

#--------------------- Relative permittivities -------------------------------
er1 = 2.00**2      # grating permitttivity (Si) or Metal
# er1 = 1.5**2
# er2 = (3.4 - 1e-3j)**2  # Si permittivity 
# er2 = (2.04 + 1e-3j)**2 # DFB Perovskite
er2 = -23.062 -0.39381j  # Metal's (Ag) permittivity (Frequency Domain) ϵ1 = -23.062

########################## Construct a device ###############################
ER    = np.ones((layer_num, Nx), dtype = 'complex')

#---------------------- create a device --------------------------------------
er_rec = rec(x/(0.5*Lx))
er_rec = 1 - er_rec
er_rec = er_rec * (1 - er1) + er1

# sub_L = np.zeros(layer_num)

#-------------------------- Arrange layers ----------------------------------
ER[0] = er_rec
ER[1] = er1 * np.ones((Nx))
ER[2] = er2 * np.ones((Nx))

# ################ Vizualize relative permittivity #############################
plt.close()
plt.imshow(np.real(ER), aspect = 'auto')
plt.colorbar()

#---------------------- Save data into .mat ----------------------------------
data = {    'x': x,
        'sub_L': sub_L,
            'ER': ER,
            'Lx': Lx}
 
scipy.io.savemat('RCWA_DATA.mat', data)
np.save('RCWA_DATA.py',data)


# for metal lb 0.1 0.1 0.1 0.0 ub 1 1 1 0.1

# Si params (after optimization) for 700 nm and theta = 0 deg
# params = [0.3432, 0.16066, 0.18586  , 0.28457] # lb 0.1 0.1 0.1 0.1 ub 1 0.3 0.3 0.3
# DFB laser perovskite system (1.5 on top, grating)
# params = [0.40272   ,  0.15782   , 0.017679  ,   0.81176]; # lb 0.1 0.1 0.0 0.0 ub 0.5 1 1 1
# Metal system
# params = [0.53366 , 0.10988 ,  0.10061 ,0.1] # https://refractiveindex.info/?shelf=main&book=Ag&page=Johnson
