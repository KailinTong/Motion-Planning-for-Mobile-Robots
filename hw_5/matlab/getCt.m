function Ct = getCt(n_seg, n_order)
    %#####################################################
    % STEP 2.1: finish the expression of Ct
    
    d_order = 4;
    
    ct_rows = d_order*2*n_seg;
    ct_cols = d_order*2*n_seg - (n_seg-1)*d_order;
    Ct = zeros(ct_rows, ct_cols);
    d_vector = zeros( n_seg * 2 * d_order, 1) ;
    idx = 1;
    for k = 0:n_seg-1
        for t = 0:1
            for d = 0:d_order-1
                d_vector(idx) = k*100+t*10+d;
                idx = idx + 1;
            end
        end
    end
    
    col = 1; % column of one in Ct

%     // fixed starting point at segment 0 in [ dF, dP ]'
    k = 0;
    t = 0;
    d = 0;
    for d = 0:d_order-1
        val = k * 100 + t * 10 + d;
        [row,~] = find(d_vector == val);
        Ct(row, col) = 1;
        col = col + 1;
    end
     
%     // fixed final point at segment 0, 1, 2, n_seg-2 in [ dF, dP ]'
    t = 1;
    d = 0;
    if  n_seg - 2 >= 0
        for k = 0:n_seg - 2
            val = k * 100 + t * 10 + d;
            [row,~] = find(d_vector == val);
            Ct(row, col) = 1;
            val = (k + 1) * 100 + (t -1) * 10 + d;
            [row,~] = find(d_vector == val);
            Ct(row, col) = 1;

            col = col + 1;
        end
    end
    

%     // fixed final point at segment n_seg-1 in [ dF, dP ]'
    k = n_seg - 1;
    t = 1;
    d = 0;
    for d = 0:d_order-1
        val = k * 100 + t * 10 + d;
        [row,~] = find(d_vector == val);
        Ct(row, col) = 1;
        col = col + 1;
    end

%     // free variables at segment 0, 1, 2, n_seg-1 in [ dF, dP ]'
    k = 0;
    t = 1;
    d = 1;
    if  n_seg - 2 >= 0
        for k = 0:n_seg - 2
            for d = 1:d_order-1
            val = k * 100 + t * 10 + d;
            [row,~] = find(d_vector == val);
            Ct(row, col) = 1;
            val = (k + 1) * 100 + (t - 1) * 10 + d;
            [row,~] = find(d_vector == val);
            Ct(row, col) = 1;

            col = col + 1;
            end
        end
    end
%     
%     
%     Ct = zeros(8*n_seg,4*n_seg+4);
%     Ct(1,1) = 1; % p0
%     Ct(2,2) = 1; % v0
%     Ct(3,3) = 1; % a0
%     Ct(4,4) = 1; % j0
%     for k = 1:n_seg-1 % p1 p2 p3 ... pk-1
%         Ct(8*(k-1)+5,4+k) = 1;
%         Ct(8*(k)+1,4+k) = 1;
%     end
%     Ct(end-3,4+n_seg) = 1; % pk
%     Ct(end-2,4+n_seg+1) = 1; % vk
%     Ct(end-1,4+n_seg+2) = 1; % ak
%     Ct(end,4+n_seg+3) = 1; % jk
%     
%     for k = 1:n_seg-1 % v1 a1 j1 ... vn-1 ak-1 jk-1
%         Ct(8*(k-1)+6,4+n_seg+3+3*(k-1)+1) = 1;% v
%         Ct(8*(k)+2,4+n_seg+3+3*(k-1)+1) = 1;
%         Ct(8*(k-1)+7,4+n_seg+3+3*(k-1)+2) = 1;% a
%         Ct(8*(k)+3,4+n_seg+3+3*(k-1)+2) = 1;
%         Ct(8*(k-1)+8,4+n_seg+3+3*(k-1)+3) = 1;% j
%         Ct(8*(k)+4,4+n_seg+3+3*(k-1)+3) = 1;        
%     end    
%     disp(Ct)
end