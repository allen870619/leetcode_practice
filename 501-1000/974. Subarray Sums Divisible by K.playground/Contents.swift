class Solution {
    func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
        var arr = Array(repeating: 0, count: k + 1)
        arr[0] = 1
        var sum = 0, result = 0
        for i in nums {
            sum = (sum + i % k + k) % k
            result += arr[sum]
            arr[sum] += 1
        }
        return result
    }
}

let sol = Solution()
print(sol.subarraysDivByK([4, 5, 0, -2, -3, 1], 5))
print(sol.subarraysDivByK([7, 4, -10], 5))
