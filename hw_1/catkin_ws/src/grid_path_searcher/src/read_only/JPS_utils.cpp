#include "JPS_utils.h"

constexpr int JPS3DNeib::nsz[4][2];
JPS3DNeib::JPS3DNeib() 
{
    int id = 0;
    for(int dz = -1; dz <= 1; ++ dz) {
        for(int dy = -1; dy <= 1; ++ dy) {
            for(int dx = -1; dx <= 1; ++ dx) {
                int norm1 = abs(dx) + abs(dy) + abs(dz);
            
                for(int dev = 0; dev < nsz[norm1][0]; ++ dev)
                    Neib(dx,dy,dz,norm1,dev, ns[id][0][dev], ns[id][1][dev], ns[id][2][dev]);
            
                for(int dev = 0; dev < nsz[norm1][1]; ++ dev){
                    FNeib(dx,dy,dz,norm1,dev,
                    f1[id][0][dev],f1[id][1][dev], f1[id][2][dev],
                    f2[id][0][dev],f2[id][1][dev], f2[id][2][dev]);
                }
                
                id ++;
            }
        }
    }
}


void JPS3DNeib::Neib(int dx, int dy, int dz, int norm1, int dev,
    int& tx, int& ty, int& tz)
{
    switch(norm1){
        case 0:
            switch(dev){
                case 0:  tx=1;  ty=0;  tz=0;  return;
                case 1:  tx=-1; ty=0;  tz=0;  return;
                case 2:  tx=0;  ty=1;  tz=0;  return;
                case 3:  tx=1;  ty=1;  tz=0;  return;
                case 4:  tx=-1; ty=1;  tz=0;  return;
                case 5:  tx=0;  ty=-1; tz=0;  return;
                case 6:  tx=1;  ty=-1; tz=0;  return;
                case 7:  tx=-1; ty=-1; tz=0;  return;
                case 8:  tx=0;  ty=0;  tz=1;  return;
                case 9:  tx=1;  ty=0;  tz=1;  return;
                case 10: tx=-1; ty=0;  tz=1;  return;
                case 11: tx=0;  ty=1;  tz=1;  return;
                case 12: tx=1;  ty=1;  tz=1;  return;
                case 13: tx=-1; ty=1;  tz=1;  return;
                case 14: tx=0;  ty=-1; tz=1;  return;
                case 15: tx=1;  ty=-1; tz=1;  return;
                case 16: tx=-1; ty=-1; tz=1;  return;
                case 17: tx=0;  ty=0;  tz=-1; return;
                case 18: tx=1;  ty=0;  tz=-1; return;
                case 19: tx=-1; ty=0;  tz=-1; return;
                case 20: tx=0;  ty=1;  tz=-1; return;
                case 21: tx=1;  ty=1;  tz=-1; return;
                case 22: tx=-1; ty=1;  tz=-1; return;
                case 23: tx=0;  ty=-1; tz=-1; return;
                case 24: tx=1;  ty=-1; tz=-1; return;
                case 25: tx=-1; ty=-1; tz=-1; return;
            }
        case 1:
            tx = dx; ty = dy; tz = dz; return;
        case 2:
            switch(dev){
                case 0:
                    if(dz == 0){
                        tx = 0; ty = dy; tz = 0; return;
                    }else{
                        tx = 0; ty = 0; tz = dz; return;
                    }
                case 1:
                    if(dx == 0){
                        tx = 0; ty = dy; tz = 0; return;
                    }else{
                        tx = dx; ty = 0; tz = 0; return;
                    }
                case 2:
                    tx = dx; ty = dy; tz = dz; return;
            }
        case 3:
            switch(dev){
                case 0: tx = dx; ty =  0; tz =  0; return;
                case 1: tx =  0; ty = dy; tz =  0; return;
                case 2: tx =  0; ty =  0; tz = dz; return;
                case 3: tx = dx; ty = dy; tz =  0; return;
                case 4: tx = dx; ty =  0; tz = dz; return;
                case 5: tx =  0; ty = dy; tz = dz; return;
                case 6: tx = dx; ty = dy; tz = dz; return;
            }
    }
}

void JPS3DNeib::FNeib( int dx, int dy, int dz, int norm1, int dev,
                          int& fx, int& fy, int& fz,
                          int& nx, int& ny, int& nz)
{
    switch(norm1){
        case 1:
            switch(dev){
                case 0: fx= 0; fy= 1; fz = 0; break;
                case 1: fx= 0; fy=-1; fz = 0; break;
                case 2: fx= 1; fy= 0; fz = 0; break;
                case 3: fx= 1; fy= 1; fz = 0; break;
                case 4: fx= 1; fy=-1; fz = 0; break;
                case 5: fx=-1; fy= 0; fz = 0; break;
                case 6: fx=-1; fy= 1; fz = 0; break;
                case 7: fx=-1; fy=-1; fz = 0; break;
            }
            nx = fx; ny = fy; nz = dz;
            // switch order if different direction
            if(dx != 0){
                fz = fx; fx = 0;
                nz = fz; nx = dx;
            }

            if(dy != 0){
                fz = fy; fy = 0;
                nz = fz; ny = dy;
            }
            return;
        case 2:
            if(dx == 0){
                switch(dev){
                    case 0:
                        fx = 0; fy = 0; fz = -dz;
                        nx = 0; ny = dy; nz = -dz;
                        return;
                    case 1:
                        fx = 0; fy = -dy; fz = 0;
                        nx = 0; ny = -dy; nz = dz;
                        return;
                    case 2:
                        fx = 1; fy = 0; fz = 0;
                        nx = 1; ny = dy; nz = dz;
                        return;
                    case 3:
                        fx = -1; fy = 0; fz = 0;
                        nx = -1; ny = dy; nz = dz;
                        return;
                    case 4:
                        fx = 1; fy = 0; fz = -dz;
                        nx = 1; ny = dy; nz = -dz;
                        return;
                    case 5:
                        fx = 1; fy = -dy; fz = 0;
                        nx = 1; ny = -dy; nz = dz;
                        return;
                    case 6:
                        fx = -1; fy = 0; fz = -dz;
                        nx = -1; ny = dy; nz = -dz;
                        return;
                    case 7:
                        fx = -1; fy = -dy; fz = 0;
                        nx = -1; ny = -dy; nz = dz;
                        return;
                    // Extras
                    case 8:
                        fx = 1; fy = 0; fz = 0;
                        nx = 1; ny = dy; nz = 0;
                        return;
                    case 9:
                        fx = 1; fy = 0; fz = 0;
                        nx = 1; ny = 0; nz = dz;
                        return;
                    case 10:
                        fx = -1; fy = 0; fz = 0;
                        nx = -1; ny = dy; nz = 0;
                        return;
                    case 11:
                        fx = -1; fy = 0; fz = 0;
                        nx = -1; ny = 0; nz = dz;
                        return;
                }
            }
            else if(dy == 0){
                switch(dev){
                    case 0:
                        fx = 0; fy = 0; fz = -dz;
                        nx = dx; ny = 0; nz = -dz;
                        return;
                    case 1:
                        fx = -dx; fy = 0; fz = 0;
                        nx = -dx; ny = 0; nz = dz;
                        return;
                    case 2:
                        fx = 0; fy = 1; fz = 0;
                        nx = dx; ny = 1; nz = dz;
                        return;
                    case 3:
                        fx = 0; fy = -1; fz = 0;
                        nx = dx; ny = -1;nz = dz;
                        return;
                    case 4:
                        fx = 0; fy = 1; fz = -dz;
                        nx = dx; ny = 1; nz = -dz;
                        return;
                    case 5:
                        fx = -dx; fy = 1; fz = 0;
                        nx = -dx; ny = 1; nz = dz;
                        return;
                    case 6:
                        fx = 0; fy = -1; fz = -dz;
                        nx = dx; ny = -1; nz = -dz;
                        return;
                    case 7:
                        fx = -dx; fy = -1; fz = 0;
                        nx = -dx; ny = -1; nz = dz;
                        return;
                    // Extras
                    case 8:
                        fx = 0; fy = 1; fz = 0;
                        nx = dx; ny = 1; nz = 0;
                        return;
                    case 9:
                        fx = 0; fy = 1; fz = 0;
                        nx = 0; ny = 1; nz = dz;
                        return;
                    case 10:
                        fx = 0; fy = -1; fz = 0;
                        nx = dx; ny = -1; nz = 0;
                        return;
                    case 11:
                        fx = 0; fy = -1; fz = 0;
                        nx = 0; ny = -1; nz = dz;
                        return;
                }
            }
            else{// dz==0
                switch(dev){
                    case 0:
                        fx = 0; fy = -dy; fz = 0;
                        nx = dx; ny = -dy; nz = 0;
                        return;
                    case 1:
                        fx = -dx; fy = 0; fz = 0;
                        nx = -dx; ny = dy; nz = 0;
                        return;
                    case 2:
                        fx =  0; fy = 0; fz = 1;
                        nx = dx; ny = dy; nz = 1;
                        return;
                    case 3:
                        fx =  0; fy = 0; fz = -1;
                        nx = dx; ny = dy; nz = -1;
                        return;
                    case 4:
                        fx = 0; fy = -dy; fz = 1;
                        nx = dx; ny = -dy; nz = 1;
                        return;
                    case 5:
                        fx = -dx; fy = 0; fz = 1;
                        nx = -dx; ny = dy; nz = 1;
                        return;
                    case 6:
                        fx = 0; fy = -dy; fz = -1;
                        nx = dx; ny = -dy; nz = -1;
                        return;
                    case 7:
                        fx = -dx; fy = 0; fz = -1;
                        nx = -dx; ny = dy; nz = -1;
                        return;
                    // Extras
                    case 8:
                        fx =  0; fy = 0; fz = 1;
                        nx = dx; ny = 0; nz = 1;
                        return;
                    case 9:
                        fx = 0; fy = 0; fz = 1;
                        nx = 0; ny = dy; nz = 1;
                        return;
                    case 10:
                        fx =  0; fy = 0; fz = -1;
                        nx = dx; ny = 0; nz = -1;
                        return;
                    case 11:
                        fx = 0; fy = 0; fz = -1;
                        nx = 0; ny = dy; nz = -1;
                        return;
                }
            }
        case 3:
            switch(dev){
                case 0:
                    fx = -dx; fy = 0; fz = 0;
                    nx = -dx; ny = dy; nz = dz;
                    return;
                case 1:
                    fx = 0; fy = -dy; fz = 0;
                    nx = dx; ny = -dy; nz = dz;
                    return;
                case 2:
                    fx = 0; fy = 0; fz = -dz;
                    nx = dx; ny = dy; nz = -dz;
                    return;
                // Need to check up to here for forced!
                case 3:
                    fx = 0; fy = -dy; fz = -dz;
                    nx = dx; ny = -dy; nz = -dz;
                    return;
                case 4:
                    fx = -dx; fy = 0; fz = -dz;
                    nx = -dx; ny = dy; nz = -dz;
                    return;
                case 5:
                    fx = -dx; fy = -dy; fz = 0;
                    nx = -dx; ny = -dy; nz = dz;
                    return;
                // Extras
                case 6:
                    fx = -dx; fy = 0; fz = 0;
                    nx = -dx; ny = 0; nz = dz;
                    return;
                case 7:
                    fx = -dx; fy = 0; fz = 0;
                    nx = -dx; ny = dy; nz = 0;
                    return;
                case 8:
                    fx = 0; fy = -dy; fz = 0;
                    nx = 0; ny = -dy; nz = dz;
                    return;
                case 9:
                    fx = 0; fy = -dy; fz = 0;
                    nx = dx; ny = -dy; nz = 0;
                    return;
                case 10:
                    fx = 0; fy = 0; fz = -dz;
                    nx = 0; ny = dy; nz = -dz;
                    return;
                case 11:
                    fx = 0; fy = 0; fz = -dz;
                    nx = dx; ny = 0; nz = -dz;
                    return;
            }
    }
}