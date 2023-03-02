class Solution2 { // better
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let nums = nums.sorted()

        func kSum(_ k: Int, start: Int, target: Int) -> [[Int]] {
            if k > nums.count || k * nums[start] > target || k * nums[nums.count - 1] < target {
                return []
            }

            if k == 2 {
                return twoSum(Array(nums[start...]), target)
            } else {
                var tmp = [[Int]]()
                for i in start ..< nums.count - k + 1 {
                    if i == start || nums[i] != nums[i - 1] {
                        let subArr = kSum(k - 1, start: i + 1, target: target - nums[i])

                        for sub in subArr {
                            tmp.append([nums[i]] + sub)
                        }
                    }
                }
                return tmp
            }
        }

        return kSum(4, start: 0, target: target)
    }

    private func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var left = 0, right = nums.count - 1
        var tmp = [[Int]]()
        while left < right {
            let sum = nums[left] + nums[right]
            if sum == target {
                tmp.append([nums[left], nums[right]])
                left += 1
                right -= 1
                while left < right, nums[left] == nums[left - 1] {
                    left += 1
                }
                while left < right, nums[right] == nums[right + 1] {
                    right -= 1
                }
            } else if sum > target {
                right -= 1
            } else {
                left += 1
            }
        }
        return tmp
    }
}

class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        if nums.count < 4 {
            return []
        }
        let nums = nums.sorted()
        var result = Set<[Int]>()
        let total = nums.count

        for i in 0 ..< total - 3 {
            for j in i + 1 ..< total - 2 {
                let cur = nums[i] + nums[j]
                let remain = twoSum(Array(nums[j + 1 ..< total]), target - cur)
                for sub in remain {
                    result.insert([nums[i], nums[j]] + sub)
                }
            }
        }
        return Array(result)
    }

    private func twoSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var left = 0, right = nums.count - 1
        var tmp = [[Int]]()
        while left < right {
            let sum = nums[left] + nums[right]
            if sum == target {
                tmp.append([nums[left], nums[right]])
                left += 1
            } else if sum > target {
                right -= 1
            } else {
                left += 1
            }
        }
        return tmp
    }
}

let sol = Solution2()
print(sol.fourSum([1, 0, -1, 0, -2, 2], 0))
print(sol.fourSum([2, 2, 2, 2, 2], 8))
print(sol.fourSum([0, 0, 0, 0], 0))
print(sol.fourSum([0, 0, 0], 0))
