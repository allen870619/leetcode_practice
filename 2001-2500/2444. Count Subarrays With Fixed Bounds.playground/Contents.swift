class Solution {
    func countSubarrays(_ nums: [Int], _ minK: Int, _ maxK: Int) -> Int {
        var result = 0, left = -1, right = -1, invalid = -1

        for (index, num) in nums.enumerated() {
            if num <= maxK, num >= minK {
                left = num == minK ? index : left
                right = num == maxK ? index : right

                result += max(0, min(left, right) - invalid)
            } else {
                invalid = index
            }
        }

        return result
    }
}

let sol = Solution()
print(sol.countSubarrays([1, 3, 5, 2, 7, 5], 1, 5))
print(sol.countSubarrays([1, 1, 1, 1], 1, 1))
