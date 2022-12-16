class Solution {
    func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
        var total = 0
        var target = target
        while target > startValue {
            if target % 2 == 0 {
                target /= 2
            } else {
                target += 1
            }
            total += 1
        }

        return total + startValue - target
    }
}

class Solution2 { // recursive
    func brokenCalc(_ startValue: Int, _ target: Int) -> Int {
        if startValue >= target {
            return startValue - target
        }

        if target % 2 == 0 {
            return 1 + brokenCalc(startValue, target / 2)
        } else {
            return 1 + brokenCalc(startValue, target + 1)
        }
    }
}

let sol = Solution()
print(sol.brokenCalc(2, 3))
print(sol.brokenCalc(5, 8))
print(sol.brokenCalc(3, 10))
print(sol.brokenCalc(4, 17))
