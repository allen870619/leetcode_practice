class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var dict = [Int: Int]()
        var dup = 0
        for i in nums {
            dict[i, default: 0] += 1
            if dict[i] ?? 0 > 1 {
                dup = i
            }
        }

        for i in 1 ... nums.count {
            if dict[i] == nil {
                return [dup, i]
            }
        }
        return []
    }
}
