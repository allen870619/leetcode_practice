class Solution {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let step = [(1,0),(0,1)]
        let w = obstacleGrid[0].count ?? 0
        let h = obstacleGrid.count ?? 0
        var dict = Array(repeating: Array(repeating: 0, count: w), count: h)
        if obstacleGrid[0][0] == 1{
            return 0
        }
        
        func dfs(y: Int, x: Int) -> Int{
            if y == h-1 && x == w-1{
                dict[y][x] = 1
                return 1
            }
            var totalStep = 0
            for i in step{
                let newY = y + i.0
                let newX = x + i.1
                if newY < h && newY >= 0 && newX < w && newX >= 0 {
                    if obstacleGrid[newY][newX] == 0{
                        print(dict)
                        if dict[newY][newX] > 0{
                            totalStep += dict[newY][newX]
                        }else{
                            totalStep += dfs(y: newY, x: newX)
                        }
                    }
                }
            }
            dict[y][x] = totalStep
            return totalStep
        }
        
        return dfs(y: 0, x: 0)
        
    }
}

class Solution2 { // Sol 1 optimized
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let w = obstacleGrid[0].count ?? 0
        let h = obstacleGrid.count ?? 0
        var dict = Array(repeating: Array(repeating: 0, count: w), count: h)
        
        func dfs(y: Int, x: Int) -> Int{
            if y == h || x == w || obstacleGrid[y][x] == 1{
                return 0
            }
            if dict[y][x] > 0{
                return dict[y][x]
            }
            if y == h-1 && x == w-1{
                dict[y][x] = 1
                return 1
            }
            dict[y][x] = dfs(y: y+1, x: x) + dfs(y: y, x: x+1)
            return dict[y][x]
        }
        return dfs(y: 0, x: 0)
    }
}

let sol = Solution2()
print(sol.uniquePathsWithObstacles([[0,0,0],[0,1,0],[0,0,0]]))
print(sol.uniquePathsWithObstacles([[0,1],[0,0]]))
print(sol.uniquePathsWithObstacles([[1]]))
print(sol.uniquePathsWithObstacles([[0,1]]))
