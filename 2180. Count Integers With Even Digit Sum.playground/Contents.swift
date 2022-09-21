class Solution {
    func countEven(_ num: Int) -> Int {
        var result = 0

        for i in 1 ... num {
            var tmp = i
            var total = 0
            while tmp >= 10 {
                total += tmp % 10
                tmp /= 10
            }
            total += tmp
            if total % 2 == 0 {
                result += 1
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.countEven(4))
print("---")
print(sol.countEven(30))
