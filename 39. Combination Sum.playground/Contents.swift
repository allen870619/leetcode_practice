class Solution {
    func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
        let candidates = candidates.sorted()
        var result = [[Int]]()
        
        func calList(remain: Int, target: Int, list: [Int]){
            for i in candidates{
                if i >= target{
                    if remain - i < 0{
                        break
                    }
                    if remain - i == 0{
                        result.append(list + [i])
                    }else{
                        calList(remain: remain - i, target: i, list: list + [i])
                    }
                }
            }
        }
        
        for i in candidates{
            if target - i == 0{
                result.append([i])
            }else{
                calList(remain: target - i, target: i, list: [i])
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.combinationSum([1,2,3], 6))
print(sol.combinationSum([2,3,6,7], 7))
print(sol.combinationSum([2,3,5], 8))
print(sol.combinationSum([2], 1))
