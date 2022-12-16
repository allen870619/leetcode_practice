class Solution {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let cost = costs.sorted(by: {
            if abs($0[0] - $0[1]) == abs($1[0] - $1[1]) {
                return $0[0] + $0[1] > $1[0] - $1[1]
            } else {
                return abs($0[0] - $0[1]) > abs($1[0] - $1[1])
            }
        })

        var left = 0
        var right = 0
        let half = costs.count / 2
        var result = 0
        for i in cost {
            if left < half, right < half {
                if i[0] < i[1] {
                    result += i[0]
                    left += 1
                } else {
                    result += i[1]
                    right += 1
                }
            } else {
                if left < right {
                    result += i[0]
                    left += 1
                } else {
                    result += i[1]
                    right += 1
                }
            }
        }

        return result
    }
}

let sol = Solution()
print(sol.twoCitySchedCost([[10, 20], [30, 200], [400, 50], [30, 20]]))
print(sol.twoCitySchedCost([[259, 770], [448, 54], [926, 667], [184, 139], [840, 118], [577, 469]]))
print(sol.twoCitySchedCost([[515, 563], [451, 713], [537, 709], [343, 819], [855, 779], [457, 60], [650, 359], [631, 42]]))
