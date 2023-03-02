class Solution {
    func compress(_ chars: inout [Character]) -> Int {
        if chars.count <= 1 {
            return chars.count
        }
        var rec = [Character]()
        var current = chars[0], count = 1

        for i in chars[1...] {
            if i != current {
                rec.append(current)
                if count > 1 {
                    rec += [Character]("\(count)")
                }
                current = i
                count = 0
            }
            count += 1
        }
        rec.append(current)
        if count > 1 {
            rec += [Character]("\(count)")
        }
        chars = rec
        return chars.count
    }
}

let sol = Solution()
var list: [Character] = ["a", "a", "b", "b", "c", "c", "c"]
print(sol.compress(&list))
print(list)
list = ["a"]
print(sol.compress(&list))
print(list)
list = ["a", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b", "b"]
print(sol.compress(&list))
print(list)
