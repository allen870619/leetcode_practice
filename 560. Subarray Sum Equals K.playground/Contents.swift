class Solution { // SLOWER
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var len = 1
        var result = 0
        while len <= nums.count {
            var tmp = nums[0 ..< len].reduce(0,+)
            if tmp == k {
                result += 1
            }
            for i in len ..< nums.count {
                tmp -= nums[i - len]
                tmp += nums[i]
                if tmp == k {
                    result += 1
                }
            }
            len += 1
        }
        return result
    }
}

class Solution2 {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var table: [Int: Int] = [:]
        var result = 0
        table[0] = 1
        var sum = 0
        for i in nums {
            sum += i
            if table[sum - k] != nil {
                result += table[sum - k]!
            }
            if table[sum] == nil {
                table[sum] = 1
            } else {
                table[sum]! += 1
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.subarraySum([1, 2, 1, 2, 3], 3))
print(sol.subarraySum([1, 1, 1], 2))
print(sol.subarraySum([1, -1, 0], 0))
print(sol.subarraySum([1, 2, 3], 3))
print(sol.subarraySum([1], 0))
