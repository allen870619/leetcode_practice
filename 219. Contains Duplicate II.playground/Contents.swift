class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict = [Int: [Int]]()
        for (index, i) in nums.enumerated() {
            dict[i, default: []].append(index)
        }

        for i in dict {
            let list = i.value
            if list.count >= 2 {
                var last = list[0]
                for j in list[1...] {
                    if j - last == k {
                        return true
                    }
                    last = j
                }
            }
        }
        return false
    }
}
