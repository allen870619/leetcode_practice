// SECOND
class Solution3 {
    func addDigits(_ num: Int) -> Int {
        var num = num
        while num >= 10 {
            var result = 0
            while num > 0 {
                result += num % 10
                num /= 10
            }
            num = result
        }
        return num
    }
}

// tricky math
class Solution4 {
    func addDigits(_ num: Int) -> Int {
        if num < 10 {
            return num
        } else if num % 9 == 0 {
            return 9
        } else {
            return num % 9
        }
    }
}

// FIRST
class Solution {
    func addDigits(_ num: Int) -> Int {
        var total = num
        while total >= 10 {
            total = tear(total)
        }
        return total
    }

    func tear(_ num: Int) -> Int {
        var cur = num
        var total = 0
        while cur > 0 {
            total += cur % 10
            cur /= 10
        }
        return total
    }
}

class Solution2 {
    func addDigits(_ num: Int) -> Int {
        var total = num
        while total >= 10 {
            total = tear("\(total)")
        }
        return total
    }

    func tear(_ num: String) -> Int {
        var total = 0
        for i in num {
            total += Int("\(i)")!
        }
        return total
    }
}

let s = Solution2()
print(s.addDigits(38))
print(s.addDigits(0))
