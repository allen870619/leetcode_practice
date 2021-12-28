class Solution {
    func numIslands(_ agrid: [[Character]]) -> Int {
        var grid = agrid
        var total = 0
        
        for i in 0..<grid.count{
            for j in 0..<grid[i].count{
                if grid[i][j] == "1"{
                    total += 1
                    fill(j, i)
                }
            }
        }
        
        func fill(_ x: Int, _ y: Int){
            if grid[y][x] == "1"{
                grid[y][x] = "2"
            }
            
            if x + 1 < grid[0].count && grid[y][x + 1] == "1"{
                fill(x + 1, y)
            }
            if x - 1 >= 0 && grid[y][x - 1] == "1"{
                fill(x - 1, y)
            }
            if y - 1 >= 0 && grid[y - 1][x] == "1"{
                fill(x, y - 1)
            }
            if y + 1 < grid.count && grid[y + 1][x] == "1"{
                fill(x, y + 1)
            }
        }
        return total
    }
}

let sol = Solution()
print(sol.numIslands([["1","1","1","1","0"],
                      ["1","1","0","1","0"],
                      ["1","1","0","0","0"],
                      ["0","0","0","0","0"]]))

print(sol.numIslands([["1","1","0","0","0"],
                      ["1","1","0","0","0"],
                      ["0","0","1","0","0"],
                      ["0","0","0","1","1"]]))

print(sol.numIslands([["1","0","1","1","1"],
                      ["1","0","1","0","1"],
                      ["1","1","1","0","1"]]))
