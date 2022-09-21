/// 20220829 second try
class Solution2 {
    func numIslands(_ grid: [[Character]]) -> Int {
        var result = 0
        var grid = grid
        let width = grid.first?.count ?? 0
        let height = grid.count
        for h in 0 ..< height {
            for w in 0 ..< width {
                if grid[h][w] == "1" {
                    result += 1
                    // change land to 2
                    fillLand(h, w)
                }
            }
        }

        func fillLand(_ h: Int, _ w: Int) {
            if grid[h][w] == "1" {
                grid[h][w] = "2"
            }
            if w + 1 < width, grid[h][w + 1] == "1" {
                fillLand(h, w + 1)
            }
            if w - 1 >= 0, grid[h][w - 1] == "1" {
                fillLand(h, w - 1)
            }
            if h + 1 < height, grid[h + 1][w] == "1" {
                fillLand(h + 1, w)
            }
            if h - 1 >= 0, grid[h - 1][w] == "1" {
                fillLand(h - 1, w)
            }
        }
        return result
    }
}

/// 20211228
class Solution {
    func numIslands(_ agrid: [[Character]]) -> Int {
        var grid = agrid
        var total = 0

        for i in 0 ..< grid.count {
            for j in 0 ..< grid[i].count {
                if grid[i][j] == "1" {
                    total += 1
                    fill(j, i)
                }
            }
        }

        func fill(_ x: Int, _ y: Int) {
            if grid[y][x] == "1" {
                grid[y][x] = "2"
            }

            if x + 1 < grid[0].count, grid[y][x + 1] == "1" {
                fill(x + 1, y)
            }
            if x - 1 >= 0, grid[y][x - 1] == "1" {
                fill(x - 1, y)
            }
            if y - 1 >= 0, grid[y - 1][x] == "1" {
                fill(x, y - 1)
            }
            if y + 1 < grid.count, grid[y + 1][x] == "1" {
                fill(x, y + 1)
            }
        }
        return total
    }
}

let sol = Solution()
print(sol.numIslands([["1", "1", "1", "1", "0"],
                      ["1", "1", "0", "1", "0"],
                      ["1", "1", "0", "0", "0"],
                      ["0", "0", "0", "0", "0"]]))

print(sol.numIslands([["1", "1", "0", "0", "0"],
                      ["1", "1", "0", "0", "0"],
                      ["0", "0", "1", "0", "0"],
                      ["0", "0", "0", "1", "1"]]))

print(sol.numIslands([["1", "0", "1", "1", "1"],
                      ["1", "0", "1", "0", "1"],
                      ["1", "1", "1", "0", "1"]]))
