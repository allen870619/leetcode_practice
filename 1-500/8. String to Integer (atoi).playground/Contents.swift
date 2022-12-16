// Second Time
class Solution {
    func myAtoi(_ s: String) -> Int {
        let nums: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var rec: [Character] = []
        var hasNum = false

        for i in s {
            if i == " " {
                if !rec.isEmpty {
                    break
                }
            } else {
                if nums.contains(i) {
                    rec.append(i)
                    hasNum = true
                } else if i == "+" || i == "-" {
                    if rec.contains("+") || rec.contains("-") || !rec.isEmpty {
                        break
                    } else {
                        rec.append(i)
                    }
                } else {
                    break
                }
            }
        }
        if !hasNum {
            return 0
        }
        let result = String(rec)
        if let i = Int32(result) {
            return Int(i)
        } else {
            if rec.contains("-") {
                return Int(Int32.min)
            } else {
                return Int(Int32.max)
            }
        }
        return 0
    }
}

// First Time
class Solution2 {
    func myAtoi(_ s: String) -> Int {
        let avil: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "+", "-", ".", " "]
        var num: [Character] = []
        var sign: Character?

        for i in s {
            if avil.contains(i) {
                if i == "+" || i == "-" {
                    if sign == nil, num.isEmpty {
                        sign = i
                    } else {
                        break
                    }
                } else {
                    if !num.isEmpty || sign != nil, i == " " {
                        break
                    } else if i != " " {
                        num.append(i)
                    }
                }
            } else {
                break
            }
        }

        var result: Int32 = 0
        if !num.isEmpty {
            var snum = String(num)
            if num.contains(".") {
                if num[0] == "." {
                    return 0
                }
                snum = String(snum.split(separator: ".")[0])
            }

            if let tmp = Int32(snum) {
                result = tmp
                if sign == "-" {
                    result = -tmp
                }
            } else {
                if sign == "-" {
                    return Int(Int32.min)
                } else {
                    return Int(Int32.max)
                }
            }
        }
        return Int(result)
    }
}

let sol = Solution()
print(sol.myAtoi("words and 987"))
print(sol.myAtoi("-91283472332"))
print(sol.myAtoi("4193 with words"))
print(sol.myAtoi("-+12"))
print(sol.myAtoi("+-12"))
print(sol.myAtoi("+"))
print(sol.myAtoi("  -0012a42"))
print(sol.myAtoi("3.14159"))
print(sol.myAtoi(".1"))
print(sol.myAtoi("   +0 123"))
print(sol.myAtoi("  +  413"))
