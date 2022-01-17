class Solution {
    func minimumDeletions(_ nums: [Int]) -> Int {
        if nums.count == 1{
            return 1
        }
        
        var count = 0
        var iMax = Int.min
        var iMin = Int.max
        var maxIndex = 0
        var minIndex = 0
        for i in 0..<nums.count{
            if nums[i] > iMax{
                iMax = nums[i]
                maxIndex = i
            }
            if nums[i] < iMin{
                iMin = nums[i]
                minIndex = i
            }
        }
        
        if minIndex > maxIndex{
            swap(&minIndex, &maxIndex)
        }
        
        count += min(minIndex + 1, nums.count - maxIndex)
        if minIndex + 1 < nums.count - maxIndex{
            count += min(maxIndex - minIndex, nums.count - maxIndex)
        }else{
            count += min(minIndex + 1, maxIndex - minIndex)
        }
        return count
    }
}

let sol = Solution()
print(sol.minimumDeletions([2,10,7,5,4,1,8,6])) // 5
print(sol.minimumDeletions([0,-4,19,1,8,-2,-3,5])) // 3
print(sol.minimumDeletions([101])) // 1
print(sol.minimumDeletions([2, 1, 3, 6, 5, 4])) // 4
