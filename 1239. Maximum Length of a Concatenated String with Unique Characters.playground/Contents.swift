class Solution {
    func maxLength(_ arr: [String]) -> Int {
        var result = 0
        var dictList = [[Character: Int]]()

        // preset
        for i in arr {
            var dic = [Character: Int]()
            for j in i {
                dic[j, default: 0] += 1
            }
            dictList.append(dic)
        }

        // dp: combine dict, suspend when duplicate shows up
        func dp(_ current: [Character: Int], _ index: Int) {
            var dict = current
            for i in dictList[index] {
                dict[i.key, default: 0] += i.value
                if dict[i.key]! > 1 {
                    return
                }
            }
            result = max(result, dict.count)

            for i in index + 1 ..< arr.count {
                dp(dict, i)
            }
        }

        for i in 0 ..< arr.count {
            dp([:], i)
        }
        return result
    }
}

let sol = Solution()
print(sol.maxLength(["un", "iq", "ue"]))
print(sol.maxLength(["cha", "r", "act", "ers"]))
print(sol.maxLength(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p"]))
print(sol.maxLength(["aa", "bb"]))
print(sol.maxLength(["abcdefghijklmnopqrstuvwxyz"]))
print(sol.maxLength(["zog", "nvwsuikgndmfexxgjtkb", "nxko"]))
