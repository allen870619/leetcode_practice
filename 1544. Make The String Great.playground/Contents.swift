class Solution {
    func makeGood(_ s: String) -> String {
        var s = [Character](s)
        if s.count <= 1 {
            return String(s)
        }

        var index = 0
        while index < s.count - 1 {
            let a = Int(s[index].asciiValue ?? 0)
            let b = Int(s[index + 1].asciiValue ?? 0)
            if abs(a - b) == 32 {
                s.remove(at: index)
                s.remove(at: index)
                index -= 1
                if index < 0 {
                    index = 0
                }
            } else {
                index += 1
            }
        }

        return String(s)
    }
}

let sol = Solution()
print(sol.makeGood("leEeetcode"))
