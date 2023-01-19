class Solution {
    func differenceOfSum(_ nums: [Int]) -> Int {
        var sum = 0
        var digit = 0
        for i in nums {
            sum += i
            var num = i
            while num > 0 {
                digit += num % 10
                num /= 10
            }
        }
        return abs(sum - digit)
    }
}
