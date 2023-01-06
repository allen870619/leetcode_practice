class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var result = 0, totalCost = 0
        for i in costs.sorted() {
            totalCost += i
            if totalCost > coins {
                break
            }
            result += 1
        }
        return result
    }
}
