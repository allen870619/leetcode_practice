class Solution {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        let intervals = intervals.sorted(by: { $0[0] < $1[0] })
        var (pMin, pMax) = (intervals[0][0], intervals[0][1])

        var result: [[Int]] = []
        var count = 1
        while count < intervals.count {
            if intervals[count][0] > pMax || intervals[count][1] < pMin { // 超出範圍
                result.append([pMin, pMax])
                pMin = intervals[count][0]
                pMax = intervals[count][1]
            } else {
                pMin = min(pMin, intervals[count][0])
                pMax = max(pMax, intervals[count][1])
            }
            count += 1
        }
        result.append([pMin, pMax])
        return result
    }
}

let sol = Solution()
print(sol.merge([[1, 3], [2, 6], [8, 10], [15, 18]]))
print(sol.merge([[1, 4], [4, 5]]))
print(sol.merge([[1, 4], [0, 5]]))
print(sol.merge([[2, 3], [4, 5], [6, 7], [8, 9], [1, 10]]))
