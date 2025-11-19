function trap = trapezium(x, grid, interface_stuff)
%% Parameters
    Lx    = grid.Lx; % period
    h     = grid.h; % modulation depth - 1e6 is conversion from m to um.
    w_top = interface_stuff.trapz_w_top; % trench w_top
    wx1   = (Lx -  w_top)/2;
    w_bot = interface_stuff.trapz_w_bot;
    wx2   = (w_top - w_bot)/2;
%% line params
    alpha = h/ wx2;
    b     = alpha * ( wx1 +  wx2 - Lx/2);
    z     = zeros(1,length(x));
    for i = 1:length(z)
        if  x(i) <= -Lx/2 +  wx1
            z(i) = h;
        elseif x(i) >= -Lx/2 +  wx1
            z(i) = -alpha * x(i) + b;
        end
        if x(i) > -Lx/2 +  wx1 +  wx2
        	z(i) = 1e-6;
        end
        if x(i) > -Lx/2 +  wx1 +  wx2 +  w_bot
            z(i) = alpha * x(i) + b;
        end
        if x(i) > -Lx/2 +  wx1 + 2* wx2 +  w_bot
            z(i) = h;
        end
    end
    trap = z;
end