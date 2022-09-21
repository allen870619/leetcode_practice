class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var result = [[Int]]()
        for i in 0 ..< numRows {
            var tmp = [Int]()
            for j in 0 ..< i + 1 {
                if i < 2 || j == 0 || j == i {
                    tmp.append(1)
                } else {
                    tmp.append(result[i - 1][j - 1] + result[i - 1][j])
                }
            }
            result.append(tmp)
        }
        return result
    }
}

let sol = Solution()
print(sol.generate(5))
