class Solution { // greedy, faster
    func canJump(_ nums: [Int]) -> Bool {
        var maxRange = 0
        let totalCount = nums.count
        for (index, value) in nums.enumerated() {
            maxRange = max(maxRange, index + value)
            if maxRange == index, value == 0, index != totalCount - 1 {
                return false
            }
        }
        return true
    }
}

class Solution2 { // recursive, slower
    func canJump(_ nums: [Int]) -> Bool {
        if nums.count == 1 {
            return true
        }

        var saved: [Bool?] = Array(repeating: nil, count: nums.count)
        let end = nums.count - 1

        func jump(from: Int, step: Int) -> Bool {
            if from + step >= end {
                return true
            }
            if let b = saved[from + step] {
                return b
            }

            if nums[from + step] == 0 {
                return false
            }
            var steps = nums[from + step]
            while steps > 0 {
                if jump(from: from + step, step: steps) {
                    return true
                }
                saved[from + step] = false
                steps -= 1
            }
            return false
        }

        var steps = nums[0]
        while steps > 0 {
            if jump(from: 0, step: steps) {
                return true
            }
            steps -= 1
        }
        return false
    }
}

let sol = Solution()
print(sol.canJump([0, 1]))
print(sol.canJump([2, 3, 1, 1, 4]))
print(sol.canJump([3, 2, 1, 0, 4]))
