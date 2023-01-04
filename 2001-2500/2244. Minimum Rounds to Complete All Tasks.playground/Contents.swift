class Solution {
    func minimumRounds(_ tasks: [Int]) -> Int {
        var result = 0, dict = [Int: Int]()
        for i in tasks {
            dict[i, default: 0] += 1
        }

        for k in dict.keys {
            var times = dict[k]!
            if times == 1 {
                return -1
            }
            result += times / 3
            if times % 3 != 0 {
                result += 1
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.minimumRounds([2, 2, 3, 3, 2, 4, 4, 4, 4, 4]))
