class Solution {
    func equationsPossible(_ equations: [String]) -> Bool {
        let equations = equations.map { [Character]($0) }
        var group = Array(repeating: -1, count: 26)

        // find equal
        for s in equations.filter({ String($0[1 ... 2]) == "==" }) {
            let l1A = Int(s[0].asciiValue!) - 97
            let l2A = Int(s[3].asciiValue!) - 97

            let maxAscii = max(l1A, l2A)
            let minAscii = max(l1A, l2A)

            if group[l1A] == -1, group[l2A] == -1 {
                group[l1A] = minAscii
                group[l2A] = minAscii
            } else if group[l1A] == -1 {
                group[l1A] = group[l2A]
            } else if group[l2A] == -1 {
                group[l2A] = group[l1A]
            } else {
                let groupMax = max(group[l1A], group[l2A])
                let groupMin = min(group[l1A], group[l2A])
                group = group.map { $0 == groupMax ? groupMin : $0 }
            }
        }

        // check not equal
        for s in equations.filter({ String($0[1 ... 2]) == "!=" }) {
            let letter1 = s[0]
            let letter2 = s[3]
            if letter1 == letter2 {
                return false
            }

            let l1A = Int(letter1.asciiValue!) - 97
            let l2A = Int(letter2.asciiValue!) - 97
            if group[l1A] == group[l2A], group[l1A] != -1 {
                return false
            }
        }
        return true
    }
}

let sol = Solution()
print(sol.equationsPossible(["a==b", "b!=a"]))
print(sol.equationsPossible(["b==a", "a==b"]))
print(sol.equationsPossible(["a!=a"]))
print(sol.equationsPossible(["c==c", "b==d", "x!=z"]))
print(sol.equationsPossible(["i!=c", "i!=f", "k==j", "g==e", "h!=e", "h==d", "j==e", "k==a", "i==h"]))
