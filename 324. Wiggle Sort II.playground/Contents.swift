class Solution {
    func wiggleSort(_ nums: inout [Int]) {
        var sorted = nums.sorted(by: <)
        for i in stride(from: 1, to: nums.count, by: 2) {
            nums[i] = sorted.removeLast()
        }
        for i in stride(from: 0, to: nums.count, by: 2) {
            nums[i] = sorted.removeLast()
        }
    }
}

let sol = Solution()
var a = [1,5,1,1,6,4]
sol.wiggleSort(&a)
print(a)

a = [1,3,2,2,3,1]
sol.wiggleSort(&a)
print(a)

a = [1,1,2,1,2,2,1]
sol.wiggleSort(&a)
print(a)

a = [4,5,5,6]
sol.wiggleSort(&a)
print(a)
