function [Int] = Int_Params()
    %% Interface smoothing
    smooth = load("smooth.mat");
    Int.smooth = smooth.Value(1);
    %% trapezium
    trapz           = load('trapz.mat');
    Int.trapz_w_bot = trapz.Value(1);
    Int.trapz_w_top = trapz.Value(2);
    %% supergauss
    supergauss = load('supergauss.mat');
    Int.supergauss_sigma = supergauss.Value(2);
    Int.supergauss_m = supergauss.Value(1);
    %% Triangle
    Triangle = load('triangle.mat');
    Int.triangle_w1 = Triangle.Value(1);
    Int.triangle_w2 = Triangle.Value(2);
    Int.triangle_w3 = Triangle.Value(3);
    %% Rectangle
    Int.Rectangle_width = load('rectangle.mat').Value;
    %% Cylinder
    Cylinder = load('cylinder.mat');
    Int.Cylinder_radius = Cylinder.Value(1);
    Int.Cylinder_Placement_x = Cylinder.Value(2);
    Int.Cylinder_Placement_y = Cylinder.Value(3);
    %% Column on binary gr.
    Column = load('column.mat');
    Int.Column_height = Column.Value(1);
    Int.Column_width  = Column.Value(2);
    %% 2D rectangle
    Int.rec_2D_wx       = 0.2;
    Int.rec_2D_wy       = 0.25;
    Int.rec_rot_angle   = 15;
    %% 2D ellipse
    Int.ax                  = 1;
    Int.ay                  = 0.5;
    Int.ellipse_rot_angle   = 15;
    Int.radius_star_ellipse = 0.45;
end