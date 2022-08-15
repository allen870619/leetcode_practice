class Solution {
    func romanToInt(_ s: String) -> Int {
        let s = [Character](s)
        let dict: [Character: Int] = ["I": 1,
                                      "V": 5,
                                      "X": 10,
                                      "L": 50,
                                      "C": 100,
                                      "D": 500,
                                      "M": 1000,]
        var result = 0
        var last = 0
        for i in 0..<s.count {
            var tmp = dict[s[i]] ?? 0
            if last < tmp{
                result -= last * 2
            }
            last = tmp
            result += tmp
        }
        return result
    }
}

let sol = Solution()
print(sol.romanToInt("III"))
print(sol.romanToInt("LVIII"))
print(sol.romanToInt("MCMXCIV"))
