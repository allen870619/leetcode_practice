class Solution {
    func subsetXORSum(_ nums: [Int]) -> Int {
        var total: [Int] = []
        var tmp: [Int] = []
        for i in 0 ..< nums.count {
            total.append(nums[i])
            tmp = [nums[i]]
            cal(i)
        }

        func cal(_ target: Int) {
            if target + 1 >= nums.count {
                return
            }
            var last = tmp.last!
            for i in target + 1 ..< nums.count {
                let v = last ^ nums[i]
                total.append(v)
                tmp.append(v)
                cal(i)
            }
        }

        var result = 0
        for i in total {
            result += i
        }
        return result
    }
}

class Solution2 { // math
    func subsetXORSum(_ nums: [Int]) -> Int {
        var total = 0

        let powerSize = Int(pow(2, Double(nums.count)))

        for index in 0 ..< powerSize {
            var temp = 0
            for j in 0 ..< nums.count {
                if index & (1 << j) > 0 {
                    temp ^= nums[j]
                }
            }
            total += temp
        }

        return total
    }
}

let sol = Solution()
print(sol.subsetXORSum([3, 4, 5, 6, 7]))
