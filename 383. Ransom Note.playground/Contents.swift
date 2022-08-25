class Solution {
    func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
        var dict = [Character: Int]()
        for i in magazine {
            dict[i, default: 0] += 1
        }
        
        for i in ransomNote {
            if dict[i] == nil || dict[i] == 0 {
                return false
            }
            dict[i]! -= 1
        }
        return true
    }
}
