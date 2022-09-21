class Solution {
    func sortColors(_ nums: inout [Int]) {
        var counts: [Int] = [0, 0, 0]
        for i in nums {
            counts[i] += 1
        }

        var result: [Int] = []
        var c = 0
        for i in counts {
            for _ in 0 ..< i {
                result.append(c)
            }
            c += 1
        }
        nums = result
    }
}

class Solution2 { // Dutch national flag problem
    func sortColors(_ nums: inout [Int]) {
        var zeroLeft = 0
        var twoRight = nums.count - 1
        var cur = 0

        while cur <= twoRight {
            if nums[cur] == 0 {
                nums.swapAt(cur, zeroLeft)
                zeroLeft += 1
                cur += 1
            } else if nums[cur] == 2 {
                nums.swapAt(cur, twoRight)
                twoRight -= 1
            } else {
                cur += 1
            }
        }
    }
}

let sol = Solution()
var val: [Int] = []
val = [2, 0, 2, 1, 1, 0]
sol.sortColors(&val)
print(val)
val = [2, 1, 0, 0, 1, 0, 2, 2, 0]
sol.sortColors(&val)
print(val)
val = [1, 2, 0]
sol.sortColors(&val)
print(val)
