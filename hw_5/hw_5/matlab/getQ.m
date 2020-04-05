function Q = getQ(n_seg, n_order, ts)
    Q = [];
    fac = @(x) x*(x-1)*(x-2)*(x-3);

    
    for k = 1:n_seg
        %#####################################################
        % STEP 1.1: calculate Q_k of the k-th segment 
        Q_k = zeros(n_order+1,n_order+1);

        for row = 1:n_order
            for col = 1:n_order
                if (row < 4) || (col < 4)
                    continue;
                else
                    Q_k(row,col) = fac(row) * fac(col)/(row + col - 7) * ts(k)^(row + col - 1); 
                end
            end
        end

        Q = blkdiag(Q, Q_k);
    end
end