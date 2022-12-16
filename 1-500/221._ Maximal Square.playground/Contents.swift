class Solution {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        var reCal: [[Int]] = []
        var setList: [Set<Int>] = []
        for i in 0 ..< matrix.count {
            var tmp: [Int] = []
            var tmpSet: Set<Int> = []
            for j in 0 ..< matrix[i].count {
                let num = matrix[i][j].wholeNumberValue!
                if i == 0 {
                    tmp.append(num)
                    tmpSet.insert(num)
                } else {
                    if num == 0 {
                        tmp.append(0)
                        tmpSet.insert(0)
                    } else {
                        tmp.append(reCal[i - 1][j] + num)
                        tmpSet.insert(reCal[i - 1][j] + num)
                    }
                }
            }
            setList.append(tmpSet)
            reCal.append(tmp)
        }

        var result = 0
        for i in 0 ..< reCal.count {
            for j in setList[i].sorted() {
                var num = j
                var count = 0
                for k in reCal[i] {
                    if k >= num {
                        count += 1
                    } else {
                        count = 0
                    }
                    if count == num {
                        result = max(result, count * count)
                    }
                }
            }
        }
        return result
    }
}

class Solution2 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        let width = matrix[0].count
        var reCal: [[Int]] = Array(repeating: Array(repeating: 0, count: width + 1), count: matrix.count + 1)

        var result = 0
        for i in 1 ... matrix.count {
            for j in 1 ... width {
                if matrix[i - 1][j - 1] == "1" {
                    reCal[i][j] = min(min(reCal[i - 1][j], reCal[i][j - 1]), reCal[i - 1][j - 1]) + 1
                    result = max(result, reCal[i][j])
                }
            }
        }
        return result
    }
}

let sol = Solution2()
print(sol.maximalSquare([["1", "0", "1", "0", "0"], ["1", "0", "1", "1", "1"], ["1", "1", "1", "1", "1"], ["1", "0", "0", "1", "0"]]))
print(sol.maximalSquare([["0", "1"], ["1", "0"]]))
print(sol.maximalSquare([["0"]]))
print(sol.maximalSquare([["1", "0", "1", "0"], ["1", "0", "1", "1"], ["1", "0", "1", "1"], ["1", "1", "1", "1"]]))
print(sol.maximalSquare([["1", "0", "1", "0", "0"], ["1", "0", "1", "1", "1"], ["1", "1", "1", "1", "1"], ["1", "0", "0", "1", "0"]]))
