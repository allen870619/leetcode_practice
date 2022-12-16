class Solution {
    func scoreOfParentheses(_ s: String) -> Int {
        var level = 0
        var total = 0
        var lastC: Character?
        for i in s {
            if i == "(" {
                level += 1
            } else {
                level -= 1
                if lastC == "(" {
                    total += 1 << level
                }
            }
            lastC = i
        }
        return total
    }
}

let sol = Solution()
print(sol.scoreOfParentheses("()(()())"))
print(sol.scoreOfParentheses("(()(()))"))
