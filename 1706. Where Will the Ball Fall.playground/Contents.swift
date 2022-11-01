/// 20221101 second
class Solution2 {
    func findBall(_ grid: [[Int]]) -> [Int] {
        let maxX = grid.first?.count ?? 0
        let maxY = grid.count
        var saved: [[Int?]] = Array(repeating: Array(repeating: nil, count: maxX), count: maxY)
        var result = Array(repeating: -1, count: maxX)
        
        func findRoute(_ y: Int, _ x: Int) -> Int {
            if y >= maxY {
                return x
            }
            if let out = saved[y][x] {
                return out
            }
            
            if grid[y][x] == 1 && x + 1  < maxX && grid[y][x+1] == 1{
                saved[y][x] = findRoute(y+1, x+1)
            }
            if grid[y][x] == -1 && x-1 >= 0 && grid[y][x-1] == -1{
                saved[y][x] = findRoute(y+1, x-1)
            }
            
            if saved[y][x] == nil {
                saved[y][x] = -1
            }
            return saved[y][x]!
        }
        
        for i in 0..<maxX {
            result[i] = findRoute(0, i)
        }
        return result
    }
}


/// first
class Solution {
    func findBall(_ grid: [[Int]]) -> [Int] {
        let maxX = grid.first?.count ?? 0
        let maxY = grid.count
        var save = Array(repeating: Array(repeating: -2, count: maxX), count: maxY)
        
        func findRoute(_ y: Int, _ x: Int) -> Int {
            if y >= maxY {
                return x
            }
            if save[y][x] != -2 {
                return save[y][x]
            }
            
            if grid[y][x] == 1 {
                if x + 1 < maxX, grid[y][x + 1] == 1 {
                    save[y][x] = findRoute(y + 1, x + 1)
                } else {
                    save[y][x] = -1
                }
            } else {
                if x - 1 >= 0, grid[y][x - 1] == -1 {
                    save[y][x] = findRoute(y + 1, x - 1)
                } else {
                    save[y][x] = -1
                }
            }
            return save[y][x]
        }
        
        var result = [Int]()
        for i in 0 ..< maxX {
            result.append(findRoute(0, i))
        }
        return result
    }
}

let sol = Solution()
print(sol.findBall([[1, 1, 1, -1, -1], [1, 1, 1, -1, -1], [-1, -1, -1, 1, 1], [1, 1, 1, 1, -1], [-1, -1, -1, -1, -1]]))
print(sol.findBall([[-1]]))
print(sol.findBall([[1, 1, 1, 1, 1, 1], [-1, -1, -1, -1, -1, -1], [1, 1, 1, 1, 1, 1], [-1, -1, -1, -1, -1, -1]]))
