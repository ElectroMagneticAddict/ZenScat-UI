function sub_L = GeometrySub_Lengths(grid, idx)
    %% All layer lengths
    c = grid.Length - grid.h;
    d = c(c>0);
    Size_Idx = size(idx);
    sub_L    = zeros(1, Size_Idx(2));
    sub_L(:) = grid.dz;
    if strcmp(grid.distribution,'two') == 1 && length(c) > 1
        Layer_idx = idx(1,:) + idx(2,:);
    else
        Layer_idx = sum(idx,1);
    end
    [~,col] = find(Layer_idx >= 1);

    if not(isempty(col))
        if length(col) == length(d)
            sub_L(col) = d;
        else
            sub_L(:) = grid.dz;
        end
    else
        sub_L(:) = grid.dz;
        if length(grid.Length) == 1
            sub_L(:) = grid.Length./grid.Nz;
        else
            nz = grid.Nz; 
            dz = grid.Length./grid.Nz;
            for i = 0:length(grid.Length) - 1
                sub_L(i*nz+1:(i+1)*nz) = dz(i+1);
            end
        end
    end
    % fix sub_L for gratings
    if sum(sub_L) == 0
        sub_L(:) = grid.dz;
    end
end



