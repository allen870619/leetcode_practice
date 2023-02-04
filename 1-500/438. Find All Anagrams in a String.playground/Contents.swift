class Solution {
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        var arrayP = Array(repeating: 0, count: 26)
        let lenP = p.count
        for i in p {
            arrayP[Int(i.asciiValue!) - 97] += 1
        }

        var result = [Int]()
        var left = 0
        var current = Array(repeating: 0, count: 26)
        let s = [Character](s)
        for right in 0 ..< s.count {
            current[Int(s[right].asciiValue!) - 97] += 1
            // overbound should move left pointer one step right
            if right - left + 1 > lenP {
                current[Int(s[left].asciiValue!) - 97] -= 1
                left += 1
            }

            // compare
            if current == arrayP {
                result.append(left)
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.findAnagrams("cbaebabacd", "abc"))
