/**
 This is a stupid problems
 The slope must use `CLongDouble` not `Double`
 Garbage.
 */
class Solution {
    func minimumLines(_ stockPrices: [[Int]]) -> Int {
        if stockPrices.count <= 1 {
            return 0
        }
        let stockPrices = stockPrices.sorted { $0[0] < $1[0] }
        var result = 1
        var lastPoint = stockPrices[1]
        var slope = CLongDouble(lastPoint[1] - stockPrices[0][1]) / CLongDouble(lastPoint[0] - stockPrices[0][0])

        for i in stockPrices[2...] {
            let s = CLongDouble(i[1] - lastPoint[1]) / CLongDouble(i[0] - lastPoint[0])
            if s != slope {
                result += 1
                slope = s
            }
            lastPoint = i
        }
        return result
    }
}

let sol = Solution()
print(sol.minimumLines([[1, 7], [2, 6], [3, 5], [4, 4], [5, 4], [6, 3], [7, 2], [8, 1]]))
print(sol.minimumLines([[3, 4], [1, 2], [7, 8], [2, 3]]))
print(sol.minimumLines([[1, 1], [2, 2], [3, 3], [4, 5], [5, 7], [6, 6], [7, 5], [8, 4], [9, 4], [10, 4]]))
print(sol.minimumLines([[3, 4], [1, 2]]))
print(sol.minimumLines([[72, 98], [62, 27], [32, 7], [71, 4], [25, 19], [91, 30], [52, 73], [10, 9], [99, 71], [47, 22], [19, 30], [80, 63], [18, 15], [48, 17], [77, 16], [46, 27], [66, 87], [55, 84], [65, 38], [30, 9], [50, 42], [100, 60], [75, 73], [98, 53], [22, 80], [41, 61], [37, 47], [95, 8], [51, 81], [78, 79], [57, 95]]))
print(sol.minimumLines([[1, 1], [500_000_000, 499_999_999], [1_000_000_000, 999_999_998]]))
print(499_999_998 / 499_999_999)
print(499_999_999 / 500_000_000)
