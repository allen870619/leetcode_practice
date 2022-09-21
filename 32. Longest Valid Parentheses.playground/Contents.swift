class Solution {
    func longestValidParentheses(_ s: String) -> Int {
        let s = [Character](s)
        if s.count == 0 {
            return 0
        }
        var result = 0
        var dp = Array(repeating: 0, count: s.count)

        for (i, c) in s.enumerated() {
            if i > 0 {
                if c == ")" {
                    let shift = i - dp[i - 1] - 1
                    if s[i - 1] == "(" {
                        dp[i] = (i >= 2 ? dp[i - 2] : 0) + 2
                    } else if shift >= 0, s[shift] == "(" {
                        dp[i] = dp[i - 1] + (shift - 1 >= 0 ? dp[shift - 1] : 0) + 2
                    }
                    result = max(result, dp[i])
                }
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.longestValidParentheses("())((())"))
print(sol.longestValidParentheses(")()())"))
print(sol.longestValidParentheses("(()"))
print(sol.longestValidParentheses(""))
print(sol.longestValidParentheses("()(()"))
print(sol.longestValidParentheses("()(())"))
print(sol.longestValidParentheses("(()())"))
print(sol.longestValidParentheses(")(((((()())()()))()(()))("))
