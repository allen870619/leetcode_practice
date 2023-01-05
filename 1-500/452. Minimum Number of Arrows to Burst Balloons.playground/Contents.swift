/// 20230105
class Solution2 {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        let points = points.sorted(by: { $0[1] < $1[1] })
        var right = points[0][1]
        var result = 1

        for point in points[1...] {
            if point[0] > right {
                result += 1
                right = point[1]
            }
        }
        return result
    }
}

/// 20220113
class Solution {
    func findMinArrowShots(_ points: [[Int]]) -> Int {
        if points.isEmpty {
            return 0
        }
        var result = 0
        let points = points.sorted(by: { $0[0] < $1[0] })
        var left = points[0][0]
        var right = points[0][1]

        for point in points[1...] {
            if point[0] > right {
                result += 1
                right = point[1]
            } else if left <= point[1], right >= point[1] {
                right = point[1]
            }
            left = point[0]
        }
        result += 1
        return result
    }
}

let sol = Solution()
print(sol.findMinArrowShots([[10, 16], [2, 8], [1, 6], [7, 12]])) // 2
print(sol.findMinArrowShots([[1, 2], [3, 4], [5, 6], [7, 8]])) // 4
print(sol.findMinArrowShots([[1, 2], [2, 3], [3, 4], [4, 5]])) // 2
print(sol.findMinArrowShots([[3, 9], [7, 12], [3, 8], [6, 8], [9, 10], [2, 9], [0, 9], [3, 9], [0, 6], [2, 8]])) // 2
