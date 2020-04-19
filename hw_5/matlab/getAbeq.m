function [Aeq, beq]= getAbeq(n_seg, n_order, waypoints, ts, start_cond, end_cond)
    n_all_poly = n_seg*(n_order+1);
   
    %#####################################################
    % p,v,a,j constraint in start, 
    % Note: p = [p0, p1, p2,...pn-1]'           
    Aeq_start = zeros(4, n_all_poly);
    beq_start =  start_cond';
    Aeq_start(1:4,1:8) = getCoeff(0); 

    
    %#####################################################
    % p,v,a constraint in end
    Aeq_end = zeros(4, n_all_poly);
    beq_end =  end_cond';
    t = ts(end);
    Aeq_end(1:4, end-7:end) = getCoeff(t);

    %#####################################################
    % position constrain in all middle waypoints
    Aeq_wp = zeros(n_seg-1, n_all_poly);
    beq_wp = zeros(n_seg-1, 1);
    % STEP 2.3: write expression of Aeq_wp and beq_wp
  
    for k = 0:1:n_seg-2 % here k is the index of segments
        beq_wp(k+1, 1) = waypoints(k+2);
        coeff = getCoeff(ts(k+1));
        Aeq_wp(k+1, 1+k*8:8+k*8) = coeff(1, :);  
    end
    
    
    %#####################################################
    % position continuity constrain between each 2 segments
    Aeq_con_p = zeros(n_seg-1, n_all_poly);
    beq_con_p = zeros(n_seg-1, 1);
    % velocity continuity constrain between each 2 segments
    Aeq_con_v = zeros(n_seg-1, n_all_poly);
    beq_con_v = zeros(n_seg-1, 1);
    % acceleration continuity constrain between each 2 segments
    Aeq_con_a = zeros(n_seg-1, n_all_poly);
    beq_con_a = zeros(n_seg-1, 1);
    % jerk continuity constrain between each 2 segments 
    Aeq_con_j = zeros(n_seg-1, n_all_poly);
    beq_con_j = zeros(n_seg-1, 1);
    Aeq_con = [Aeq_con_p; Aeq_con_v; Aeq_con_a; Aeq_con_j];
    beq_con = [beq_con_p; beq_con_v; beq_con_a; beq_con_j];
    
    % STEP 2.4: write expression of Aeq_con_p and beq_con_p
    for k = 0:1:n_seg-2 % here k is the index of segments
            Aeq_con(1+4*k:4+4*k,1+8*k:8+8*k) = getCoeff(ts(k+1));
            Aeq_con(1+4*k:4+4*k,1+8*(k+1):8+8*(k+1)) = -getCoeff(0);            
    end
    
    %#####################################################
    % combine all components to form Aeq and beq:  
    Aeq = [Aeq_start; Aeq_end; Aeq_wp; Aeq_con];
    beq = [beq_start; beq_end; beq_wp; beq_con];
end