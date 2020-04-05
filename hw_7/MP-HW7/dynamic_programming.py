import pickle
from racetracks import *
from graph_node import Node
import matplotlib.pyplot as plt
from copy import deepcopy 
import math 
seed = np.random.seed(1234)
graph = {}



def build_up_graph(grid, save_path):
    max_vel = 5

    # velocity dimension
    vel_list = []
    for i_vel in range(-max_vel+1, max_vel):
        for j_vel in range(-max_vel+1, max_vel):
            vel_list.append([i_vel, j_vel])

    # position dimension
    x_idx, y_idx = np.where(grid == FREE)
    coord = np.stack([x_idx, y_idx], axis=1)
    for p_idx in range(coord.shape[0]):
        pnt = coord[p_idx]
        for vel in vel_list:
            state = Node(pnt[0], pnt[1], vel[0], vel[1])
            state.connect_to_graph(grid)
            graph[state.key] = state

    for pnt in START_LINE:
        state = Node(pnt[0], pnt[1], 0, 0)
        state.connect_to_graph(grid)
        graph[state.key] = state

    for pnt in FINISH_LINE:
        state = Node(pnt[0], pnt[1], 0, 0)
        state.is_goal = True
        graph[state.key] = state

    output = open(save_path, 'wb')
    pickle.dump(graph, output)



def check_graph(grid):
    plt.figure(figsize=(4.5, 16))
    plt.pcolor(grid, edgecolors='k', linewidths=1)
    for key in graph.keys():
        for child_idx, child_key in enumerate(graph[key].next_prob_1): # or next_prob_1
            ux, uy = ACTION_SPACE[child_idx]
            vx, vy = graph[key].vx + ux,  graph[key].vy + uy
            child = graph[child_key]
            # check a specific connection
            # plt.title(str(vy) + '_' + str(vx))
            # plt.show()
            if [child.px, child.py] in START_LINE:
                print('found')
                continue
            plt.arrow(graph[key].py + 0.5, graph[key].px + 0.5,
                      child.py - graph[key].py, child.px - graph[key].px,
                      color='r', head_width=0.3, head_length=0.1)
            print(key, child_idx)
        # end for
    # end for
    plt.show()


def track_the_best_plan(idx = 0):
    start_node = Node(START_LINE[idx][0], START_LINE[idx][1], 0, 0)
    start_key = start_node.key
    state = graph[start_key]
    trajectory = [state]
    # for i in range(grid.shape[0]+grid.shape[1]) a safer condition
    num_loop = 0
    while not state.is_goal:
        value_uk = []
        for child_idx in range(len(ACTION_SPACE)):
            child_key_9 = state.next_prob_9[child_idx]
            child_9 = graph[child_key_9]
            value_uk.append(child_9.g_value)
        child_key = state.next_prob_9[np.argmin(value_uk)]
        state = graph[child_key]
        trajectory.append(state)
        print(state.px, state.py)
        if num_loop >= 1e3:
            print("No solution found!")
            break
    return trajectory



def visualize_the_best_plan(plan, grid_para):
    assert isinstance(plan, list)
    plt.figure(figsize=(4.5, 16))
    plt.pcolor(grid_para, edgecolors='k', linewidths=1)
    plan_len = len(plan)
    plan.append(plan[-1])
    for i in range(plan_len):
        plt.arrow(plan[i].py + 0.5, plan[i].px + 0.5,
                  plan[i+1].py - plan[i].py, plan[i+1].px - plan[i].px,
                  color='r', head_width=0.3, head_length=0.1)
    plt.show()



def dynamic_programming():
    itr_num = 0
    bellman_error = np.inf
    bellman_error_list = []
    while bellman_error > 0.0001:
        itr_num += 1
        bellman_error = 0.0
        for key in graph.keys():
            state = graph[key]
            if state.is_goal:
                state.g_value = 0
            else:
                value_uk = []
                for child_idx in range(len(ACTION_SPACE)):
                    child_key_9 = state.next_prob_9[child_idx]
                    child_9 = graph[child_key_9]
                    child_key_1 = state.next_prob_1[child_idx]
                    child_1 = graph[child_key_1]
                    expected_cost_uk = 0.9 * (1 + child_9.g_value) + 0.1 * (1 + child_1.g_value)
                    value_uk.append(expected_cost_uk)
                current_value = min(value_uk)
                bellman_error += np.linalg.norm(state.g_value - current_value)
                state.g_value = min(value_uk)
            # end if
        # end for
        bellman_error_list.append(bellman_error)
        print("{}th iteration: {}".format(itr_num, bellman_error))
    # end while

    plt.figure()
    x_axis = range(len(bellman_error_list))
    plt.plot(x_axis, bellman_error_list)
    plt.show()

def RTDP(greedy_prob = 0.8):
    itr_num = 0
    bellman_error = np.inf
    bellman_error_list = []    
    while bellman_error > 0.0001 and itr_num <=1e4:
        itr_num += 1
        bellman_error = 0.0
        # graph is a dict of Node (=state), graph[state.key] = state
        # state.key is an unique str representing a state (px,py,vx,vy)
        
        # trajectory 
        traj = []
        # getting the trajectory from value of G
        rand_start = START_LINE[np.random.randint(low=0, high=3, size=1)[0]]
        tmp = Node(rand_start[0],rand_start[1],0,0)
#        tmp = Node(0, 3, 0, 0)
  
        state = graph[tmp.key]        
        traj.append(state)
        #print("Trajectory is:",traj)
#        OPEN = [state]
#        CLOSED = []
        
        n = 0
        NUM_INT = 100 # avoid looping
        while state.is_goal == False and n <= NUM_INT:
            # in all reaachable states findoing out the next state
            n += 1
            neighbor_state_key = []
            neighbor_state_G = []
            #visited_state = []
            for child_idx in range(len(ACTION_SPACE)):
                if ACTION_SPACE[child_idx] == [0,0]: # forbidden stay at the same position!
                    continue
                
                child_key_9 = state.next_prob_9[child_idx] # only consider the states that are changed
                child_9 = graph[child_key_9]
                    
                if child_9 in traj:
                    continue # forbidden re-visiting node!                    
                else:
                    neighbor_state_key.append(child_key_9)
                    neighbor_state_G.append(child_9.g_value) 
            
            # trick: avoding no state to extend! restart!
            if neighbor_state_key == []:
                break
                
            # greedy or random. according to greedy_prob
            if np.random.rand() < greedy_prob:
                min_idx = np.argmin(neighbor_state_G)
                next_state_key = neighbor_state_key[min_idx]

            else: # randomly select an action but not optimal
                rand_idx = np.random.randint(low=0, high=len(neighbor_state_key)) 
                next_state_key = neighbor_state_key[rand_idx]
             

            
            state = graph[next_state_key]
            traj.append(state)
        
        if n >= NUM_INT:
#            for st in traj:
#                print(st.key)
            print("It seems that there is a loop during greedy policy!")
            #raise SystemExit(0) 
        
        
        # Bacak up the state G value along the trajectory
        for (state_0,state_1) in zip(traj[0:-1],traj[1:]): # until goal found

            expected_cost_uk_star = 0.9 * (1 + state_1.g_value) + 0.1 * (1 + state_0.g_value)                
            current_value = expected_cost_uk_star
            bellman_error += np.linalg.norm(state_0.g_value - current_value)
            state_0.g_value = current_value # update G
                                    
        bellman_error_list.append(bellman_error)
        print("{}th iteration: {}".format(itr_num, bellman_error))
    # end while

    plt.figure()
    x_axis = range(len(bellman_error_list))
    plt.plot(x_axis, bellman_error_list)
    plt.show()

# initializaing admissible g value
def init_G_value():
    Gmap = deepcopy(race_track).astype(float)
    # Finish line G = 0
    for point in FINISH_LINE:
        Gmap[point[0],point[1]] = 0
    
    # Start line G will be initialized again      
    for point in START_LINE:
        Gmap[point[0],point[1]] = 0        
        
    # Occupied G = 120
    Gmap = Gmap * 99

    [row_total, col_total] = Gmap.shape

    # Zone 1
    # max vel = 4 and at least one step to go to the destination     
    for col in range(0,12):
        Gmap[32:, 12-col-1] = math.ceil(col / 4)
    
    # Zone 2
    # Diagonal Heuristic
    goal_x_list = [32, 33, 34]
    goal_y = 11
    g = []
    for px in range(0,row_total):
        for py in range(0,col_total-3):
            if Gmap[px,py] == 0:
                for goal_x in goal_x_list:
                    dx = abs(px - goal_x)
                    dy = abs(py - goal_y)
                    g.append(math.ceil((dx + dy - 2*min(dx,dy))/4)  + math.ceil(min(dx,dy)/4)) # similar to Diagonal Heuristic
                Gmap[px,py] = min(g) + 0.01 * abs(px -32) # to encourage the racing car to move forward
                
                # this won't break the admissibility as the obstacle exsists
    return Gmap

def G_to_graph(graph, Gmap):
    for key in graph:
        px = graph[key].px
        py = graph[key].py
        vx = graph[key].vx
        vy = graph[key].vy
        
        # give penalty to those cause accidents except final line
        if (px in [32, 33, 34]) and (py in [11]):
            continue
        
        neigh_status = []
        
        # Give those states causing unavoiavle collsion  (OUTBOUND, OCCUPIED) 
        # penalty
        
        for neighbor_key in graph[key].next_prob_9:
            if neighbor_key in ['00030000', '00040000', '00050000', '00060000']:
                neigh_status.append(1) # collision takes place!
            else:
                neigh_status.append(0)

        neigh_status = np.array(neigh_status)   
        
        # all neighbor states are in start line : Collision can't be avoided!
        if neigh_status.all():
            graph[key].g_value = 99 # give penalty to it

        # all neighbor status ==  FINISH or START or FREE 
        else:
            graph[key].g_value = Gmap[px][py]           
        
        bound_x_0 = 0
        bound_x_1 = 34
        
        # unavoiavle outbound
        if px >= 0 and px < 4:
            bound_y_0 = 3
            bound_y_1 = 6
        elif px >= 4 and px < 8:
            bound_y_0 = 2
            bound_y_1 = 6        
        elif px >= 8 and px < 12:
            bound_y_0 = 1
            bound_y_1 = 6        
        elif px >= 12 and px < 32:
            bound_y_0 = 0
            bound_y_1 = 6          
        else:
            bound_y_0 = 0
            bound_y_1 = 11  
            
        if abs(vx) == 4 :
           if abs(px - bound_x_0) <= 6 or  abs(px - bound_x_1) <= 6:
               graph[key].g_value = 99
        elif abs(vx) == 3:
           if abs(px - bound_x_0) <= 3 or  abs(px - bound_x_1) <= 3:
               graph[key].g_value = 99                
        elif abs(vx) == 2:
           if abs(px - bound_x_0) <= 1 or  abs(px - bound_x_1) <= 1:
               graph[key].g_value = 99            
        elif abs(vx) == 1:
           if abs(px - bound_x_0) <= 0 or  abs(px - bound_x_1) <= 0:
               graph[key].g_value = 99  
               
        if abs(vy) == 4 :
           if abs(py - bound_y_0) <= 6 or  abs(py - bound_y_1) <= 6:
               graph[key].g_value = 99
        elif abs(vy) == 3:
           if abs(py - bound_y_0) <= 3 or  abs(py - bound_y_1) <= 3:
               graph[key].g_value = 99                
        elif abs(vy) == 2:
           if abs(py - bound_y_0) <= 1 or  abs(py - bound_y_1) <= 1:
               graph[key].g_value = 99            
        elif abs(vy) == 1:
           if abs(py - bound_y_0) <= 0 or  abs(py - bound_y_1) <= 0:
               graph[key].g_value = 99               
               
              
         


        
        
            
    return graph
    
    


if __name__ == '__main__':
    path = './solution/graph_dp.dat'
    track_map = race_track
    build_up_graph(track_map, path)
    graph = pickle.load(open(path, 'rb'))
    


    # solve
#    dynamic_programming()
    Gmap = init_G_value()
    print("Intial G map:")
    print(Gmap)
    graph = G_to_graph(graph, Gmap)
    RTDP(greedy_prob = 1.0)
    
    plan = track_the_best_plan()
    visualize_the_best_plan(plan, track_map)
