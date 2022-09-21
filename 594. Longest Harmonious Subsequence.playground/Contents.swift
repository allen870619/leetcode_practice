class Solution {
    func findLHS(_ nums: [Int]) -> Int {
        var dict = [Int: Int]()
        for i in nums {
            dict[i, default: 0] += 1
        }
        let arr = dict.sorted { $0.key < $1.key }
        var result = 0

        for i in 0 ..< arr.count - 1 {
            if arr[i + 1].key == arr[i].key + 1 {
                result = max(result, arr[i].value + arr[i + 1].value)
            }
        }

        return result
    }
}
