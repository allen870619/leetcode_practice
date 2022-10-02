class Solution {
    func numRollsToTarget(_ n: Int, _ k: Int, _ target: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: target + 1), count: n + 1)
        dp[0][0] = 1
        for i in 1 ... n {
            for j in 1 ... k {
                if j > target {
                    break
                }
                for l in j ... target {
                    dp[i][l] += dp[i - 1][l - j]
                    dp[i][l] %= Int(1e9 + 7)
                }
            }
        }
        return dp[n][target]
    }
}
