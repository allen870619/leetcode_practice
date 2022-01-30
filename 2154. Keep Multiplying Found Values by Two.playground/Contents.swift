class Solution {
    func findFinalValue(_ nums: [Int], _ original: Int) -> Int {
        var result = original
        while nums.contains(result){
            result *= 2
        }
        return result
    }
}
