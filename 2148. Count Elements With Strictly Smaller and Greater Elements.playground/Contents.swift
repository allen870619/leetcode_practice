class Solution {
    func countElements(_ nums: [Int]) -> Int {
        var nums = nums.sorted()
        var min = nums[0]
        var max = nums.last!
        var count = 0
        for i in nums {
            if i > min, i < max {
                count += 1
            }
        }
        return count
    }
}
