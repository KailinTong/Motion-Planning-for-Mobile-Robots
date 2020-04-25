#ifndef _JPS_UTILS_H_
#define _JPS_UTILS_H_

#include <iostream>
///Search and prune neighbors for JPS 3D
struct JPS3DNeib {
	// for each (dx,dy,dz) these contain:
	//    ns: neighbors that are always added
	//    f1: forced neighbors to check
	//    f2: neighbors to add if f1 is forced
	int ns[27][3][26];
	int f1[27][3][12];
	int f2[27][3][12];
	// nsz contains the number of neighbors for the four different types of moves:
	// no move (norm 0):        26 neighbors always added
	//                          0 forced neighbors to check (never happens)
	//                          0 neighbors to add if forced (never happens)
	// straight (norm 1):       1 neighbor always added
	//                          8 forced neighbors to check
	//                          8 neighbors to add if forced
	// diagonal (norm sqrt(2)): 3 neighbors always added
	//                          8 forced neighbors to check
	//                          12 neighbors to add if forced
	// diagonal (norm sqrt(3)): 7 neighbors always added
	//                          6 forced neighbors to check
	//                          12 neighbors to add if forced
	static constexpr int nsz[4][2] = {{26, 0}, {1, 8}, {3, 12}, {7, 12}};
	JPS3DNeib();
	private:
	void Neib(int dx, int dy, int dz, int norm1, int dev, int& tx, int& ty, int& tz);
	void FNeib( int dx, int dy, int dz, int norm1, int dev,
	    int& fx, int& fy, int& fz,
	    int& nx, int& ny, int& nz);
};

#endif