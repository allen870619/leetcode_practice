class Solution {
    func reverseWords(_ s: String) -> String {
        var result = [Character](), s = s.split(separator: " ")
        for i in s {
            result += [Character](i.reversed())
            result += " "
        }
        result.popLast()
        return String(result)
    }
}
