class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var index = 1, result = 1
        var lastValue = nums[0]
        if nums.count <= 1 {
            return 1
        }
        while index < nums.count {
            if nums[index] == lastValue {
                nums.remove(at: index)
            } else {
                lastValue = nums[index]
                result += 1
                index += 1
            }
        }
        return result
    }
}
