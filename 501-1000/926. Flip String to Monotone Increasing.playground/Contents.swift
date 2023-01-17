class Solution {
    func minFlipsMonoIncr(_ s: String) -> Int {
        var result = 0
        var one = 0

        for i in s {
            if i == "1" {
                one += 1
            } else {
                result += 1
            }
            result = min(result, one)
        }
        return result
    }
}

let sol = Solution()
print(sol.minFlipsMonoIncr("00110"))
print(sol.minFlipsMonoIncr("0101100011"))
