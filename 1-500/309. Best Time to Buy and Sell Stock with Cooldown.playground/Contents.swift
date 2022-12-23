class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var buy = 0, sell = 0, cooldown = 0
        buy = -prices[0]

        for p in prices[1...] {
            let tb = buy, ts = sell, tc = cooldown
            sell = max(ts, tb + p)
            buy = max(tb, tc - p)
            cooldown = max(tc, ts)
        }
        return max(sell, buy, cooldown)
    }
}

let sol = Solution()
print(sol.maxProfit([1, 2, 3, 0, 2]))
print(sol.maxProfit([1]))
print(sol.maxProfit([2, 4, 6, 1, 2, 8, 2, 6, 8, 2, 10]))
