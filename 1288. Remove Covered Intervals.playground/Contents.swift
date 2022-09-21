class Solution {
    func removeCoveredIntervals(_ intervals: [[Int]]) -> Int {
        var arr = intervals.sorted { $0[0] == $1[0] ? $0[1] > $1[1] : $0[0] < $1[0] }

        var index = 0
        while index < arr.count - 1 {
            if arr[index][1] >= arr[index + 1][1] {
                arr.remove(at: index + 1)
            } else {
                index += 1
            }
        }
        return arr.count
    }
}

let sol = Solution()
print(sol.removeCoveredIntervals([[1, 4], [3, 6], [2, 8]]))
print(sol.removeCoveredIntervals([[3, 10], [4, 10], [5, 11]]))
print(sol.removeCoveredIntervals([[1, 2], [1, 4], [3, 4]]))
