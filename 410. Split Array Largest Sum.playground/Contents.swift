class Solution { // binary search, directly find the target, and check if can split less than m
    func splitArray(_ nums: [Int], _ m: Int) -> Int {
        let total = nums.reduce(0, +)
        var result = total
        var left = nums.min()!
        var right = total
        while left < right {
            let mid = (left + right) / 2
            let split = checkSplit(nums, mid, m)
            if split {
                right = mid
            } else {
                left = mid + 1
            }
        }
        return right
    }

    private func checkSplit(_ nums: [Int], _ mid: Int, _ m: Int) -> Bool {
        if nums.max()! > mid {
            return false
        }
        var count = 0
        var tmp = 0
        for i in nums {
            tmp += i
            if tmp > mid {
                count += 1
                tmp = i
            } else if tmp == mid {
                count += 1
                tmp = 0
            }
        }
        count += tmp == 0 ? 0 : 1
        return count <= m
    }
}

let sol = Solution()
print(sol.splitArray([1, 4, 5, 3, 6, 9, 7], 4)) // 10
print(sol.splitArray([7, 2, 5, 10, 8], 2)) // 18
print(sol.splitArray([1, 2, 3, 4, 5], 2)) // 9
print(sol.splitArray([1, 4, 4], 3)) // 4
print(sol.splitArray([2, 3, 1, 1, 1, 1, 1], 5)) // 3
