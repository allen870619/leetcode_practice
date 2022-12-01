class Solution {
    func halvesAreAlike(_ s: String) -> Bool {
        let s = [Character](s)
        let len = s.count
        let a = s[0..<len/2], b = s[(len/2)...]
        let list: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        let ac = a.filter({list.contains($0)})
        let bc = b.filter({list.contains($0)})
        return ac.count == bc.count
    }
}

let sol = Solution()
print(sol.halvesAreAlike("textbook"))
print(sol.halvesAreAlike("book"))
