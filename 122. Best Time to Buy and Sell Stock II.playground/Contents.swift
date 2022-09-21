func maxProfit(_ prices: [Int]) -> Int {
    if prices.count == 1 {
        return 0
    }
    var buy = -prices[0]
    var notBuy = 0
    for index in 1 ..< prices.count {
        let i = prices[index]
        buy = max(buy, notBuy - i)
        notBuy = max(buy + i, notBuy)
    }
    return max(buy, notBuy)
}

let test1 = [1, 2, 3, 4, 5]
print(maxProfit(test1))

let test2 = [7, 1, 5, 3, 6, 4]
print(maxProfit(test2))

let test3 = [7, 6, 4, 3, 1]
print(maxProfit(test3))
