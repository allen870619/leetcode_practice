class Solution {
    func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
        var cup = Array(repeating: Array(repeating: 0.0, count: 101), count: 101)
        cup[0][0] = Double(poured)
        if query_row == 0 {
            return Double(min(1, poured))
        }
        for i in 1 ... query_row {
            for j in 0 ... query_glass {
                let remain = (cup[i - 1][j] - 1) / 2
                if remain > 0 {
                    cup[i][j] += remain
                    cup[i][j + 1] += remain
                }
            }
        }
        return min(cup[query_row][query_glass], 1)
    }
}

let sol = Solution()
print(sol.champagneTower(0, 0, 0))
print(sol.champagneTower(2, 1, 1))
print(sol.champagneTower(100_000_009, 33, 17))
