class Solution {
    func minWindow(_ s: String, _ t: String) -> String {
        let s = [Character](s)
        var counter = [Character: Int]()
        var left = 0, right = 0
        var result = ""
        var resultSize = s.count

        for i in t {
            counter[i, default: 0] += 1
        }

        while right < s.count {
            let rc = s[right]

            if counter[rc] != nil {
                counter[rc]! -= 1
                if checkSatisty() {
                    while left <= right {
                        if resultSize >= right - left + 1 {
                            result = String(Array(s[left ... right]))
                            resultSize = right - left + 1
                        }
                        let lc = s[left]
                        left += 1
                        if counter[lc] != nil {
                            counter[lc]! += 1
                            if counter[lc]! > 0 {
                                break
                            }
                        }
                    }
                }
            }
            right += 1
        }

        func checkSatisty() -> Bool {
            for i in counter {
                if i.value > 0 {
                    return false
                }
            }
            return true
        }

        return result
    }
}

let sol = Solution()
print(sol.minWindow("ADOBECODEBANC", "ABC"))
print(sol.minWindow("a", "a"))
print(sol.minWindow("a", "aa"))
print(sol.minWindow("cabwefgewcwaefgcf", "cae"))
