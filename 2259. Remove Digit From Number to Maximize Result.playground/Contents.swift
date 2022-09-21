class Solution {
    func removeDigit(_ number: String, _ digit: Character) -> String {
        var number = [Character](number)
        var ansList = [Int]()
        var lastTarget = 0
        for i in 0 ..< number.count {
            if number[i] == digit {
                if i + 1 < number.count {
                    if number[i + 1] > digit {
                        number.remove(at: i)
                        lastTarget = -1
                        break
                    } else {
                        lastTarget = i
                    }
                } else {
                    lastTarget = i
                }
            }
        }

        if lastTarget != -1 {
            number.remove(at: lastTarget)
        }

        return String(number)
    }
}

let sol = Solution()
print(sol.removeDigit("123", "3"))
print(sol.removeDigit("123", "1"))
print(sol.removeDigit("1231", "1"))
print(sol.removeDigit("551", "5"))
print(sol.removeDigit("133235", "3"))
