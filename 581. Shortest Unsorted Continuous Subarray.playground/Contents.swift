class Solution {
    func findUnsortedSubarray(_ nums: [Int]) -> Int {
        let new = nums.sorted()
        var start = 0
        var end = nums.count-1
        for i in 0..<nums.count{
            if new[i] != nums[i]{
                start = i
                break
            }
        }
        
        while end >= start{
            if new[end] == nums[end]{
                end -= 1
            }else{
                break
            }
        }
        return end - start + 1
    }
}

let sol = Solution()
print(sol.findUnsortedSubarray([2,6,4,8,10,9,15])) // 5
print(sol.findUnsortedSubarray([1,2,3,4])) // 0
print(sol.findUnsortedSubarray([1])) // 0
print(sol.findUnsortedSubarray([2, 1])) // 2
print(sol.findUnsortedSubarray([5,4,3,2,1])) // 5
print(sol.findUnsortedSubarray([1, 2, 3]))  // 0
print(sol.findUnsortedSubarray([1,2,3,3,3])) // 0
print(sol.findUnsortedSubarray([2,3,3,2,4])) // 3
print(sol.findUnsortedSubarray([1,2,4,5,3])) // 3
