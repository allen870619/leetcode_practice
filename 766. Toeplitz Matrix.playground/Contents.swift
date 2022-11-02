class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        var x = 0, y = matrix.count - 1
        let maxX = matrix.first?.count ?? 0
        while x < maxX, y >= 0 {
            if !checkTopelitz(y, x) {
                return false
            }

            if x < maxX - 1 {
                x += 1
            } else {
                y -= 1
            }
        }

        func checkTopelitz(_ y: Int, _ x: Int) -> Bool {
            var x = x, y = y
            let target = matrix[y][x]
            while x >= 0, y >= 0 {
                if matrix[y][x] != target {
                    return false
                }
                x -= 1
                y -= 1
            }
            return true
        }
        return true
    }
}

let sol = Solution()
print(sol.isToeplitzMatrix([[1, 2, 3, 4], [5, 1, 2, 3], [9, 5, 1, 2]]))
print(sol.isToeplitzMatrix([[1, 2], [2, 2]]))
