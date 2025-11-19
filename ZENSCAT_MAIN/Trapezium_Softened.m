function [out] = Trapezium_Softened(x, grid,interface_stuff)
    sigma     = interface_stuff.supergauss_sigma;
    n         = 2*interface_stuff.supergauss_m;
    Amplitude = grid.h;
    out       = Amplitude * exp(-0.5 * ((x./(sigma)).^n)) ;
end