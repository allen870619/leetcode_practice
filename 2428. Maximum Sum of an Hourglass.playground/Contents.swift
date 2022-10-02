class Solution {
    func maxSum(_ grid: [[Int]]) -> Int {
        var result = 0
        func calHour(_ startX: Int, _ startY: Int) -> Int {
            var result = 0
            result += grid[startY][startX]
            result += grid[startY][startX + 1]
            result += grid[startY][startX + 2]
            result += grid[startY + 1][startX + 1]
            result += grid[startY + 2][startX]
            result += grid[startY + 2][startX + 1]
            result += grid[startY + 2][startX + 2]
            return result
        }

        for y in 0 ..< grid.count - 2 {
            for x in 0 ..< (grid.first?.count ?? 0) - 2 {
                result = max(result, calHour(x, y))
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.maxSum([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
print(sol.maxSum([[6, 2, 1, 3], [4, 2, 1, 5], [9, 2, 8, 7], [4, 1, 2, 9]]))
