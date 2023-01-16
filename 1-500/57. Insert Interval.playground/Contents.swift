class Solution {
    func insert(_ intervals: [[Int]], _ newInterval: [Int]) -> [[Int]] {
        var result = [[Int]]()
        let nLeft = newInterval[0], nRight = newInterval[1]
        var tmpL = -1, tmpR = -1
        var isOverlap = false

        for i in intervals {
            let start = i[0], end = i[1]
            if start <= nRight, end >= nLeft {
                if !isOverlap {
                    isOverlap = true
                    tmpL = min(start, nLeft)
                    tmpR = max(end, nRight)
                }

                tmpL = min(start, nLeft, tmpL)
                tmpR = max(end, nRight, tmpR)
            } else {
                if isOverlap {
                    result.append([tmpL, tmpR])
                    isOverlap = false
                }
                result.append(i)
            }
        }

        if isOverlap {
            result.append([tmpL, tmpR])
        } else if tmpL == -1 {
            result.append(newInterval)
            result.sort(by: { $0[0] < $1[0] })
        }
        return result
    }
}

let sol = Solution()
print(sol.insert([[1, 3], [6, 9]], [2, 5]))
print(sol.insert([], [2, 5]))
print(sol.insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8]))
