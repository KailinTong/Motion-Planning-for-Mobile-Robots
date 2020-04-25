#include "Astar_searcher.h"

using namespace std;
using namespace Eigen;

bool tie_break = false;

void AstarPathFinder::initGridMap(double _resolution, Vector3d global_xyz_l, Vector3d global_xyz_u, int max_x_id, int max_y_id, int max_z_id)
{   
    gl_xl = global_xyz_l(0);
    gl_yl = global_xyz_l(1);
    gl_zl = global_xyz_l(2);

    gl_xu = global_xyz_u(0);
    gl_yu = global_xyz_u(1);
    gl_zu = global_xyz_u(2);
    
    GLX_SIZE = max_x_id;
    GLY_SIZE = max_y_id;
    GLZ_SIZE = max_z_id;
    GLYZ_SIZE  = GLY_SIZE * GLZ_SIZE;
    GLXYZ_SIZE = GLX_SIZE * GLYZ_SIZE;

    resolution = _resolution;
    inv_resolution = 1.0 / _resolution;    

    data = new uint8_t[GLXYZ_SIZE];
    memset(data, 0, GLXYZ_SIZE * sizeof(uint8_t));
    
    GridNodeMap = new GridNodePtr ** [GLX_SIZE];
    for(int i = 0; i < GLX_SIZE; i++){
        GridNodeMap[i] = new GridNodePtr * [GLY_SIZE];
        for(int j = 0; j < GLY_SIZE; j++){
            GridNodeMap[i][j] = new GridNodePtr [GLZ_SIZE];
            for( int k = 0; k < GLZ_SIZE;k++){
                Vector3i tmpIdx(i,j,k);
                Vector3d pos = gridIndex2coord(tmpIdx);
                GridNodeMap[i][j][k] = new GridNode(tmpIdx, pos);
            }
        }
    }
}

void AstarPathFinder::resetGrid(GridNodePtr ptr)
{
    ptr->id = 0;
    ptr->cameFrom = NULL;
    ptr->gScore = inf;
    ptr->fScore = inf;
}

void AstarPathFinder::resetUsedGrids()
{   
    for(int i=0; i < GLX_SIZE ; i++)
        for(int j=0; j < GLY_SIZE ; j++)
            for(int k=0; k < GLZ_SIZE ; k++)
                resetGrid(GridNodeMap[i][j][k]);
}

void AstarPathFinder::setObs(const double coord_x, const double coord_y, const double coord_z)
{   
    if( coord_x < gl_xl  || coord_y < gl_yl  || coord_z <  gl_zl || 
        coord_x >= gl_xu || coord_y >= gl_yu || coord_z >= gl_zu )
        return;

    int idx_x = static_cast<int>( (coord_x - gl_xl) * inv_resolution);
    int idx_y = static_cast<int>( (coord_y - gl_yl) * inv_resolution);
    int idx_z = static_cast<int>( (coord_z - gl_zl) * inv_resolution);      

    data[idx_x * GLYZ_SIZE + idx_y * GLZ_SIZE + idx_z] = 1;
}

vector<Vector3d> AstarPathFinder::getVisitedNodes()
{   
    vector<Vector3d> visited_nodes;
    for(int i = 0; i < GLX_SIZE; i++)
        for(int j = 0; j < GLY_SIZE; j++)
            for(int k = 0; k < GLZ_SIZE; k++){   
                if(GridNodeMap[i][j][k]->id != 0) // visualize all nodes in open and close list
//                if(GridNodeMap[i][j][k]->id == -1)  // visualize nodes in close list only TODO: careful
                    visited_nodes.push_back(GridNodeMap[i][j][k]->coord);
            g}

    ROS_WARN("visited_nodes size : %d", visited_nodes.size());
    return visited_nodes;
}

Vector3d AstarPathFinder::gridIndex2coord(const Vector3i & index) 
{
    Vector3d pt;

    pt(0) = ((double)index(0) + 0.5) * resolution + gl_xl;
    pt(1) = ((double)index(1) + 0.5) * resolution + gl_yl;
    pt(2) = ((double)index(2) + 0.5) * resolution + gl_zl;

    return pt;
}

Vector3i AstarPathFinder::coord2gridIndex(const Vector3d & pt) 
{
    Vector3i idx;
    idx <<  min( max( int( (pt(0) - gl_xl) * inv_resolution), 0), GLX_SIZE - 1),
            min( max( int( (pt(1) - gl_yl) * inv_resolution), 0), GLY_SIZE - 1),
            min( max( int( (pt(2) - gl_zl) * inv_resolution), 0), GLZ_SIZE - 1);                  
  
    return idx;
}

Eigen::Vector3d AstarPathFinder::coordRounding(const Eigen::Vector3d & coord)
{
    return gridIndex2coord(coord2gridIndex(coord));
}

inline bool AstarPathFinder::isOccupied(const Eigen::Vector3i & index) const
{
    return isOccupied(index(0), index(1), index(2));
}

inline bool AstarPathFinder::isFree(const Eigen::Vector3i & index) const
{
    return isFree(index(0), index(1), index(2));
}

inline bool AstarPathFinder::isOccupied(const int & idx_x, const int & idx_y, const int & idx_z) const 
{
    return  (idx_x >= 0 && idx_x < GLX_SIZE && idx_y >= 0 && idx_y < GLY_SIZE && idx_z >= 0 && idx_z < GLZ_SIZE && 
            (data[idx_x * GLYZ_SIZE + idx_y * GLZ_SIZE + idx_z] == 1));
}

inline bool AstarPathFinder::isFree(const int & idx_x, const int & idx_y, const int & idx_z) const 
{
    return (idx_x >= 0 && idx_x < GLX_SIZE && idx_y >= 0 && idx_y < GLY_SIZE && idx_z >= 0 && idx_z < GLZ_SIZE && 
           (data[idx_x * GLYZ_SIZE + idx_y * GLZ_SIZE + idx_z] < 1));
}

inline void AstarPathFinder::AstarGetSucc(GridNodePtr currentPtr, vector<GridNodePtr> & neighborPtrSets, vector<double> & edgeCostSets)
{   
    neighborPtrSets.clear(); // Note: the pointers in this set copy pointers to GridNodeMap
    edgeCostSets.clear();
    /*
    *
    STEP 4: finish AstarPathFinder::AstarGetSucc yourself 
    please write your code below
    *
    *
    */
    // idea index -> coordinate -> edgecost
    if(currentPtr == nullptr)
        std::cout << "Error: Current pointer is null!" << endl;


    Eigen::Vector3i thisNode = currentPtr -> index;
    int this_x = thisNode[0];
    int this_y = thisNode[1];
    int this_z = thisNode[2];
    auto this_coord = currentPtr -> coord;
    int  n_x, n_y, n_z;
    double dist;
    GridNodePtr temp_ptr = nullptr;
    Eigen::Vector3d n_coord;

    for(int i = -1;i <= 1;++i ){
        for(int j = -1;j <= 1;++j ){
            for(int k = -1;k <= 1;++k){
                if( i == 0 && j == 0 && k == 0)
                    continue; // to avoid this node
                n_x = this_x + i;
                n_y = this_y + j;
                n_z = this_z + k;

                if( (n_x < 0) || (n_x > (GLX_SIZE - 1)) || (n_y < 0) || (n_y > (GLY_SIZE - 1) ) || (n_z < 0) || (n_z > (GLZ_SIZE - 1)))
                    continue; // to avoid index problem
                if(isOccupied(n_x, n_y, n_z))
                    continue; // to avoid obstacles
                // put the pointer into neighborPtrSets
                temp_ptr = GridNodeMap[n_x][n_y][n_z];

                if(temp_ptr->id == -1) continue; // todo to check this; why the node can transversing the obstacles

                n_coord = temp_ptr->coord;


                if(temp_ptr == currentPtr){
                    std::cout << "Error: temp_ptr == currentPtr)" << std::endl;
                }

                if( (std::abs(n_coord[0] - this_coord[0]) < 1e-6) and (std::abs(n_coord[1] - this_coord[1]) < 1e-6) and (std::abs(n_coord[2] - this_coord[2]) < 1e-6 )){
                    std::cout << "Error: Not expanding correctly!" << std::endl;
                    std::cout << "n_coord:" << n_coord[0] << " "<<n_coord[1]<<" "<<n_coord[2] << std::endl;
                    std::cout << "this_coord:" << this_coord[0] << " "<<this_coord[1]<<" "<<this_coord[2] << std::endl;

                    std::cout << "current node index:" << this_x << " "<< this_y<<" "<< this_z << std::endl;
                    std::cout << "neighbor node index:" << n_x << " "<< n_y<<" "<< n_z << std::endl;
                }


                dist = std::sqrt( (n_coord[0] - this_coord[0]) * (n_coord[0] - this_coord[0])+
                        (n_coord[1] - this_coord[1]) * (n_coord[1] - this_coord[1])+
                        (n_coord[2] - this_coord[2]) * (n_coord[2] - this_coord[2]));
                neighborPtrSets.push_back(temp_ptr); // calculate the cost in edgeCostSets: inf means that is not unexpanded
                edgeCostSets.push_back(dist); // put the cost inot edgeCostSets




            }
        }
    }



}

double AstarPathFinder::getHeu(GridNodePtr node1, GridNodePtr node2)
{
    /* 
    choose possible heuristic function you want
    Manhattan, Euclidean, Diagonal, or 0 (Dijkstra)
    Remember tie_breaker learned in lecture, add it here ?
    *
    *
    *
    STEP 1: finish the AstarPathFinder::getHeu , which is the heuristic function
    please write your code below
    *
    *
    */
    double h;
    auto node1_coord = node1->coord;
    auto node2_coord = node2->coord;

    // Heuristics 1: Manhattan
//    h = std::abs(node1_coord(0) - node2_coord(0) ) +
//            std::abs(node1_coord(1) - node2_coord(1) ) +
//            std::abs(node1_coord(2) - node2_coord(2) );

    // Heuristics 2: Euclidean
//    h = std::sqrt(std::pow((node1_coord(0) - node2_coord(0)), 2 ) +
//            std::pow((node1_coord(1) - node2_coord(1)), 2 ) +
//            std::pow((node1_coord(2) - node2_coord(2)), 2 ));

    // Heuristics 3: Diagnol distance
        double dx = std::abs(node1_coord(0) - node2_coord(0) );
        double dy = std::abs(node1_coord(1) - node2_coord(1) );
        double dz = std::abs(node1_coord(2) - node2_coord(2) );
        double min_xyz = std::min({dx, dy, dz});
        h = dx + dy + dz + (std::sqrt(3.0) -3) * min_xyz; // idea: diagnol is a short-cut, find out how many short-cuts can be realized

        if(tie_break){
            double p = 1.0 / 25.0;
            h *= (1.0 + p);
            //std::cout << "Tie Break!" << std::endl;
        }
//    std::cout <<"h is: "<< h << std::endl;
    return h;
}

void AstarPathFinder::AstarGraphSearch(Vector3d start_pt, Vector3d end_pt)
{   
    ros::Time time_1 = ros::Time::now();    

    //index of start_point and end_point
    Vector3i start_idx = coord2gridIndex(start_pt);
    Vector3i end_idx   = coord2gridIndex(end_pt);
    goalIdx = end_idx;

    //position of start_point and end_point
    start_pt = gridIndex2coord(start_idx);
    end_pt   = gridIndex2coord(end_idx);

    //Initialize the pointers of struct GridNode which represent start node and goal node
    GridNodePtr startPtr = new GridNode(start_idx, start_pt);
    GridNodePtr endPtr   = new GridNode(end_idx,   end_pt);

    //openSet is the open_list implemented through multimap in STL library
    openSet.clear();
    // currentPtr represents the node with lowest f(n) in the open_list
    GridNodePtr currentPtr  = NULL;
    GridNodePtr neighborPtr = NULL;

    //put start node in open set
    startPtr -> gScore = 0;
    startPtr -> fScore = getHeu(startPtr,endPtr);   
    //STEP 1: finish the AstarPathFinder::getHeu , which is the heuristic function
    startPtr -> id = 1; 
    startPtr -> coord = start_pt;
    openSet.insert( make_pair(startPtr -> fScore, startPtr) ); // todo Note: modified, insert the pointer GridNodeMap[i][j][k] to the start node in grid map
    /*
    *
    STEP 2 :  some else preparatory works which should be done before while loop
    please write your code below
    *
    *
    */
    // three dimension pointer GridNodeMap[i][j][k] is pointed to a struct GridNode(Eigen::Vector3i _index, Eigen::Vector3d _coord);
    // assign g(xs) = 0, g(n) = inf (already done in initialzation of struct)
    // mark start point as visited(expanded) (id 0: no operation, id: 1 in OPEN, id -1: in CLOSE )

    GridNodeMap[start_idx[0]][start_idx[1]][start_idx[2]] -> id = 1;


    vector<GridNodePtr> neighborPtrSets;
    vector<double> edgeCostSets;
    Eigen::Vector3i current_idx; // record the current index

    // this is the main loop
    while ( !openSet.empty() ){
        /*
        *
        *
        step 3: Remove the node with lowest cost function from open set to closed set
        please write your code below
        
        IMPORTANT NOTE!!!
        This part you should use the C++ STL: multimap, more details can be find in Homework description
        *
        *
        */

        currentPtr = openSet.begin() -> second; // first T1, second T2
        openSet.erase(openSet.begin()); // remove the node with minimal f value
        current_idx = currentPtr->index;
        GridNodeMap[current_idx[0]][current_idx[1]][current_idx[2]] -> id = -1;// update the id in grid node map
        // if the current node is the goal 
        if( currentPtr->index == goalIdx ){
            ros::Time time_2 = ros::Time::now();
            terminatePtr = currentPtr;
            ROS_WARN("[A*]{sucess}  Time in A*  is %f ms, path cost if %f m", (time_2 - time_1).toSec() * 1000.0, currentPtr->gScore * resolution );            
            return;
        }
        //get the succetion
        AstarGetSucc(currentPtr, neighborPtrSets, edgeCostSets);  //STEP 4: finish AstarPathFinder::AstarGetSucc yourself     

        /*
        *
        *
        STEP 5:  For all unexpanded neigbors "m" of node "n", please finish this for loop
        please write your code below
        *        
        */         
        for(int i = 0; i < (int)neighborPtrSets.size(); i++){
            /*
            *
            *
            Judge if the neigbors have been expanded
            please write your code below
            
            IMPORTANT NOTE!!!
            neighborPtrSets[i]->id = -1 : expanded, equal to this node is in close set
            neighborPtrSets[i]->id = 1 : unexpanded, equal to this node is in open set
            *        
            */
            neighborPtr = neighborPtrSets[i];
            if(neighborPtr -> id == 0){ //discover a new node, which is not in the closed set and open set
                /*
                *
                *
                STEP 6:  As for a new node, do what you need do ,and then put neighbor in open set and record it
                please write your code below
                *        
                */
                // shall update: gScore = inf; fScore = inf; cameFrom = NULL, id, mayby direction

                neighborPtr->gScore = currentPtr->gScore + edgeCostSets[i];
                neighborPtr->fScore = neighborPtr->gScore + getHeu(neighborPtr,endPtr);
                neighborPtr->cameFrom = currentPtr; // todo shallow copy or deep copy
                // push node "m" into OPEN
                openSet.insert(make_pair(neighborPtr -> fScore, neighborPtr));
                neighborPtr -> id = 1;
                continue;
            }
            else if(neighborPtr -> id == 1){ //this node is in open set and need to judge if it needs to update, the "0" should be deleted when you are coding
                /*
                *
                *
                STEP 7:  As for a node in open set, update it , maintain the openset ,and then put neighbor in open set and record it
                please write your code below
                *        
                */
                // shall update: gScore; fScore; cameFrom, mayby direction
                if(neighborPtr -> gScore > (currentPtr -> gScore + edgeCostSets[i])){
                    neighborPtr -> gScore = currentPtr -> gScore + edgeCostSets[i];
                    neighborPtr -> fScore = neighborPtr -> gScore + getHeu(neighborPtr,endPtr);
                    neighborPtr -> cameFrom = currentPtr;
                }

                continue;
            }
            else{//this node is in closed set
                /*
                *
                please write your code below
                *        
                */
                // todo nothing to do here?
                continue;
            }
        }      
    }
    //if search fails
    ros::Time time_2 = ros::Time::now();
    if((time_2 - time_1).toSec() > 0.1)
        ROS_WARN("Time consume in Astar path finding is %f", (time_2 - time_1).toSec() );
}


vector<Vector3d> AstarPathFinder::getPath() 
{   
    vector<Vector3d> path;
    vector<GridNodePtr> gridPath;
    /*
    *
    *
    STEP 8:  trace back from the curretnt nodePtr to get all nodes along the path
    please write your code below
    *      
    */
    auto ptr = terminatePtr;
    while(ptr -> cameFrom != NULL){
        gridPath.push_back(ptr);
        ptr = ptr->cameFrom;
    }

    for (auto ptr: gridPath)
        path.push_back(ptr->coord);
        
    reverse(path.begin(),path.end());

    return path;
}

// if the difference of f is trivial, then choose then prefer the path along the straight line from start to goal
// discared!!!
GridNodePtr & TieBreaker(const std::multimap<double, GridNodePtr> &  openSet, const GridNodePtr & endPtr) {
    // todo do I have to update the f in openSet??
    std::multimap<double, GridNodePtr> local_set;

    auto f_min = openSet.begin()->first;
    auto f_max = f_min + 1e-2;
    auto itlow = openSet.lower_bound (f_min);
    auto itup = openSet.upper_bound(f_max);
    double cross, f_new;

    for (auto it=itlow; it!=itup; ++it){
        std::cout << "f value is:" << (*it).first << " pointer is: " << (*it).second << '\n';
        cross = std::abs(endPtr->coord(0) - (*it).second->coord(0)) +
                std::abs(endPtr->coord(1) - (*it).second->coord(1)) +
                std::abs(endPtr->coord(2) - (*it).second->coord(2));
        f_new = (*it).second->fScore + 0.001 * cross;
        local_set.insert( make_pair(f_new, (*it).second) ); // todo what is iterator, is this way correct?
    }


    return local_set.begin()->second;
}
