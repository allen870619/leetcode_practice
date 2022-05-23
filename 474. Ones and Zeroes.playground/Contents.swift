class Solution {
    func findMaxForm(_ strs: [String], _ m: Int, _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        for i in strs{
            var zero = i.filter{$0 == "0"}.count
            var one = i.filter{$0 == "1"}.count
            for i in stride(from: m, through: zero, by: -1){
                for j in stride(from: n, through: one, by: -1){
                    dp[i][j] = max(dp[i][j], dp[i-zero][j-one] + 1)
                }
            }
        }
        return dp[m][n]
    }
}

let sol = Solution()
print(sol.findMaxForm(["10","0001","111001","1","0"],5, 3))

