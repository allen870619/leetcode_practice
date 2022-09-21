class Solution {
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var words = words.map { [Character]($0) }
        var result = 0

        var dict = [Character: [[Character]]]()
        for i in words {
            dict[i.first!, default: []].append(i)
        }

        for i in s {
            if let d = dict[i] {
                dict.removeValue(forKey: i)
                for w in d {
                    if w.count == 1 {
                        result += 1
                    } else {
                        var new = w
                        new.removeFirst()
                        dict[new.first!, default: []].append(new)
                    }
                }
            }
        }
        return result
    }
}

class Solution2 { // TLE
    func numMatchingSubseq(_ s: String, _ words: [String]) -> Int {
        var target = [Character](s)
        var result = 0
        for i in words {
            let sub = [Character](i)
            let total = sub.count
            var index = 0
            for j in 0 ..< target.count {
                if target[j] == sub[index] {
                    index += 1
                }
                if index == total {
                    result += 1
                    break
                }
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.numMatchingSubseq("abcde", ["a", "bb", "acd", "eca"]))
