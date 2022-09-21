class Solution {
    func bitwiseComplement(_ n: Int) -> Int {
        var twoBase = 1
        var total = 1
        var ori = n
        while ori > 1 {
            ori /= 2
            total += twoBase * 2
            twoBase *= 2
        }
        return total - n
    }
}

let sol = Solution()
print(sol.bitwiseComplement(0))
print(sol.bitwiseComplement(1))
print(sol.bitwiseComplement(5))
print(sol.bitwiseComplement(7))
print(sol.bitwiseComplement(10))
