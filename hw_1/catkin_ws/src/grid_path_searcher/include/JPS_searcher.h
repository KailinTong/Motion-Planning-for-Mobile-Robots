#ifndef _JPS_SEARCHER_H_
#define _JPS_SEARCHER_H_

#include "Astar_searcher.h"
#include "JPS_utils.h"

class JPSPathFinder: public AstarPathFinder
{	
	private:
		bool isOccupied(const int & idx_x, const int & idx_y, const int & idx_z) const;
		bool isOccupied(const Eigen::Vector3i & index) const;
		bool isFree(const int & idx_x, const int & idx_y, const int & idx_z) const;
		bool isFree(const Eigen::Vector3i & index) const;
	public:
		JPS3DNeib * jn3d;

    	JPSPathFinder(){
    		jn3d = new JPS3DNeib();
    	};
    	
    	~JPSPathFinder(){
    		delete jn3d;
    	};
		void JPSGetSucc(GridNodePtr currentPtr, std::vector<GridNodePtr> & neighborPtrSets, std::vector<double> & edgeCostSets);
        bool hasForced(const Eigen::Vector3i & idx, const Eigen::Vector3i & dir);
        bool jump(const Eigen::Vector3i & curIdx, const Eigen::Vector3i & expDir, Eigen::Vector3i & neiIdx);
		
    	void JPSGraphSearch(Eigen::Vector3d start_pt, Eigen::Vector3d end_pt);
};

#endif