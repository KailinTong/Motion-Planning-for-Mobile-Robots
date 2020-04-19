function [Q, M] = getQM(n_seg, n_order, ts)
    Q = [];
    M = [];
    M_k = getM(n_order);
    % d_order = 4;
    for k = 1:n_seg
        %#####################################################
        % STEP 2.1 calculate Q_k of the k-th segment 
        % Q_k = [];
        fac = @(x) x*(x-1)*(x-2)*(x-3);
        Q_k = zeros(n_order+1,n_order+1);

        for i = 0:n_order
            for j = 0:n_order
                if (i < 4) || (j < 4)
                    continue;
                else
                    Q_k(i+1,j+1) = fac(i) * fac(j)/(i + j - 7) * ts(k)^(j+i-7); 
                end
            end
        end
        Q = blkdiag(Q, Q_k);
        M_k = M_k * (eye(n_order+1)) .*ts(k);
        M = blkdiag(M, M_k);
    end
end