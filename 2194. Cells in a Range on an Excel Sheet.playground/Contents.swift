class Solution {
    func cellsInRange(_ s: String) -> [String] {
        let col = s.split(separator: ":")
        let charStart = col[0].first!.asciiValue!
        let charEnd = col[1].first!.asciiValue!
        let from = Int("\(col[0].last!)")!
        let to = Int("\(col[1].last!)")!
        
        var result = [String]()
        for ascii in charStart...charEnd{
            for j in from...to{
                result.append("\(Character(UnicodeScalar(ascii)))\(j)")
            }
        }
        return  result
    }
}
let sol = Solution()
print(sol.cellsInRange("K1:L2"))
print(sol.cellsInRange("A1:F1"))

