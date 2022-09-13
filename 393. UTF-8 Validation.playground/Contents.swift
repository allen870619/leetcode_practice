class Solution {
    func validUtf8(_ data: [Int]) -> Bool {
        var type2Count = 0
        var desireCount = 0
        for i in data {
            if (128...191).contains(i) {
                type2Count += 1
            } else if i > 191 {
                if i >= 248{
                    return false
                } else if i >= 240 {
                    desireCount += 3
                } else if i >= 224 {
                    desireCount += 2
                } else if i >= 192 {
                    desireCount += 1
                }
            }
        }
        return type2Count == desireCount
    }
}

let sol = Solution()
print(sol.validUtf8([197,130,1]))
print(sol.validUtf8([235,140,4]))
print(sol.validUtf8([11,1,1,1,1,1]))
