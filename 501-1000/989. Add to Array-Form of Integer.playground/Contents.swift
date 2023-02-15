class Solution {
    func addToArrayForm(_ num: [Int], _ k: Int) -> [Int] {
        var num = num, k = k, pointer = num.count - 1
        var isCarry = false

        while k > 0 || isCarry {
            var digit = k % 10
            k /= 10
            var newValue = (pointer < 0 ? 0 : num[pointer]) + digit + (isCarry ? 1 : 0)

            isCarry = false
            if newValue >= 10 {
                isCarry = true
                newValue -= 10
            }

            if pointer >= 0 {
                num[pointer] = newValue
            } else {
                num.insert(newValue, at: 0)
            }
            pointer -= 1
        }
        return num
    }
}
