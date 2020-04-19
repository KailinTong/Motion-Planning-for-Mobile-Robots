function Q = getQ(n_seg, n_order, ts)
    Q = [];
    fac = @(x) x*(x-1)*(x-2)*(x-3);
    % Note: p = [p0, p1, p2,...pn-1]'
    
    for k = 1:n_seg
        %#####################################################
        % STEP 1.1: calculate Q_k of the k-th segment 
        Q_k = zeros(n_order+1,n_order+1);

        for i = 0:n_order
            for j = 0:n_order
                if (i < 4) || (j < 4)
                    continue;
                else
                    Q_k(i + 1,j + 1) = fac(i) * fac(j)/(i + j - 7) * ts(k) ^ (i + j -7); 
                end
            end
        end

        Q = blkdiag(Q, Q_k);
    end
end