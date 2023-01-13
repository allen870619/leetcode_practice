class Solution {
    func longestPath(_ parent: [Int], _ s: String) -> Int {
        let s = [Character](s)
        var dict = [Int: [Int]]()
        for (index, i) in parent.enumerated() {
            dict[i, default: []].append(index)
        }

        var result = 0
        func findPath(_ index: Int) -> Int {
            var longest = 0, secondLongest = 0
            for i in dict[index] ?? [] {
                let subPath = findPath(i)
                if s[index] != s[i] {
                    if subPath > longest {
                        secondLongest = longest
                        longest = subPath
                    } else if subPath > secondLongest {
                        secondLongest = subPath
                    }
                }
            }
            result = max(result, 1 + longest + secondLongest)
            return longest + 1
        }

        findPath(0)
        return result
    }
}

let sol = Solution()
print(sol.longestPath([-1, 0, 0, 1, 1, 2], "abgcbc"))
print(sol.longestPath([-1, 0, 0, 1, 1, 2], "abacbe"))
print(sol.longestPath([-1, 0, 0, 0], "aabc"))
print(sol.longestPath([-1, 0, 1], "aab"))
