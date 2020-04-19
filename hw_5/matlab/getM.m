function M = getM(n_seg, n_order, ts)
    coeff = [1,  1,  1,  1,  1,  1,  1,  1,;
             0,  1,  2,  3,  4,  5,  6,  7,;
             0,  0,  2,  6,  12, 20, 30, 42;
             0,  0,  0,  6,  24, 60, 120,210];
    M = [];
    for k = 1:n_seg
        M_k = zeros(8,8); % question M must be a suqre matrix?
        %#####################################################
        % STEP 1.1: calculate M_k of the k-th segment 
        t = ts(k);
        for i = 0:3
            M_k(i+1, i+1) = coeff(i+1, i+1);
        end

        for i = 0:3
            for j = i:n_order
                if (i == j)
                    M_k(i+4+1, j+1) = coeff(i+1, j+1) ;
                else
                    M_k(i+4+1, j+1) = coeff(i+1, j+1) * t^(j - i);
                end
            end
        end
        

        M = blkdiag(M, M_k);
    end
      disp(M)
end