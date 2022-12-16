class Solution {
    func removeDuplicateLetters(_ s: String) -> String {
        let s = [Character](s)
        var total = Array(repeating: 0, count: 26)
        for i in s {
            total[Int(i.asciiValue! - 97)] += 1
        }

        var result = [Character]()
        var seen = Set<Character>()
        for i in s {
            let tarAscii = Int(i.asciiValue!)
            var pointer = result.count - 1
            while pointer >= 0 {
                var lastAscii = Int(result[pointer].asciiValue!)
                if lastAscii > tarAscii, total[lastAscii - 97] > 0, !seen.contains(i) {
                    let delete = result.remove(at: pointer)
                    seen.remove(delete)
                } else {
                    break
                }
                pointer -= 1
            }
            if !seen.contains(i) {
                result.append(i)
                seen.insert(i)
            }
            total[tarAscii - 97] -= 1
        }
        return String(result)
    }
}

let sol = Solution()
print(sol.removeDuplicateLetters("cbacdcbc"))
print(sol.removeDuplicateLetters("bcabc"))
print(sol.removeDuplicateLetters("bbcaac"))
print(sol.removeDuplicateLetters("abacb"))
