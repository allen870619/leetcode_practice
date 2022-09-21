class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = n
        var total = 0
        for _ in 0 ..< 32 {
            total <<= 1
            total += n % 2
            n >>= 1
        }
        return total
    }
}

let sol = Solution()
print(sol.reverseBits(4_294_967_293))
