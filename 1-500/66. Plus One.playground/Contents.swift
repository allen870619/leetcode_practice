class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var pointer = digits.count - 1
        var remain = 1
        while remain > 0, pointer >= 0 {
            digits[pointer] += remain
            remain = 0
            if digits[pointer] >= 10 {
                remain = 1
                digits[pointer] = 0
                pointer -= 1
            }
        }
        if remain != 0 {
            digits.insert(1, at: 0)
        }
        return digits
    }
}
