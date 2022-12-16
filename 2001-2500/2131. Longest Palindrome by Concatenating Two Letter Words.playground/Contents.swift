class Solution {
    func longestPalindrome(_ words: [String]) -> Int {
        var avblPair = 0
        var dict = [String: Int]()

        // create dict
        for i in words {
            dict[i, default: 0] += 1
        }

        // find pair
        var singleUsed = false
        for key in dict.keys {
            let char = [Character](key)
            let revChar = "\(char[1])\(char[0])"

            if char[0] == char[1] {
                avblPair += dict[key] ?? 0
                if singleUsed {
                    if (dict[key] ?? 0) % 2 == 1 {
                        avblPair -= 1
                    }
                } else {
                    if (dict[key] ?? 0) % 2 == 1 {
                        singleUsed = true
                    }
                }
            } else {
                if let revCount = dict[revChar] {
                    let avbl = min(dict[key] ?? 0, revCount)
                    avblPair += avbl * 2
                    dict[key]? -= avbl
                    dict[revChar]? -= avbl
                }
            }
        }

        return avblPair * 2
    }
}

let sol = Solution()
print(sol.longestPalindrome(["lc", "cl", "gg"]))
print(sol.longestPalindrome(["ab", "ty", "yt", "lc", "cl", "ab"]))
print(sol.longestPalindrome(["cc", "ll", "xx"]))
print(sol.longestPalindrome(["dd", "aa", "bb", "dd", "aa", "dd", "bb", "dd", "aa", "cc", "bb", "cc", "dd", "cc"]))
