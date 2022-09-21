class Solution {
    func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        var dict = [Int: [Int]]()
        for i in nums {
            var total = 0
            var num = "\(i)"
            for j in num {
                total *= 10
                total += mapping[Int("\(j)")!]
            }

            if dict[total] == nil {
                dict[total] = [i]
            } else {
                dict[total]?.append(i)
            }
        }
        let arr = dict.sorted(by: { $0.key < $1.key })

        var result = [Int]()
        for i in arr {
            result += i.value
        }
        return result
    }
}

let sol = Solution()
print(sol.sortJumbled([8, 9, 4, 0, 2, 1, 3, 5, 7, 6], [991, 338, 38]))
print(sol.sortJumbled([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], [789, 456, 123]))
print(sol.sortJumbled([8, 2, 9, 5, 3, 7, 1, 0, 6, 4],
                      [418, 4191, 916, 948, 629_641_556, 574, 111_171_937, 28250, 42_775_632, 6086, 85_796_326, 696_292_542, 186, 67559, 2167, 366, 854, 2441, 78176, 621, 4257, 2_250_097, 509_847, 7506, 77, 50, 4_135_258, 4036, 59934, 59474, 3_646_243, 9_049_356, 85852, 90_298_188, 2_448_206, 30_401_413, 33_190_382, 968_234_660, 7973, 668_786, 992_777_977, 77, 355_766, 221, 246_409_664, 216_290_476, 45, 87, 836_414, 40952]))
