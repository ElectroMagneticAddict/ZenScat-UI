# ZenScat-UI

2D Rigorous Coupled Wave Analaysis (RCWA) and 2D Finite Difference Frequency Domain (FDFD) for Guided Mode Resonance filters and Photonic Crystals.
The _main_ .mat files, functions and User Interface (UI) classes are in "ZenScat.zip" file that belong to the application.

The .py files are in the Data generation.zip file for generating permittivity arrays with their geometrical parameters, and are used for Casual Import application. Such files involve: Magnusson's spatial filter, Guided Mode Resonance filters, Bragg coupler with top grating for enhancing Laser Induced Damage Threshold.

Distributed Feedback (DFB) system permittivity value initialization files are used for optimization, which are also generated from .py main file. Optimization is performed in order to maximize gain/absorption of the materials.

Please check APP_TUTORIAL.pdf for the UI nuances before using the application.

# Getting started

ZenScat is launched _locally_ by running one of the five UI classes - 
1. Opening app class
2. Casual app class (2D RCWA)
3. Casual import app class (2D RCWA)
4. Optimization (Casual + Import) app class (2D RCWA)
5. Field computation application class (2D FDFD)

These classes involve functions.structs used for 2D RCWA:
parameters.m, grid.m, device.m, Launch_RCWA_S (S matrix method), Launch_RCWA_T (T matrix method).

Use PLAY_SCRIPT.m for modifying/testing functions for 2D RCWA, whereas for 2D FDFD, it is adviced to use MAIN_FDFD.m.

If .mex file does not work, it is mainly because it is compiled in the local environment. Then it is adviced to recompile it via PLAY_SCRIPT.m via the use of Matlab Coder. The compilation is performed in C++ language, the project files are dubbed as .prj.

# When modifying the code
Permittivity distribution array code addition is performed with device.m files, or numerating device_2.m files to create interface functions and geometry. The same is done for 2D FDFD.

When modifying merit function for genetic optimization, it is adviced to add additional merit functions, such as Merit_Function2.m for instance, in order to ensure the consistency of the code.

Import application uses generated data from Python, which is inside the .zip files. This involves DFB (Distributed Feedback) systems that are used for optimization, or for Casual Import class whose calculations are visualized in the APP_TUTORIAL.pdf. The data generation is performed by the main.py files inside each folder.




