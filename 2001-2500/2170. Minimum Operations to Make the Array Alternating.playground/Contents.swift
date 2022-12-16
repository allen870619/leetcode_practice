class Solution {
    func minimumOperations(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return 0
        }
        var odd: [Int: Int] = [:]
        var even: [Int: Int] = [:]
        for (i, num) in nums.enumerated() {
            if i % 2 == 0 {
                if even[num] == nil {
                    even[num] = 1
                } else {
                    even[num]? += 1
                }
            } else {
                if odd[num] == nil {
                    odd[num] = 1
                } else {
                    odd[num]? += 1
                }
            }
        }

        let evenArr = even.sorted(by: { $0.value > $1.value })
        let oddArr = odd.sorted(by: { $0.value > $1.value })

        var result1 = nums.count - evenArr[0].value - oddArr[0].value
        if evenArr[0].key == oddArr[0].key {
            if oddArr.count > 1 {
                result1 = result1 + oddArr[0].value - oddArr[1].value
            } else {
                result1 = result1 + oddArr[0].value
            }
        }

        var result2 = nums.count - evenArr[0].value - oddArr[0].value
        if evenArr[0].key == oddArr[0].key {
            if evenArr.count >= 2 {
                result2 = result2 + evenArr[0].value - evenArr[1].value
            } else {
                result2 = result2 + evenArr[0].value
            }
        }
        return min(result1, result2)
    }
}
