function M = getM(n_seg, n_order, ts)
    M = [];
    for k = 1:n_seg
        M_k = zeros(8,8); % question M must be a suqre matrix?
        %#####################################################
        % STEP 1.1: calculate M_k of the k-th segment 
        M_k(1,8) = 1;
        M_k(2,7) = 1;
        M_k(3,6) = 2;
        M_k(4,5) = 6;
        % temp to check 
%         t = 1;
        for n = 0:1:3 % here n is the derivative order
            for i = 0:1:(n_order-n)
                   M_k(n+5,i+1) = factorial(n_order-i)/factorial(n_order-i-n)*ts(k)^(n_order-i-n); 
%                   M_k(n+5,i+1) = factorial(n_order-i)/factorial(n_order-i-n)*t^(n_order-i-n); 
            end
        end
        M = blkdiag(M, M_k);
    end
      disp(M)
end