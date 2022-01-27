class Solution {
    func findMaximumXOR(_ nums: [Int]) -> Int {
        var res = 0
        var mask = 0
        for i in stride(from: 31, through: 0, by: -1){
            mask |= 1 << i
            var s: Set<Int> = []
            for num in nums{
                s.insert(num & mask)
            }
            var target = res | 1 << i
            for ss in s{
                if s.contains(ss ^ target){
                    res = target
                    break
                }
            }
        }
        return  res
    }
}

let sol = Solution()
print(sol.findMaximumXOR([3,10,5,25,2,8]))
