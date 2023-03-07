// time complexity: O(logN)
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1

        while left < right {
            let mid = (left + right) / 2
            if nums[left] > nums[right] {
                if nums[mid] < nums[right] {
                    right = mid
                } else {
                    left = mid + 1
                }
            } else {
                break
            }
        }
        return nums[left]
    }
}
