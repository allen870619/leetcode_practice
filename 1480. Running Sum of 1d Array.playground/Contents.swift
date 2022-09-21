class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var nums = nums
        if nums.count <= 1 {
            return nums
        }

        for i in 1 ..< nums.count {
            nums[i] = nums[i] + nums[i - 1]
        }
        return nums
    }
}

let sol = Solution()
print(sol.runningSum([3, 1, 2, 10, 1]))
