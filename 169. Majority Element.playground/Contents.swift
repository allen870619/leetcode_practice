class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var result = 0
        var resultElement = 0
        var tmpCount = 1
        var cur = nums[0]

        for i in nums[1...] {
            if i == cur {
                tmpCount += 1
            } else {
                if tmpCount > result {
                    result = tmpCount
                    resultElement = cur
                }
                tmpCount = 1
                cur = i
            }
        }
        if tmpCount > result {
            resultElement = cur
        }
        return resultElement
    }
}

class Solution2 {
    func majorityElement(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for i in nums {
            if dict[i] == nil {
                dict[i] = 1
            } else {
                dict[i]! += 1
            }
        }
        return dict.sorted(by: { $0.value > $1.value })[0].key
    }
}

let sol = Solution()
print(sol.majorityElement([3, 2, 3]))
print(sol.majorityElement([2, 2, 1, 1, 1, 2, 2]))
