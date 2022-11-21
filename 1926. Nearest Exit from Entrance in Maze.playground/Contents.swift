class Solution {
    func nearestExit(_ maze: [[Character]], _ entrance: [Int]) -> Int {
        let maxY = maze.count, maxX = maze.first?.count ?? 0
        var list = [entrance]
        var ran = Array(repeating: Array(repeating: false, count: maxX), count: maxY)
        var count = 0

        func detectNode(_ node: [Int]) -> Bool {
            if node[0] == 0 || node[1] == 0 || node[0] == maxY - 1 || node[1] == maxX - 1, node != entrance {
                return true
            } else if !ran[node[0]][node[1]] {
                list.append(node)
                ran[node[0]][node[1]] = true
            }
            return false
        }

        while !list.isEmpty {
            count += 1
            for _ in 0 ..< list.count {
                let around = list.removeFirst()
                let ax = around[1], ay = around[0]

                if around[0] + 1 < maxY, maze[ay + 1][ax] == "." {
                    if detectNode([ay + 1, ax]) {
                        return count
                    }
                }
                if around[1] + 1 < maxX, maze[ay][ax + 1] == "." {
                    if detectNode([ay, ax + 1]) {
                        return count
                    }
                }
                if around[0] - 1 >= 0, maze[ay - 1][ax] == "." {
                    if detectNode([ay - 1, ax]) {
                        return count
                    }
                }
                if around[1] - 1 >= 0, maze[ay][ax - 1] == "." {
                    if detectNode([ay, ax - 1]) {
                        return count
                    }
                }
            }
        }
        return -1
    }
}
