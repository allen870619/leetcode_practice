// 20230214
class Solution2 {
    func addBinary(_ a: String, _ b: String) -> String {
        let a = [Character](a), b = [Character](b)
        var p1 = a.count - 1, p2 = b.count - 1
        var nextDigit = false
        var result = ""
        while p1 >= 0 || p2 >= 0 {
            var v = 0
            if p1 >= 0, p2 >= 0 {
                v = Int("\(a[p1])")! + Int("\(b[p2])")!
            } else if p1 >= 0 {
                v = Int("\(a[p1])")!
            } else {
                v = Int("\(b[p2])")!
            }
            if nextDigit {
                v += 1
                nextDigit = false
            }
            if v >= 2 {
                nextDigit = true
                v -= 2
            }
            result += "\(v)"
            p1 -= 1
            p2 -= 1
        }
        if nextDigit {
            result.append("1")
        }

        return String(result.reversed())
    }
}

// 20220110
class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var arrA = a
        var arrB = b
        var oneMore = false
        var result = ""
        while arrA.count != 0 || arrB.count != 0 {
            let ac = arrA.popLast()
            let bc = arrB.popLast()
            if ac == "1" && bc == "1" {
                result.insert(oneMore ? "1" : "0", at: result.startIndex)
                oneMore = true
            } else if ac == "1" || bc == "1" {
                result.insert(oneMore ? "0" : "1", at: result.startIndex)
            } else {
                result.insert(oneMore ? "1" : "0", at: result.startIndex)
                oneMore = false
            }
        }
        if oneMore {
            result.insert("1", at: result.startIndex)
        }
        return result
    }
}

let sol = Solution()
print(sol.addBinary("1010", "1011")) // 10101
print(sol.addBinary("11", "1")) // 100
