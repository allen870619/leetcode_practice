class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        var arrA = a
        var arrB = b
        var oneMore = false
        var result = ""
        while arrA.count != 0 || arrB.count != 0 {
            let ac = arrA.popLast()
            let bc = arrB.popLast()
            if ac == "1" && bc == "1" {
                result.insert(oneMore ? "1" : "0", at: result.startIndex)
                oneMore = true
            } else if ac == "1" || bc == "1" {
                result.insert(oneMore ? "0" : "1", at: result.startIndex)
            } else {
                result.insert(oneMore ? "1" : "0", at: result.startIndex)
                oneMore = false
            }
        }
        if oneMore {
            result.insert("1", at: result.startIndex)
        }
        return result
    }
}

let sol = Solution()
print(sol.addBinary("1010", "1011")) // 10101
print(sol.addBinary("11", "1")) // 100
