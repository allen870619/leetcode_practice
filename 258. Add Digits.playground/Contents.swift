
class Solution {
    func addDigits(_ num: Int) -> Int {
        var total = num
        while total >= 10{
            total = tear(total)
        }
        return total
    }
    
    func tear(_ num: Int) -> Int{
        var cur = num
        var total = 0
        while cur > 0{
            total += cur % 10
            cur /= 10
        }
        return total
    }
}


class Solution2 {
    func addDigits(_ num: Int) -> Int {
        var total = num
        while total >= 10{
            total = tear("\(total)")
        }
        return total
    }
    
    func tear(_ num: String) -> Int{
        var total = 0
        for i in num{
            total += Int("\(i)")!
        }
        return total
    }
}

let s = Solution2()
print(s.addDigits(38))
print(s.addDigits(0))
