#include <hw_tool.h>

using namespace std;
using namespace Eigen;

void Homeworktool::initGridMap(double _resolution, Vector3d global_xyz_l, Vector3d global_xyz_u, int max_x_id, int max_y_id, int max_z_id)
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
}

void Homeworktool::setObs(const double coord_x, const double coord_y, const double coord_z)
{   
    if( coord_x < gl_xl  || coord_y < gl_yl  || coord_z <  gl_zl || 
        coord_x >= gl_xu || coord_y >= gl_yu || coord_z >= gl_zu )
        return;

    int idx_x = static_cast<int>( (coord_x - gl_xl) * inv_resolution);
    int idx_y = static_cast<int>( (coord_y - gl_yl) * inv_resolution);
    int idx_z = static_cast<int>( (coord_z - gl_zl) * inv_resolution);      
    
    data[idx_x * GLYZ_SIZE + idx_y * GLZ_SIZE + idx_z] = 1;
}

bool Homeworktool::isObsFree(const double coord_x, const double coord_y, const double coord_z)
{
    Vector3d pt;
    Vector3i idx;
    
    pt(0) = coord_x;
    pt(1) = coord_y;
    pt(2) = coord_z;
    idx = coord2gridIndex(pt);

    int idx_x = idx(0);
    int idx_y = idx(1);
    int idx_z = idx(2);

    return (idx_x >= 0 && idx_x < GLX_SIZE && idx_y >= 0 && idx_y < GLY_SIZE && idx_z >= 0 && idx_z < GLZ_SIZE && 
           (data[idx_x * GLYZ_SIZE + idx_y * GLZ_SIZE + idx_z] < 1));
}

Vector3d Homeworktool::gridIndex2coord(const Vector3i & index) 
{
    Vector3d pt;

    pt(0) = ((double)index(0) + 0.5) * resolution + gl_xl;
    pt(1) = ((double)index(1) + 0.5) * resolution + gl_yl;
    pt(2) = ((double)index(2) + 0.5) * resolution + gl_zl;

    return pt;
}

Vector3i Homeworktool::coord2gridIndex(const Vector3d & pt) 
{
    Vector3i idx;
    idx <<  min( max( int( (pt(0) - gl_xl) * inv_resolution), 0), GLX_SIZE - 1),
            min( max( int( (pt(1) - gl_yl) * inv_resolution), 0), GLY_SIZE - 1),
            min( max( int( (pt(2) - gl_zl) * inv_resolution), 0), GLZ_SIZE - 1);                  
  
    return idx;
}

Eigen::Vector3d Homeworktool::coordRounding(const Eigen::Vector3d & coord)
{
    return gridIndex2coord(coord2gridIndex(coord));
}

double Homeworktool::OptimalBVP(Eigen::Vector3d _start_position,Eigen::Vector3d _start_velocity,Eigen::Vector3d _target_position)
{
    double optimal_cost = 100000; // this just to initial the optimal_cost, you can delete it 
    /*
    STEP 2: go to the hw_tool.cpp and finish the function Homeworktool::OptimalBVP
    the solving process has been given in the document

    because the final point of trajectory is the start point of OBVP, so we input the pos,vel to the OBVP

    after finish Homeworktool::OptimalBVP, the Trajctory_Cost will record the optimal cost of this trajectory
    */

    // Assuming that vf = 0

    std::cout<<"_start_velocity: "<<std::endl<<_start_velocity<<std::endl<<std::endl;

    double dx = _target_position(0) - _start_position(0);
    double dy = _target_position(1) - _start_position(1);
    double dz = _target_position(2) - _start_position(2);

    double vx0 = _start_velocity(0);
    double vy0 = _start_velocity(1);
    double vz0 = _start_velocity(2);

    // solving T^4 - 4*(vx0^2 + vy0^2 + vz0^2) * T^2 + 24 * (dx * vx0 + dy * vy0 + dz * vz0) * T - 36 * (dx^2 + dy^2 +dz^2)
    Eigen::Matrix<double, 4, 4> matrix_44;  // ref: https://blog.csdn.net/fb_941219/article/details/102984587
    Eigen::Matrix<complex<double>, Eigen::Dynamic, Eigen::Dynamic> matrix_eigenvalues;

    double c0 = -36 * (dx*dx + dy*dy +dz*dz);
    double c1 = 24 * (dx * vx0 + dy * vy0 + dz * vz0);
    double c2 = -4*(vx0*vx0 + vy0*vy0 + vz0*vz0);
    double c3 = 0.0;

    matrix_44 << 0, 0, 0, -c0,
            1, 0, 0, -c1,
            0, 1, 0, -c2,
            0, 0, 1, c3;

    std::cout<<"matrix_44: "<<std::endl<<matrix_44<<std::endl<<std::endl;

    matrix_eigenvalues = matrix_44.eigenvalues();
    std::cout<<"matrix_eigenvalues: "<<std::endl<<matrix_eigenvalues<<std::endl;

    // approximation of analytic solution
    std::vector<double> j;
    std::vector<double> t;

    Eigen::Vector3d a(0,0,0);
    Eigen::Vector3d b(0,0,0);




    for(int i = 0; i < 4; i++){ // loop through four roots
        t.push_back(std::real(matrix_eigenvalues(i)));
        double img = std::imag(matrix_eigenvalues(i));
        if((t[i] <= 0) || std::abs(img) >= 1e-16){ // ignoring negative roots and complex roots, if all roots are complex, the function J is monotonous
            //

            j.push_back(optimal_cost); // a big number
            continue;
        }

        for(int j = 0; j < 3; j++){ // loop through three dimensions
            a(j) = -12.0 / std::pow(t[i],3) * (_target_position(j) - _start_position(j) - _start_velocity(j) * t[i]) + 6.0 / std::pow(t[i],2) * (-_start_velocity(j));
            b(j) = 6.0 / std::pow(_target_position(j) - _start_position(j) - _start_velocity(j) * t[i],2) - 2.0 / t[i] *(-_start_velocity(j));

        }

        auto cost = ( 1.0 / 3.0 * a.dot(a)) * std::pow(t[i],3) + a.dot(b) * std::pow(t[i],2)  + (b.dot(b) + 1) * t[i];
        j.push_back(cost);



    }
    // test
    double temp_t  = 1e-8;
    Eigen::Vector3d temp_a(0,0,0);
    Eigen::Vector3d temp_b(0,0,0);

    for(int j = 0; j < 3; j++){ // loop through three dimensions
        temp_a(j) = -12.0 / std::pow(temp_t,3) * (_target_position(j) - _start_position(j) - _start_velocity(j) * temp_t) + 6.0 / std::pow(temp_t,2) * (-_start_velocity(j));
        temp_b(j) = 6.0 / std::pow(_target_position(j) - _start_position(j) - _start_velocity(j) * temp_t,2) - 2.0 / temp_t *(-_start_velocity(j));
    }
    double temp_cost = ( 1.0 / 3.0 * temp_a.dot(temp_a)) * std::pow(temp_t,3) + temp_a.dot(temp_b) * std::pow(temp_t,2)  + (temp_b.dot(temp_b) + 1) * temp_t;
    std::cout<<"if t is approaching zero, J is: "<<temp_cost<<std::endl;

    temp_t  = 1e8;
    Eigen::Vector3d temp_aa(0,0,0);
    Eigen::Vector3d temp_bb(0,0,0);

    for(int j = 0; j < 3; j++){ // loop through three dimensions
        temp_aa(j) = -12.0 / std::pow(temp_t,3) * (_target_position(j) - _start_position(j) - _start_velocity(j) * temp_t) + 6.0 / std::pow(temp_t,2) * (-_start_velocity(j));
        temp_bb(j) = 6.0 / std::pow(_target_position(j) - _start_position(j) - _start_velocity(j) * temp_t,2) - 2.0 / temp_t *(-_start_velocity(j));


    }
    temp_cost = ( 1.0 / 3.0 * temp_aa.dot(temp_aa)) * std::pow(temp_t,3) + temp_aa.dot(temp_bb) * std::pow(temp_t,2)  + (temp_bb.dot(temp_bb) + 1) * temp_t;
    std::cout<<"if t is approaching inf, J is: "<<temp_cost<<std::endl;

    optimal_cost  = *min_element(j.begin(), j.end()); // get the optimal cost
    std::cout<<"optimal cost: "<<optimal_cost<<std::endl;

    return optimal_cost;
}
