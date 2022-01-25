class Solution {
    func rearrangeArray(_ nums: [Int]) -> [Int] {
        var pos: [Int] = []
        var neg: [Int] = []
        for i in nums{
            if i > 0{
                pos.append(i)
            }else{
                neg.append(i)
            }
        }
        var result: [Int] = []
        while !(pos.isEmpty && neg.isEmpty){
            result.append(neg.popLast()!)
            result.append(pos.popLast()!)
        }
        return result.reversed()
    }
}

let sol = Solution()
print(sol.rearrangeArray([2, 8, -3, -9, 9, 1, -8, -2]))
