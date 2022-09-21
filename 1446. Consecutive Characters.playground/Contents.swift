class Solution {
    func maxPower(_ s: String) -> Int {
        var maxCount = 0
        var tmp = 0
        var tmpChar: Character?
        for i in s {
            if i != tmpChar {
                maxCount = max(maxCount, tmp)
                tmp = 1
                tmpChar = i
            } else {
                tmp += 1
            }
        }
        return max(maxCount, tmp)
    }
}
