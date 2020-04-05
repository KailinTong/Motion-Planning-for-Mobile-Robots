function Ct = getCt(n_seg, n_order)
    %#####################################################
    % STEP 2.1: finish the expression of Ct
    Ct = zeros(8*n_seg,4*n_seg+4);
    Ct(1,1) = 1; % p0
    Ct(2,2) = 1; % v0
    Ct(3,3) = 1; % a0
    Ct(4,4) = 1; % j0
    for k = 1:n_seg-1 % p1 p2 p3 ... pk-1
        Ct(8*(k-1)+5,4+k) = 1;
        Ct(8*(k)+1,4+k) = 1;
    end
    Ct(end-3,4+n_seg) = 1; % pk
    Ct(end-2,4+n_seg+1) = 1; % vk
    Ct(end-1,4+n_seg+2) = 1; % ak
    Ct(end,4+n_seg+3) = 1; % jk
    
    for k = 1:n_seg-1 % v1 a1 j1 ... vn-1 ak-1 jk-1
        Ct(8*(k-1)+6,4+n_seg+3+3*(k-1)+1) = 1;% v
        Ct(8*(k)+2,4+n_seg+3+3*(k-1)+1) = 1;
        Ct(8*(k-1)+7,4+n_seg+3+3*(k-1)+2) = 1;% a
        Ct(8*(k)+3,4+n_seg+3+3*(k-1)+2) = 1;
        Ct(8*(k-1)+8,4+n_seg+3+3*(k-1)+3) = 1;% j
        Ct(8*(k)+4,4+n_seg+3+3*(k-1)+3) = 1;        
    end    
    disp(Ct)
end