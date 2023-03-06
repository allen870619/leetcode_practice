class Solution {
    func singleNumber(_ nums: [Int]) -> [Int] {
        var dict = [Int: Int]()
        for i in nums {
            dict[i, default: 0] += 1
        }
        return dict.filter { $0.value == 1 }.map(\.key)
    }
}
