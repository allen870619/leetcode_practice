class Solution {
    func percentageLetter(_ s: String, _ letter: Character) -> Int {
        let s = [Character](s)
        let contain = s.filter{$0 == letter}
        return contain.count * 100 / s.count
    }
}

let sol = Solution()
print(sol.percentageLetter("foobar", "o"))
print(sol.percentageLetter("jjjj", "k"))
