from racetracks import *


class Node:
    def __init__(self, px, py, vx, vy):
        # state
        self.px = px
        self.py = py
        self.vx = vx
        self.vy = vy
        # value
        self.g_value = 0.0
        # successor
        self.next_prob_9 = []
        self.next_prob_1 = []
        # key
        self.key = self.get_key()
        self.is_goal = False

    @staticmethod
    def generate_key(px, py, vx, vy):
        return "%02d" % px + "%02d" % py + "%02d" % vx + "%02d" % vy


    def get_key(self):
        return self.generate_key(self.px, self.py, self.vx, self.vy)


    def connect_to_graph(self, grid):
        for u in ACTION_SPACE:
            self.next_prob_9.append(self.control(u[0], u[1], grid, success=True))
            self.next_prob_1.append(self.control(u[0], u[1], grid, success=False))


    @staticmethod
    def velocity_constraints(vx, vy):
        return np.sign(vx) * min(abs(vx), 4), np.sign(vy) * min(abs(vy), 4)

    def safety_constraints(self, px2, py2, grid):
        assert  0 <= self.px < grid.shape[0]
        assert  0 <= self.py < grid.shape[1]

        x_dist = np.abs(px2 - self.px)
        y_dist = np.abs(py2 - self.py)
        step = max(x_dist, y_dist)
        x_way_points = np.linspace(self.px, px2, step + 1, endpoint=True)
        y_way_points = np.linspace(self.py, py2, step + 1, endpoint=True)
        way_points = np.stack([np.ceil(x_way_points), np.ceil(y_way_points)], axis=1).astype(np.int)

        for idx in range(way_points.shape[0]):
            point = way_points[idx]
            if (0 <= point[0] < grid.shape[0]) and (0 <= point[1] < grid.shape[1]):
                if grid[point[0], point[1]] == FINISH:
                    return FINISH, point
                elif grid[point[0], point[1]] == OCCUPIED:
                    return OCCUPIED, point
                # else:
                #  free and start: continue
            else:
                return OUTBOUND, point

        if grid[way_points[-1][0], way_points[-1][1]] == START:
            return START, way_points[-1]
        else:
            return FREE, way_points[-1]
    # end definition


    def control(self, ux, uy, grid, success):
        assert ux in action_assert_list
        assert uy in action_assert_list

        # success with probability of 0.9
        if not success:
            ux = 0
            uy = 0

        # dynamic model
        vx = self.vx + ux
        vy = self.vy + uy
        vx, vy = self.velocity_constraints(vx, vy)
        px = self.px + vx
        py = self.py + vy

        # check collision
        status, point = self.safety_constraints(px, py, grid)
        if status == FREE:
            assert px == point[0] and py == point[1]
            return self.generate_key(px, py, vx, vy)
        elif status == START:
            assert grid[point[0], point[1]] == START
            assert px == point[0] and py == point[1]
            return self.generate_key(point[0], point[1], 0, 0)
        elif status == FINISH:
            assert grid[point[0], point[1]] == FINISH
            return self.generate_key(point[0], point[1], 0, 0)
        else: # out of bound or occupied
            assert status == OUTBOUND or status == OCCUPIED
            rand_start = START_LINE[np.random.randint(low=0, high=3, size=1)[0]]
            return self.generate_key(rand_start[0], rand_start[1], 0, 0)