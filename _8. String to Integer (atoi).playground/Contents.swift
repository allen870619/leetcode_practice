class Solution {
    func myAtoi(_ s: String) -> Int {
        let numSet: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        let symbol: [Character] = ["+", "-"]
        let avil: [Character] = [" ", "."]
        var num: [Character] = []
        var startRec = false
        
        for i in s{
            if num.isEmpty && !numSet.contains(i) && !symbol.contains(i) && !avil.contains(i){
                return 0
            }
            
            
            if i != " "{
                if (numSet.contains(i) || symbol.contains(i) || avil.contains(i)){
                    num.append(i)
                    startRec = true
                }else                 if startRec{
                    break
                }
            }else if startRec{
                break
            }
        }
        
        var result: Int?
        if num.contains("."){
            let d = Double(String(num))
            if let d = d{
                result = Int(d)
            }else{
                return 0
            }
        }else{
            result = Int(String(num))
        }
        if let result = result {
            if result < Int(Int32.min){
                return Int(Int32.min)
            }else if result > Int(Int32.max){
                return Int(Int32.max)
            }
            return result
        }else{
            return 0
        }
    }
}

let sol = Solution()
print(sol.myAtoi("words and 987"))
print(sol.myAtoi("-91283472332"))
print(sol.myAtoi("4193 with words"))
print(sol.myAtoi("3.14159"))
print(sol.myAtoi("-+12"))
print(sol.myAtoi("+-12"))
print(sol.myAtoi("+"))
print(sol.myAtoi("  -0012a42"))
print(sol.myAtoi("   +0 123"))
