class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var num = num
        var total = 0
        while num > 0 {
            if num % 2 == 0 {
                num /= 2
            } else {
                num -= 1
            }
            total += 1
        }
        return total
    }
}
