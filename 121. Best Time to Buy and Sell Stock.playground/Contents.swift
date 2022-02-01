class Solution {
    func maxProfit(_ prices: [Int]) -> Int {
        var last = prices[0]
        var profit = 0
        for i in prices[1...]{
            if i < last{
                last = i
            }else{
                profit = max(profit, i - last)
            }
        }
        return profit
    }
}

class Solution2 {
    func maxProfit(_ prices: [Int]) -> Int {
        var minVal = prices[0]
        var profit = 0
        for i in prices{
            profit = max(profit, i - minVal)
            minVal = min(minVal, i)
        }
        return profit
    }
}

let sol = Solution()
print(sol.maxProfit([7,1,5,3,6,4]))
print(sol.maxProfit([7,6,4,3,1]))
