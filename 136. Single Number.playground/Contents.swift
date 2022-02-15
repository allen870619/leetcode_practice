class Solution { // faster
    func singleNumber(_ nums: [Int]) -> Int {
        var list = Array(repeating: 0, count: 60001)
        for i in nums{
            list[i+30000] += 1
        }
        return list.firstIndex(where: {$0 == 1})!-30000
    }
}

class Solution2 {
    func singleNumber(_ nums: [Int]) -> Int {
        let nums = nums.sorted()
        var isDup = false
        var last = nums[0]
        for i in nums[1...]{
            if i == last{
                isDup = true
            }else{
                if isDup{
                    isDup = false
                    last = i
                }else{
                    return last
                }
            }
        }
        return 0
    }
}

let sol = Solution()
print(sol.singleNumber([4,1,2,1,2]))
print(sol.singleNumber([-1]))
