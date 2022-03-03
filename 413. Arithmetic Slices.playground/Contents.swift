class Solution {
    func numberOfArithmeticSlices(_ nums: [Int]) -> Int {
        if nums.count < 3{
            return 0
        }
        var tmpList = [Int]()
        var last = nums[1]
        var diff = nums[1] - nums[0]
        var count = 2
        
        for i in nums[2...]{
            if i - last == diff{
                count += 1
                if count >= 3{
                    tmpList.append(count - 2)
                }
            }else{
                count = 2
                diff = i - last
            }
            last = i
        }
        
        return tmpList.reduce(0, +)
    }
}
let sol = Solution()
print(sol.numberOfArithmeticSlices([1,2,3,8,9,10]))
print(sol.numberOfArithmeticSlices([1,2,3,4]))
print(sol.numberOfArithmeticSlices([1]))
