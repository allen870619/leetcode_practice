class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        let height = grid.count
        let width = grid[0].count
        var grid = grid
        var result = 0
        
        for i in 0..<height{
            for j in 0..<width{
                if grid[i][j] == 1{
                    result = max(result, findArea(i,j))
                }
            }
        }
        
        func findArea(_ i: Int, _ j: Int) -> Int{
            if i < 0 || i >= height || j < 0 || j >= width || grid[i][j] != 1{
                return 0
            }
            grid[i][j] = 2
            return 1 + findArea(i+1,j) + findArea(i-1,j) + findArea(i,j+1) + findArea(i,j-1)
        }
        return result
    }
}

let sol = Solution()
print(sol.maxAreaOfIsland([[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]))
