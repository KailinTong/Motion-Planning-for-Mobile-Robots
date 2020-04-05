function [Aeq, beq]= getAbeq(n_seg, n_order, waypoints, ts, start_cond, end_cond)
    n_all_poly = n_seg*(n_order+1);
    %#####################################################
    % p,v,a,j constraint in start, 
    Aeq_start = zeros(4, n_all_poly);
%     beq_start = zeros(4, 1);
    % STEP 2.1: write expression of Aeq_start and beq_start
    beq_start =  start_cond';
    Aeq_start(1,8) = 1; 
    Aeq_start(2,7) = 1; 
    Aeq_start(3,6) = 2; 
    Aeq_start(4,5) = 6; 

    
    %#####################################################
    % p,v,a constraint in end
    Aeq_end = zeros(4, n_all_poly);
%     beq_end = zeros(4, 1);
    % STEP 2.2: write expression of Aeq_end and beq_end
    beq_end =  end_cond';
    t = ts(end);

    for k = 0:1:3  % here k is the order of derivative      
        for i = k:1:n_order
            Aeq_end(k+1,end-i) = factorial(i)/factorial(i-k)*t^(i-k);
        end
    end    
    %#####################################################
    % position constrain in all middle waypoints
    Aeq_wp = zeros(n_seg-1, n_all_poly);
    beq_wp = zeros(n_seg-1, 1);
    % STEP 2.3: write expression of Aeq_wp and beq_wp
  
    for k = 1:1:n_seg-1 % here k is the index of segments
        beq_wp(k,1) = waypoints(k+1);
                for i = 0:1:n_order % from p(n) p(n-1) to p(0)
                    Aeq_wp(k,(n_order+1)*(k-1)+i+1) = ts(k)^(n_order-i);
                end        
    end
    
    
    %#####################################################
    % position continuity constrain between each 2 segments
    Aeq_con_p = zeros(n_seg-1, n_all_poly);
    beq_con_p = zeros(n_seg-1, 1);
    % STEP 2.4: write expression of Aeq_con_p and beq_con_p
    t0 = 0;
    for k = 1:1:n_seg-1 % here k is the index of segments
        for i = 0:1:n_order  % here is i = 0 is p(j,n), from p(j,n) ... p(j,0) to p(j+1,n) p(j+1,0)
            Aeq_con_p(k,(n_order+1)*(k-1)+i+1) = ts(k)^(n_order-i);
            Aeq_con_p(k,(n_order+1)*(k)+i+1) = -t0^(n_order-i);            
        end        
    end
    
    %#####################################################
    % velocity continuity constrain between each 2 segments
    Aeq_con_v = zeros(n_seg-1, n_all_poly);
    beq_con_v = zeros(n_seg-1, 1);
    % STEP 2.5: write expression of Aeq_con_v and beq_con_v
    
    for k = 1:1:n_seg-1 % here k is the index of segments
        for i = 0:1:n_order-1  % from p(j,n-1) ... p(j,1) to p(j+1,n-1) p(j+1,1)
            Aeq_con_v(k,(n_order+1)*(k-1)+i+1) = (n_order-i)*ts(k)^(n_order-i-1);
            Aeq_con_v(k,(n_order+1)*(k)+i+1) = -(n_order-i)*t0^(n_order-i-1);     
        end        
    end

    %#####################################################
    % acceleration continuity constrain between each 2 segments
    Aeq_con_a = zeros(n_seg-1, n_all_poly);
    beq_con_a = zeros(n_seg-1, 1);
    % STEP 2.6: write expression of Aeq_con_a and beq_con_a
    
    for k = 1:1:n_seg-1 % here k is the index of segments
        for i = 0:1:n_order-2  % from p(j,n) ... p(j,2) to p(j+1,n) p(j+1,2)
            Aeq_con_a(k,(n_order+1)*(k-1)+i+1) = (n_order-i)*(n_order-i-1)*ts(k)^(n_order-i-2);
            Aeq_con_a(k,(n_order+1)*(k)+i+1) = -(n_order-i)*(n_order-i-1)*t0^(n_order-i-2);     
        end        
    end
    
    %#####################################################
    % jerk continuity constrain between each 2 segments 
    % todo constrains or conitnuity at which order??? 
    Aeq_con_j = zeros(n_seg-1, n_all_poly);
    beq_con_j = zeros(n_seg-1, 1);
    % STEP 2.7: write expression of Aeq_con_j and beq_con_j
    %
    for k = 1:1:n_seg-1 % here k is the index of segments
        for i = 0:1:n_order-3  % from p(j,n) ... p(j,3) to p(j+1,n) p(j+1,3)
            Aeq_con_j(k,(n_order+1)*(k-1)+i+1) = (n_order-i)*(n_order-i-1)*(n_order-i-2)*ts(k)^(n_order-i-3);
            Aeq_con_j(k,(n_order+1)*(k)+i+1) = -(n_order-i)*(n_order-i-1)*(n_order-i-2)*t0^(n_order-i-3);     
        end        
    end
    
    %#####################################################
    % combine all components to form Aeq and beq: todo: question   
    Aeq_con = [Aeq_con_p; Aeq_con_v; Aeq_con_a; Aeq_con_j];
    beq_con = [beq_con_p; beq_con_v; beq_con_a; beq_con_j];
    Aeq = [Aeq_start; Aeq_end; Aeq_wp; Aeq_con];
    beq = [beq_start; beq_end; beq_wp; beq_con];
end