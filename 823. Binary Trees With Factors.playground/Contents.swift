class Solution {
    func numFactoredBinaryTrees(_ arr: [Int]) -> Int {
        let arr = arr.sorted()
        let mod = 1_000_000_007
        var dict = [Int: Int]()

        func dp(_ val: Int) -> Int {
            if dict[val] != nil {
                return dict[val]!
            }

            var count = 0
            for i in 0 ..< arr.count {
                if arr[i] > val {
                    break
                }
                let remain = val / arr[i]
                if arr[i] <= val, val % arr[i] == 0 {
                    if remain == 1 {
                        count += 1
                    } else if arr.contains(remain) {
                        count += dp(remain) * dp(arr[i]) % mod
                    }
                }
            }
            dict[val] = count % mod
            return dict[val]!
        }

        var result = 0
        for i in arr {
            result += dp(i)
        }
        return result % mod
    }
}

let sol = Solution()
print(sol.numFactoredBinaryTrees([2, 4]))
print(sol.numFactoredBinaryTrees([2, 4, 5, 10]))
print(sol.numFactoredBinaryTrees([46, 144, 5040, 4488, 544, 380, 4410, 34, 11, 5, 3_063_808, 5550, 34496, 12, 540, 28, 18, 13, 2, 1056, 32_710_656, 31, 91872, 23, 26, 240, 18720, 33, 49, 4, 38, 37, 1457, 3, 799, 557_568, 32, 1400, 47, 10, 20774, 1296, 9, 21, 92928, 8704, 29, 2162, 22, 1_883_700, 49588, 1078, 36, 44, 352, 546, 19, 523_370_496, 476, 24, 6000, 42, 30, 8, 16_262_400, 61600, 41, 24150, 1968, 7056, 7, 35, 16, 87, 20, 2730, 11616, 10912, 690, 150, 25, 6, 14, 1_689_120, 43, 3128, 27, 197_472, 45, 15, 585, 21645, 39, 40, 2205, 17, 48, 136]))
