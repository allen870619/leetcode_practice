class Solution {
    func computeArea(_ ax1: Int, _ ay1: Int, _ ax2: Int, _ ay2: Int, _ bx1: Int, _ by1: Int, _ bx2: Int, _ by2: Int) -> Int {
        var dx = 0, dy = 0
        if ax1 < bx1 {
            dx = min(ax2 - bx1, bx2 - bx1)
            if dx < 0 {
                dx = 0
            }
        } else {
            dx = min(bx2 - ax1, ax2 - ax1)
            if dx < 0 {
                dx = 0
            }
        }

        if ay1 < by1 {
            dy = min(ay2 - by1, by2 - by1)
            if dy < 0 {
                dy = 0
            }
        } else {
            dy = min(by2 - ay1, ay2 - ay1)
            if dy < 0 {
                dy = 0
            }
        }
        return abs(ax2 - ax1) * abs(ay2 - ay1) + abs(bx2 - bx1) * abs(by2 - by1) - (dx * dy)
    }
}
