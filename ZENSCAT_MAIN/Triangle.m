function z = Triangle(x, grid, interface_stuff)
    h  = grid.h;
    w1 = interface_stuff.triangle_w1 * grid.Lx;
    w2 = interface_stuff.triangle_w2 * grid.Lx;
    w3 = interface_stuff.triangle_w3 * grid.Lx;
    gamma = min(x) + w1; delta = min(x) + w1 + w2; sigma = delta + w3;
    a1 = h/(delta - gamma); b1 = -gamma*a1;
    a2 = h/(sigma - delta); b2 = sigma * a2;
    for i = 1:length(x)
        if min(x) <= x(i) <= min(x) + w1
            y(i) = 0;
        end
        if and(min(x) + w1 <= x(i), x(i) <= min(x) + w1 + w2 ) 
            y(i) = a1 * x(i) + b1; 
        end
        if min(x) + w1 + w2 <= x(i)
           y(i) = -a2 * x(i) + b2;
        end
        if x(i) >= min(x) + w1 + w2 + w3
            y(i) = 0;
        end
    end
    % plot(y)
    z = y;
end

