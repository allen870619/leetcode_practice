class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var targetList: [Int] = [] // last second index list
        var tmpList = [0] // last index list
        var lastNum = nums[0]
        for i in 1 ..< nums.count {
            if nums[i] <= lastNum {
                tmpList.append(i)
            } else {
                targetList = tmpList
                tmpList = [i]
            }
            lastNum = nums[i]
        }

        if targetList.isEmpty {
            nums.sort()
        } else {
            let targetLast = nums[targetList.last!]
            for i in stride(from: tmpList.count - 1, through: 0, by: -1) {
                if nums[tmpList[i]] > targetLast {
                    nums.swapAt(tmpList[i], targetList.last!)
                    break
                }
            }
            var afterTargetList: [Int] = []
            for _ in 0 ..< (nums.count - targetList.last! - 1) {
                afterTargetList.append(nums.popLast()!)
            }
            nums += afterTargetList.sorted()
        }
    }
}

let sol = Solution()
var a: [Int] = []
a = [1, 4, 2, 3]
sol.nextPermutation(&a)
print(a)
a = [1, 2, 3]
sol.nextPermutation(&a)
print(a)
a = [1, 1, 5]
sol.nextPermutation(&a)
print(a)
a = [3, 2, 1]
sol.nextPermutation(&a)
print(a)
a = [1, 5, 3, 10, 7, 2]
sol.nextPermutation(&a)
print(a)
