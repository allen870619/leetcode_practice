class Solution {
    func numEnclaves(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count, n = grid.first?.count ?? 0
        var result = 0
        var boundary = false

        for i in 0 ..< m {
            for j in 0 ..< n {
                if grid[i][j] == 1 {
                    let count = findMax(i: i, j: j)
                    if !boundary {
                        result += count
                    }
                    boundary = false
                }
            }
        }

        func findMax(i: Int, j: Int) -> Int {
            if i < 0 || j < 0 || i >= m || j >= n || grid[i][j] == 0 {
                return 0
            }

            if i == 0 || j == 0 || i == m - 1 || j == n - 1 {
                boundary = true
            }

            grid[i][j] = 0
            return 1 + findMax(i: i + 1, j: j) + findMax(i: i, j: j + 1) + findMax(i: i - 1, j: j) + findMax(i: i, j: j - 1)
        }
        return result
    }
}

let sol = Solution()
print(sol.numEnclaves([[0, 0, 0, 0], [1, 0, 1, 0], [0, 1, 1, 0], [0, 0, 0, 0]]))
print(sol.numEnclaves([[0, 1, 1, 0], [0, 0, 1, 0], [0, 0, 1, 0], [0, 0, 0, 0]]))
print(sol.numEnclaves([[0, 0, 0, 1, 1, 1, 0, 1, 0, 0],
                       [1, 1, 0, 0, 0, 1, 0, 1, 1, 1],
                       [0, 0, 0, 1, 1, 1, 0, 1, 0, 0],
                       [0, 1, 1, 0, 0, 0, 1, 0, 1, 0],
                       [0, 1, 1, 1, 1, 1, 0, 0, 1, 0],
                       [0, 0, 1, 0, 1, 1, 1, 1, 0, 1],
                       [0, 1, 1, 0, 0, 0, 1, 1, 1, 1],
                       [0, 0, 1, 0, 0, 1, 0, 1, 0, 1],
                       [1, 0, 1, 0, 1, 1, 0, 0, 0, 0],
                       [0, 0, 0, 0, 1, 1, 0, 0, 0, 1]]))
