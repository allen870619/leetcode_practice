class Solution { // faster
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var array = Array(repeating: 0, count: 2501)
        for i in 0..<nums.count{
            var tmp = 0
            for j in 0..<i{
                if nums[j] < nums[i]{
                    tmp = max(tmp, array[j])
                }
            }
            array[i] = tmp + 1
        }
        return array.max() ?? 0
    }
}

class Solution2 {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        var list = [Int: Int]()
        for i in nums{
            var tmp = 0
            for i in list.filter{$0.key < i}{
                tmp = max(tmp, i.value)
            }
            list[i] = tmp + 1
        }
        return list.sorted{$0.value > $1.value}.first?.value ?? 0
    }
}
