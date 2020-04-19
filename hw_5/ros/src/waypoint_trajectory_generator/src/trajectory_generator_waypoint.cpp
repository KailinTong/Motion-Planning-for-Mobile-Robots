#include "trajectory_generator_waypoint.h"
#include <stdio.h>
#include <ros/ros.h>
#include <iostream>
#include <fstream>
#include <string>
#include <cmath>
#include <vector>
using namespace std;
using namespace Eigen;

TrajectoryGeneratorWaypoint::TrajectoryGeneratorWaypoint(){}
TrajectoryGeneratorWaypoint::~TrajectoryGeneratorWaypoint(){}

//define factorial function, input i, output i!
int TrajectoryGeneratorWaypoint::Factorial(int x)
{
    int fac = 1;
    for(int i = x; i > 0; i--)
        fac = fac * i;
    return fac;
}


MatrixXd TrajectoryGeneratorWaypoint::getCt(int const n_seg, int const d_order){ // d_order is 4
    /*
     * get Selection Matrix
     * args:
     *      n_seg: the number of segments
     *      d_order: the deferential order: if minimal jerk. it is 3,
     * return:
     *      Ct: a matrix,
     *      row corresponds to original variable vector d ( 2 * d_order * n_seg )
     *      column corresponds to [ dF, dP ]' ( d_order*2*n_seg - (n_seg-1)*d_order )
     *      Note: the variables implicitly eliminates same variables""
     */
    // we have n_seg segments, from 0 to n_seg-1
    int ct_rows = d_order*2*n_seg;
    int ct_cols = d_order*2*n_seg - (n_seg-1)*d_order;
    MatrixXd Ct = MatrixXd::Zero(ct_rows, ct_cols);
    vector<int> d_vector;
    for(int k = 0; k < n_seg; k ++){
        for(int t = 0; t < 2; t++){
            for(int d = 0; d < d_order; d++){
                d_vector.push_back(k*100+t*10+d);
            }
        }
    }
    int val, row;
    int col = 0; // column of one in Ct

    // fixed starting point at segment 0 in [ dF, dP ]'
    int k = 0;
    int t = 0;
    int d = 0;
    for(d = 0; d < d_order; d++){
        val = k * 100 + t * 10 + d;
        auto it = std::find(d_vector.begin(), d_vector.end(), val);
        row = std::distance(d_vector.begin(), it);
        Ct(row, col) = 1;
        col += 1;
    }
    // fixed final point at segment 0, 1, 2, n_seg-2 in [ dF, dP ]'
    t = 1;
    d = 0;
    for(k = 0; k < n_seg - 1; k++){
        val = k * 100 + t * 10 + d;
        auto it = std::find(d_vector.begin(), d_vector.end(), val);
        row = std::distance(d_vector.begin(), it);
        Ct(row, col) = 1;

        val = (k + 1) * 100 + (t - 1) * 10 + d;
        it= std::find(d_vector.begin(), d_vector.end(), val);
        row = std::distance(d_vector.begin(), it);
        Ct(row, col) = 1;

        col += 1;
    }

    // fixed final point at segment n_seg-1 in [ dF, dP ]'
    k = n_seg - 1;
    t = 1;
    d = 0;
    for(d = 0; d < d_order; d++){
        val = k * 100 + t * 10 + d;
        auto it = std::find(d_vector.begin(), d_vector.end(), val);
        row = std::distance(d_vector.begin(), it);
        Ct(row, col) = 1;
        col += 1;
    }

    // free variables at segment 0, 1, 2, n_seg-1 in [ dF, dP ]'
    k = 0;
    t = 1;
    d = 1;
    for(k = 0; k < n_seg - 1; k++){
        for(d = 1; d < d_order; d++){
            val = k * 100 + t * 10 + d;
            auto it = std::find(d_vector.begin(), d_vector.end(), val);
            row = std::distance(d_vector.begin(), it);
            Ct(row, col) = 1;

            val = (k + 1) * 100 + (t - 1) * 10 + d;
            it = std::find(d_vector.begin(), d_vector.end(), val);
            row = std::distance(d_vector.begin(), it);
            Ct(row, col) = 1;

            col += 1;
        }

    }
    return Ct;
}

MatrixXd TrajectoryGeneratorWaypoint::getM(int const n_seg, int const d_order, int const p_num1d, const Eigen::VectorXd &ts){
    /*
     * get Mapping Matrix
     * args:
     *      n_seg: the number of segments
     *      d_order: the deferential order: if minimal jerk. it is 3,
     *      p_num1d: the number of variables in each segment, if minimal jerk, it is 6
     *      ts: time allocation as a column vector, size: n_seg x 1,
     * return:
     *      M: a matrix, size: n_seg * p_num1d x n_seg * p_num1d
     */
//    MatrixXd M, M_temp, zeros;
    MatrixXd M = MatrixXd::Zero(n_seg * p_num1d, n_seg * p_num1d);
    MatrixXd coeff(d_order, p_num1d);
    if(d_order == 4){
        coeff << 1,  1,  1,  1,  1,  1,  1,  1,
                 0,  1,  2,  3,  4,  5,  6,  7,
                 0,  0,  2,  6,  12, 20, 30, 42,
                 0,  0,  0,  6,  24, 60, 120,210;
    }
    else if(d_order == 3){
        coeff << 1,  1,  1,  1,  1,  1,
                 0,  1,  2,  3,  4,  5,
                 0,  0,  2,  6,  12, 20;

    }
    else{
        cout << "This derivatieve order is not provided getM!!!" << endl;
    }


    double t;
    for(int k = 0; k < n_seg; k++){
        // calculate M_k of the k-th segment
        MatrixXd M_k = MatrixXd::Zero(p_num1d, p_num1d); // Matrix size: p_num1d x p_num1d
        // time of the k-th segment
        t = ts(k);
        for(int i = 0; i < d_order; i++){
            M_k(i, i) = coeff(i, i);
        }

        for(int i = 0; i < d_order; i++){
            for(int j = i; j < p_num1d; j++){
                if( i == j){
                    M_k(i+d_order, j) = coeff(i, j) ;
                }
                else{
                    M_k(i+d_order, j) = coeff(i, j) * pow(t, j - i);
                }
            }
        }




        M.block(k*p_num1d, k*p_num1d, p_num1d, p_num1d) = M_k;
    }
    return M;
}

Eigen::MatrixXd TrajectoryGeneratorWaypoint::getQ(int const n_seg, int const d_order, int const p_num1d, const Eigen::VectorXd &ts){
    /*
     * get Q matrix
     * args:
     *      n_seg: the number of segments
     *      d_order: the deferential order: if minimal snap. it is 4
     *      p_num1d: the number of variables in each segment
     *      ts: time allocation as a column vector, size: n_seg x 1,
     * return:
     *      Q: a matrix, size: n_seg * p_num1d x n_seg * p_num1d
     *      Note: p = [p0, p1, p2,...pn-1]'
     */

    MatrixXd Q = MatrixXd::Zero(n_seg * p_num1d, n_seg * p_num1d);
    for(int k = 0; k < n_seg; k++) {
        Eigen::MatrixXd Q_k = Eigen::MatrixXd::Zero(p_num1d, p_num1d); // Matrix size: p_num1d x p_num1d
        for (int i = 0; i < p_num1d; i++) {
            for (int j = 0; j < p_num1d; j++) {
                if (i < d_order || j < d_order)
                    continue;
                else
                    Q_k(i, j) = 1.0 * Factorial(i) / Factorial(i - d_order) * Factorial(j) /
                                    Factorial(j - d_order) /
                                    (i + j - d_order * 2 + 1) * pow(ts(k), i + j - 2 * d_order + 1);
            }

        }
        Q.block(k * p_num1d, k * p_num1d, p_num1d, p_num1d) = Q_k;
    }
    return Q;
}


/*

    STEP 2: Learn the "Closed-form solution to minimum snap" in L5, then finish this PolyQPGeneration function

    variable declaration: input       const int d_order,                    // the order of derivative
                                      const Eigen::MatrixXd &Path,          // waypoints coordinates (3d)
                                      const Eigen::MatrixXd &Vel,           // boundary velocity
                                      const Eigen::MatrixXd &Acc,           // boundary acceleration
                                      const Eigen::VectorXd &Time)          // time allocation in each segment
                          output      MatrixXd PolyCoeff(n_segment, 3 * p_num1d);   // position(x,y,z), so we need (3 * p_num1d) coefficients

*/

Eigen::MatrixXd TrajectoryGeneratorWaypoint::PolyQPGeneration(
            const int d_order,                    // the order of derivative
            const Eigen::MatrixXd &Path,          // waypoints coordinates (3d)
            const Eigen::MatrixXd &Vel,           // boundary velocity
            const Eigen::MatrixXd &Acc,           // boundary acceleration
            const Eigen::VectorXd &Time)          // time allocation in each segment
{
    // enforce initial and final velocity and acceleration, for higher order derivatives, just assume them be 0;
    int p_order   = 2 * d_order - 1;              // the order of polynomial
    int p_num1d   = p_order + 1;                  // the number of variables in each segment

    int n_segment = Time.size();                              // the number of segments
    MatrixXd PolyCoeff = MatrixXd::Zero(n_segment, 3 * p_num1d);           // position(x,y,z), so we need (3 * p_num1d) coefficients
    VectorXd Px(p_num1d * n_segment), Py(p_num1d * n_segment), Pz(p_num1d * n_segment);



    // get Q
    MatrixXd Q = getQ(n_segment, d_order,  p_num1d, Time);
    cout << "Matrix Q is:\n"<< endl << Q << endl;

    /* Produce Mapping Matrix  to the entire trajectory,
     * M is a mapping matrix that maps polynomial coefficients to derivatives.   */
    MatrixXd M = getM(n_segment, d_order,  p_num1d, Time);
    cout << "Mapping matrix M is:\n" << endl << M << endl;


    // compute Ct
    MatrixXd Ct = getCt(n_segment, d_order);
    cout <<"Ct: \n"<< endl << Ct << endl;

    MatrixXd C = Ct.transpose();
    cout << "C is:\n" << endl << C << endl;

    MatrixXd M_inv = M.inverse();
    MatrixXd M_inv_t = M_inv.transpose();

    cout << "M_inv is:" << endl << M_inv << endl;
    cout << "M_inv_transp is:" << endl << M_inv_t << endl;
    cout << "size of C is: " << C.rows() << ", " << C.cols() << endl;
    cout << "size of M_inv_t is: " << M_inv_t.rows()  << ", " <<  M_inv_t.cols() << endl;
    cout << "size of Q  is: " << Q.rows()  << ", " << Q.cols()  << endl;
    cout << "size of M_inv  is: " << M_inv.cols() << ", " << M_inv.rows() << endl;
    cout << "size of Ct  is: " << Ct.rows() << ", " << Ct.cols() << endl;

    MatrixXd R = C * M_inv_t * Q * M_inv * Ct; // M is not changed
    cout << "R is:\n" << endl << C << endl;

    int num_d_F = 2 * d_order + n_segment - 1;
    int num_d_P = (n_segment - 1) * (d_order - 1);

    MatrixXd R_pp = R.bottomRightCorner(num_d_P, num_d_P);
    cout << "R_pp is:\n" << endl << C << endl;

    MatrixXd R_fp = R.topRightCorner(num_d_F, num_d_P);
    cout << "R_fp is:\n" << endl << C << endl;



    // STEP 3: compute dF for x, y, z respectively
    for(int dim = 0; dim < 3; dim++){
        VectorXd wayPoints = Path.col(dim);
        cout << "waypoints: " << endl << wayPoints << endl;
        VectorXd d_F = VectorXd::Zero(num_d_F);

        d_F(0) = wayPoints(0); //p0
        // v0,0 a0,0 ... are 0

        // pT,0, pT,1, ,,PT,n_seg-2
        for(int i = 0; i < n_segment - 1; i++ ){
            d_F(d_order + i) = wayPoints(i + 1);
        }
        // pT,n_seg-1
        d_F(d_order + n_segment - 1) = wayPoints(n_segment);
        cout << "d_F is:" << endl << d_F << endl;

        VectorXd d_P = -1.0 * R_pp.inverse() * R_fp.transpose() * d_F;
        cout << "d_P is:" << endl << d_P << endl;

        VectorXd d_total(d_F.rows() + d_P.rows());
        d_total << d_F, d_P;
        cout << "d_total is:" << endl << d_total << endl;

        VectorXd poly_coef_1d = M.inverse() * Ct * d_total;
        cout<< "Dimension " << dim <<" coefficients: "<< endl << poly_coef_1d << endl;

        cout << "PolyCoeff.block(0, dim*p_num1d, n_segment, p_num1d) :" << endl
            << PolyCoeff.block(0, dim*p_num1d, n_segment, p_num1d) << endl;
        MatrixXd poly_coef_1d_t = poly_coef_1d.transpose();
        cout << "poly_coef_1d.transpose() :" << endl << poly_coef_1d_t << endl;
        // PolyCoeff(n_segment, 3 * p_num1d)
        for(int k = 0; k < n_segment; k++){
            PolyCoeff.block(k, dim*p_num1d, 1, p_num1d) = poly_coef_1d_t.block(0,k*p_num1d, 1, p_num1d);
        }

    }
    cout << "PolyCoeff :" << endl << PolyCoeff << endl;
    return PolyCoeff;
}

