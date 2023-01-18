class Solution {
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var sum = 0, totalMin = 30000, totalMax = -30000, curMin = 0, curMax = 0

        for i in nums {
            curMin = min(i, i + curMin)
            totalMin = min(totalMin, curMin)
            curMax = max(i, curMax + i)
            totalMax = max(totalMax, curMax)
            sum += i
        }

        if totalMax <= 0 {
            return totalMax
        }
        return max(totalMax, sum - totalMin)
    }
}

class Solution2 { // TLE
    func maxSubarraySumCircular(_ nums: [Int]) -> Int {
        var nums = nums
        let total = nums.count

        var ans = 0
        for _ in 0 ..< total {
            var result = 0

            for value in nums {
                result = max(value, result + value)
                ans = max(ans, result)
            }
            nums.append(nums.removeFirst())
        }
        return ans
    }
}

let sol = Solution()
print(sol.maxSubarraySumCircular([1, -2, 3, -2]))
print(sol.maxSubarraySumCircular([5, -2, 5]))
print(sol.maxSubarraySumCircular([-1, -3, -2]))
