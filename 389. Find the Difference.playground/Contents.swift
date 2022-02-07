class Solution {
    func findTheDifference(_ s: String, _ t: String) -> Character {
        var s = s.sorted()
        var t = t.sorted()
        for i in 0..<s.count{
            let sp = s.removeLast()
            let tp = t.removeLast()
            if sp != tp{
                return tp
            }
        }
        return t.removeLast()
    }
}
let sol = Solution()
print(sol.findTheDifference("abcd", "abcde"))
