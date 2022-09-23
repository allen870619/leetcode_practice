class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
        var result = 0
        var mod = 1000000007
        for i in 1...n {
            let s = String(i, radix: 2)
            result <<= s.count
            result += i
            result %= mod
        }
        return result
    }
}

let sol = Solution()
print(sol.concatenatedBinary(3))
print(sol.concatenatedBinary(12))
print(sol.concatenatedBinary(42))
print(sol.concatenatedBinary(59384))
