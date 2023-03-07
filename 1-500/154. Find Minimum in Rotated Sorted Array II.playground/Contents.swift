// Time complexity: O(logN)
// Worst case: O(N)
/// We can't ensure the smallest num is on the left or right, so we have to move left or right one step until meet different num.
/// e.g.: [2,2,2,1,2] vs [2,1,2,2,2]
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1

        while left < right {
            let mid = (left + right) / 2
            if nums[left] >= nums[right] {
                if nums[mid] < nums[right] {
                    right = mid
                } else if nums[mid] > nums[right] {
                    left = mid + 1
                } else {
                    right -= 1
                }
            } else {
                break
            }
        }
        return nums[left]
    }
}
