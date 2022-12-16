class Solution {
    func findWinners(_ matches: [[Int]]) -> [[Int]] {
        var warr = Array(repeating: 0, count: 100_001)
        var larr = Array(repeating: 0, count: 100_001)
        for i in matches {
            warr[i[0]] += 1
            larr[i[1]] += 1
        }
        var answ = [Int]()
        var ansl = [Int]()
        for i in 1 ... 100_000 {
            if larr[i] == 0, warr[i] > 0 {
                answ.append(i)
            } else if larr[i] == 1 {
                ansl.append(i)
            }
        }
        return [answ, ansl]
    }
}

let sol = Solution()
print(sol.findWinners([[1, 3], [2, 3], [3, 6], [5, 6], [5, 7], [4, 5], [4, 8], [4, 9], [10, 4], [10, 9]]))
print(sol.findWinners([[2, 3], [1, 3], [5, 4], [6, 4]]))
