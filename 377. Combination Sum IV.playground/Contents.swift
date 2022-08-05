class Solution {
    func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
        var tmp = [Int: Int]()
        
        func calTotal(_ remain: Int) -> Int{
            if remain == 0{
                return 1
            }else if tmp[remain] != nil{
                return tmp[remain]!
            }
            
            var tmpTotal = 0
            for i in nums{
                if remain >= i{
                    tmpTotal += calTotal(remain - i)
                }
            }
            tmp[remain] = tmpTotal
            return tmpTotal
        }
        return calTotal(target)
    }
}

let sol = Solution()
print(sol.combinationSum4([1,2,3], 4))
print(sol.combinationSum4([9], 3))
