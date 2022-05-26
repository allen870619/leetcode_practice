// This is second round
class Solution {
    func hammingWeight(_ n: Int) -> Int {
        // n is decimal, not binary
        var total = 0
        var n = n
        while n > 0{
            total += n % 2
            n /= 2
        }
        return total
    }
}

let sol = Solution()
print(sol.hammingWeight(11))
