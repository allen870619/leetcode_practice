class Solution {
    func kthPalindrome(_ queries: [Int], _ intLength: Int) -> [Int] {
        var result = [Int]()
        if intLength == 1 {
            for i in queries {
                if i >= 10 {
                    result.append(-1)
                } else {
                    result.append(i)
                }
            }
            return result
        }
        let start = getStart(intLength / 2)
        let isEven = intLength % 2 == 0
        for i in queries {
            let left = isEven ? i + start - 1 : start + (i - 1) / 10
            let middle = (i - 1) % 10 // odd use only
            let right = Int(String("\(left)".reversed()))!
            let ans = isEven ? left * (start * 10) + right : left * (start * 100) + middle * start * 10 + right
            if "\(ans)".count > intLength {
                result.append(-1)
            } else {
                result.append(ans)
            }
        }
        return result
    }

    private func getStart(_ digit: Int) -> Int {
        var result = 1
        for i in 0 ..< digit - 1 {
            result *= 10
        }
        return result
    }
}

let sol = Solution()
print(sol.kthPalindrome([1, 2, 3, 4, 5, 90], 3))
print(sol.kthPalindrome([2, 4, 6], 4))
print(sol.kthPalindrome([2, 201_429_812, 8, 520_498_110, 492_711_727, 339_882_032, 462_074_369, 9, 7, 6], 1))
print(sol.kthPalindrome([94, 18, 388_481_008, 38, 16_017_953, 16, 223_505_660, 78, 123_699_557, 346_244_579, 2], 8))
