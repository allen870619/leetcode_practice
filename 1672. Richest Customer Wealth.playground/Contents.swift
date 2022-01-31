class Solution {
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        var maxVal = 0
        for i in accounts{
            var tmp = 0
            for j in i{
                tmp += j
            }
            maxVal = max(maxVal, tmp)
        }
        return maxVal
    }
}
