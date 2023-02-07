class Solution {
    func longestNiceSubarray(_ nums: [Int]) -> Int {
        var tmp = 0
        var left = 0
        var result = 1

        for index in 0 ..< nums.count {
            // Each bit can only contain one 1. If not, XOR left num (shift left to right) until it satisfied
            while tmp & nums[index] != 0 {
                tmp ^= nums[left]
                left += 1
            }

            // OR to merge each bit together for checking
            tmp |= nums[index]
            result = max(result, index - left + 1)
        }

        return result
    }
}

let sol = Solution()
print(sol.longestNiceSubarray([1, 3, 8, 48, 10]))
print(sol.longestNiceSubarray([3, 1, 5, 11, 13]))
print(sol.longestNiceSubarray([744_437_702, 379_056_602, 145_555_074, 392_756_761, 560_864_007, 934_981_918, 113_312_475, 1090, 16384, 33, 217_313_281, 117_883_195, 978_927_664]))
