#ifndef _TRAJECTORY_GENERATOR_WAYPOINT_H_
#define _TRAJECTORY_GENERATOR_WAYPOINT_H_

//#include <Eigen/Eigen>
#include <eigen3/Eigen/Eigen>
#include <vector>

class TrajectoryGeneratorWaypoint {
    private:
		double _qp_cost{};
		Eigen::MatrixXd _Q;
		Eigen::VectorXd _Px, _Py, _Pz;
    public:
        TrajectoryGeneratorWaypoint();

        ~TrajectoryGeneratorWaypoint();

        Eigen::MatrixXd PolyQPGeneration(
            int order,
            const Eigen::MatrixXd &Path,
            const Eigen::MatrixXd &Vel,
            const Eigen::MatrixXd &Acc,
            const Eigen::VectorXd &Time);
        
        static int Factorial(int x);
        Eigen::MatrixXd getCt(int n_seg, int d_order);
        Eigen::MatrixXd getM(int n_seg, int  d_order, int p_num1d, const Eigen::VectorXd &ts);
        Eigen::MatrixXd getQ(int n_seg, int  d_order,  int p_num1d, const Eigen::VectorXd &ts);

};
        

#endif
