class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        let nums = nums.sorted()
        var last = nums.first!
        var runThrough = false
        
        if k == 0{
            for i in nums[1...]{
                if last != i{
                    last = i
                    runThrough = false
                }else if !runThrough{
                    result += 1
                    runThrough = true
                }
            }
        }else{
            for i in nums[1...]{
                if i != last{
                    if nums.contains(last+k){
                        result += 1
                    }
                    last = i
                }
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.findPairs([1,3,1,4,5], 2))
print(sol.findPairs([1,2, 3, 4, 5], 1))
print(sol.findPairs([1,3,1,4,5], 0))
print(sol.findPairs([1,1,1,1,1], 0))
