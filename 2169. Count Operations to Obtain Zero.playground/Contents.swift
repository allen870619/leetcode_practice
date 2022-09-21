class Solution {
    func countOperations(_ num1: Int, _ num2: Int) -> Int {
        var num1 = num1
        var num2 = num2
        var count = 0
        while num1 != 0, num2 != 0 {
            if num1 >= num2 {
                let tmp = num1 - num2
                num1 = num2
                num2 = tmp
            } else {
                let tmp = num2 - num1
                num2 = num1
                num1 = tmp
            }
            count += 1
        }
        return count
    }
}

let sol = Solution()
print(sol.countOperations(2, 3))
print(sol.countOperations(10, 10))
