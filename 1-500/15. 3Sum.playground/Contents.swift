// better
class Solution2 {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        let total = nums.count - 1
        var result = [[Int]]()

        for i in 0 ..< nums.count - 2 {
            if i > 0, nums[i] == nums[i - 1] {
                continue
            }

            var left = i + 1, right = total
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                if sum == 0 {
                    result.append([nums[i], nums[left], nums[right]])
                    left += 1

                    while nums[left] == nums[left - 1], left < right {
                        left += 1
                    }
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return result
    }
}

// not best practice
class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        let total = nums.count - 1
        var result = [[Int]]()

        for i in 0 ..< nums.count - 2 {
            var left = i + 1, right = total
            while left < right {
                let sum = nums[i] + nums[left] + nums[right]
                let set = [nums[i], nums[left], nums[right]]
                if sum == 0 {
                    if !result.contains(set) {
                        result.append(set)
                    }
                    left += 1
                } else if sum > 0 {
                    right -= 1
                } else {
                    left += 1
                }
            }
        }

        return result
    }
}

let sol = Solution2()
print(sol.threeSum([-1, 0, 1, 2, -1, -4]))
