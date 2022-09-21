class Solution {
    func shortestPathBinaryMatrix(_ grid: [[Int]]) -> Int {
        let edge = grid.count
        if edge == 0 || grid[0][0] == 1 {
            return -1
        }
        if edge == 1 {
            return 1
        }
        var grid = grid
        let step: [(x: Int, y: Int)] = [(-1, -1), (-1, 0), (-1, 1), (0, -1), (0, 1), (1, -1), (1, 0), (1, 1)]
        var stack = [(x: 0, y: 0)]

        var count = 1
        while !stack.isEmpty {
            for _ in 0 ..< stack.count {
                let p = stack.removeFirst()
                for i in step {
                    let x = p.x + i.x
                    let y = p.y + i.y
                    if x >= 0, x < edge, y >= 0, y < edge {
                        if grid[x][y] == 0 {
                            if x == edge - 1, y == edge - 1 {
                                return count + 1
                            }
                            grid[x][y] = 1
                            stack.append((x, y))
                        }
                    }
                }
            }

            count += 1
        }
        return -1
    }
}

let sol = Solution()
print(sol.shortestPathBinaryMatrix([[0]]))
print(sol.shortestPathBinaryMatrix([[0, 1], [1, 0]]))
print(sol.shortestPathBinaryMatrix([[0, 0, 0], [1, 1, 0], [1, 1, 0]]))
print(sol.shortestPathBinaryMatrix([[1, 0, 0], [1, 1, 0], [1, 1, 0]]))
