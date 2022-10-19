class Solution {
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        var result = ""
        var value = Character("a"), count = 0

        for i in countAndSay(n - 1) {
            if i == value {
                count += 1
            } else {
                if count != 0 {
                    result += "\(count)\(value)"
                }
                value = i
                count = 1
            }
        }
        if count != 0 {
            result += "\(count)\(value)"
        }
        return result
    }
}

let sol = Solution()
print(sol.countAndSay(1))
print(sol.countAndSay(4))
print(sol.countAndSay(5))
