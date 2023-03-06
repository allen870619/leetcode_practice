class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dict = [Int: Int]()
        for i in nums {
            dict[i, default: 0] += 1
        }

        var k = k
        var result = [Int]()
        for (key, _) in dict.sorted(by: { $0.value > $1.value }) {
            result.append(key)
            k -= 1
            if k == 0 {
                break
            }
        }
        return result
    }
}
