class Solution {
    func singleNonDuplicate(_ nums: [Int]) -> Int {
        var left = 0, right = nums.count - 1
        let total = nums.count

        while left < right {
            let mid = (left + right) / 2

            if nums[mid] == nums[mid + 1] {
                if (right - mid - 1) % 2 == 0 {
                    right = mid - 1
                } else {
                    left = mid + 2
                }
            } else if nums[mid] == nums[mid - 1] {
                if (right - mid) % 2 == 0 {
                    right = mid - 2
                } else {
                    left = mid + 1
                }
            } else {
                return nums[mid]
            }
        }
        return nums[left]
    }
}

let sol = Solution()
print(sol.singleNonDuplicate([1, 1, 2, 3, 3, 4, 4, 8, 8]))
print(sol.singleNonDuplicate([3, 3, 7, 7, 10, 11, 11]))
print(sol.singleNonDuplicate([11, 11, 5]))
print(sol.singleNonDuplicate([1, 1, 2, 3, 3]))
print(sol.singleNonDuplicate([3]))
