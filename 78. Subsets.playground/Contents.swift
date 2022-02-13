class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0{
            return []
        }
        var result = [[Int]]()
        result.append([])
        
        for i in 0..<nums.count{
            for j in 0..<result.count{
                result.append(result[j] + [nums[i]])
            }
        }
        
        return result
    }
}

let sol = Solution()
print(sol.subsets([1,2,3]))
