class Solution {
    func numDecodings(_ s: String) -> Int {
        let s = [Character](s)
        var dp = Array(repeating: 0, count: s.count+1)
        dp[0] = 1
        for i in 1...s.count {
            dp[i] = s[i-1] == "0" ? 0 : dp[i-1]
            if i > 1 && (s[i-2] == "1" || (s[i-2] == "2" && Int("\(s[i-1])")! <= 6 )) {
                dp[i] += dp[i-2]
            }
        }
        return Int(exactly: dp.last!)!
    }
}

let sol = Solution()
print(sol.numDecodings("226"))
