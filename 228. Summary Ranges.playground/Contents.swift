class Solution {
    func summaryRanges(_ nums: [Int]) -> [String] {
        if nums.count < 1 {
            return []
        }
        var result = [String]()
        var tmpStart = nums[0]
        var cur = nums[0]
        let nums = nums + [Int.max]

        for i in nums[1...] {
            if i == cur + 1 {
                cur += 1
            } else {
                if cur - tmpStart == 0 {
                    result.append("\(cur)")
                } else {
                    result.append("\(tmpStart)->\(cur)")
                }
                tmpStart = i
                cur = i
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.summaryRanges([0, 1, 2, 4, 5, 7]))
print(sol.summaryRanges([0, 2, 3, 4, 6, 8, 9]))
print(Int.max)
print(Int32.max)
