class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        var tx = 0, ty = 0
        var width = matrix.count
        while width > 1 {
            for i in 0 ..< width - 1 {
                let p1 = matrix[tx + i][ty]
                let p2 = matrix[tx + width - 1][ty + i]
                let p3 = matrix[tx + width - 1 - i][ty + width - 1]
                let p4 = matrix[tx][ty + width - 1 - i]

                matrix[tx + i][ty] = p2
                matrix[tx + width - 1][ty + i] = p3
                matrix[tx + width - 1 - i][ty + width - 1] = p4
                matrix[tx][ty + width - 1 - i] = p1
            }

            tx += 1
            ty += 1
            width -= 2
        }
    }
}

class Solution2 { // Using another space
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        var tmp = Array(repeating: Array(repeating: 0, count: n), count: n)
        for i in 0 ..< n {
            for j in 0 ..< n {
                tmp[i][j] = matrix[n - j - 1][i]
            }
        }
        matrix = tmp
    }
}

var arr = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
let sol = Solution()
sol.rotate(&arr)

for i in arr {
    print(i)
}

arr = [[5, 1, 9, 11], [2, 4, 8, 10], [13, 3, 6, 7], [15, 14, 12, 16]]
sol.rotate(&arr)

for i in arr {
    print(i)
}
