import Foundation
class Solution {
    func atMostNGivenDigitSet(_ digits: [String], _ n: Int) -> Int {

        var digit: [Int] = []
        for i in digits{
            digit.append(Int(i)!)
        }
        
        if n < 10{
            var count = 0
            for i in digit{
                if i <= n{
                    count += 1
                }
            }
            return count
        }
        
        let all = Decimal(digits.count)
        var n = n
        var total = 0
        var stack = 1
        while n > 0{
            var vtotal = 0
            if n > 10{
                vtotal = Int(NSDecimalNumber(decimal: pow(all, stack)))
            }else{
                var last = 0
                for i in digit{
                    if i < n{
                        last += 1
                    }
                }
                vtotal = Int(NSDecimalNumber(decimal: pow(all, stack - 1))) * last
            }
            total += vtotal
            stack += 1
            n /= 10
        }
        return total
    }
}

let sol = Solution()
print(sol.atMostNGivenDigitSet(["1","3","5","7"], 100))
print(sol.atMostNGivenDigitSet(["1","4","9"], 1000000000))
print(sol.atMostNGivenDigitSet(["3","4","8"], 4))
