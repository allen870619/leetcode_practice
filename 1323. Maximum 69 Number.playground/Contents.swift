class Solution {
    func maximum69Number(_ num: Int) -> Int {
        var char = [Character]("\(num)")
        for i in 0 ..< char.count {
            if char[i] == "6" {
                char[i] = "9"
                break
            }
        }
        return Int(String(char)) ?? num
    }
}
