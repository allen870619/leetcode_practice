class Solution {
    func maximumScore(_ nums: [Int], _ multipliers: [Int]) -> Int {
        var save: [[Int?]] = Array(repeating: Array(repeating: nil, count: multipliers.count), count: multipliers.count)

        func dp(_ left: Int, _ right: Int) -> Int {
            if left + right >= multipliers.count {
                return 0
            }
            if let s = save[left][right] {
                return s
            }
            let tmp = max(nums[left] * multipliers[left + right] + dp(left + 1, right),
                          nums[nums.count - 1 - right] * multipliers[left + right] + dp(left, right + 1))
            save[left][right] = tmp
            return tmp
        }

        return dp(0, 0)
    }
}

let sol = Solution()
print(sol.maximumScore([1, 2, 3], [3, 2, 1]))
print(sol.maximumScore([-5, -3, -3, -2, 7, 1], [-10, -5, 3, 4, 6]))
