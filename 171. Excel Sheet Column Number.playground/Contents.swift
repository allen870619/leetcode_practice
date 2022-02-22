class Solution {
    func titleToNumber(_ columnTitle: String) -> Int {
        var result = 0
        for i in columnTitle{
            result *= 26
            result += Int(i.asciiValue!) - 64
        }
        return result
    }
}

let sol = Solution()
print(sol.titleToNumber("A"))
print(sol.titleToNumber("AB"))
print(sol.titleToNumber("ZY"))
