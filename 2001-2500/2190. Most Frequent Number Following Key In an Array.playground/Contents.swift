
class Solution {
    func mostFrequent(_ nums: [Int], _ key: Int) -> Int {
        var result = Array(repeating: 0, count: 1001)
        var start = false
        for i in nums {
            if start {
                result[i] += 1
                start = false
            }
            if i == key {
                start = true
            }
        }

        var max = 0
        var ans = 0
        for (i, v) in result.enumerated() {
            if v >= max, i > ans {
                ans = i
                max = v
            }
        }
        return ans
    }
}

let sol = Solution()
print(sol.mostFrequent([1, 100, 200, 1, 100], 1))
print(sol.mostFrequent([2, 2, 2, 2, 3], 2))
print(sol.mostFrequent([2, 1000, 2, 1000, 2, 3], 2))
print(sol.mostFrequent([2, 1, 2, 1, 2, 3], 2))
