class Solution {
    func sumEvenAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> [Int] {
        var nums = nums
        var result = [Int]()
        var tmp = nums.filter({$0 % 2 == 0}).reduce(0, +)
        
        for i in queries {
            let val = i[0]
            let index = i[1]
            
            let origin = nums[index]
            nums[index] += val
            
            if nums[index] % 2 == 0 {
                tmp += nums[index]
            }
            if origin % 2 == 0 {
                tmp -= origin
            }
            result.append(tmp)
        }
        return result
    }
}

let sol = Solution()
print(sol.sumEvenAfterQueries([1,2,3,4], [[1,0],[-3,1],[-4,0],[2,3]]))
print(sol.sumEvenAfterQueries([1], [[4,0]]))
