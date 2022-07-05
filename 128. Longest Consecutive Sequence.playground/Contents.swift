class Solution {
    func longestConsecutive(_ nums: [Int]) -> Int {
        if nums.count == 0{
            return 0
        }
        let nums = nums.sorted()
        var last = nums[0]
        var tmp = 1
        var result = 0
        for i in nums[1...]{
            if i == last+1{
                tmp += 1
            }else if i != last{
                result = max(result, tmp)
                tmp = 1
            }
            last = i
        }
        return max(result, tmp)
    }
}

let sol = Solution()
print(sol.longestConsecutive([1,2,0,1]))
print(sol.longestConsecutive([100,4,200,1,3,2]))
print(sol.longestConsecutive([0,3,7,2,5,8,4,6,0,1]))
