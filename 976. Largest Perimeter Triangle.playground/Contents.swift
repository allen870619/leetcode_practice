class Solution {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        for i in stride(from: nums.count - 1, through: 2, by: -1) {
            for j in stride(from: i - 1, through: 1, by: -1) {
                for k in stride(from: j - 1, through: 0, by: -1) {
                    if nums[i] < nums[j] + nums[k] {
                        return nums[i] + nums[j] + nums[k]
                    }
                }
            }
        }
        return 0
    }
}

class Solution2 {
    func largestPerimeter(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        for i in stride(from: nums.count - 3, through: 0, by: -1) {
            if nums[i + 2] < nums[i] + nums[i + 1] {
                return nums[i] + nums[i + 1] + nums[i + 2]
            }
        }
        return 0
    }
}

let sol = Solution2()
print(sol.largestPerimeter([2, 1, 2]))
