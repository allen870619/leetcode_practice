class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var count = 0
        for i in nums{
            if count != i{
                return count
            }
            count += 1
        }
        return count
    }
}
