class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1{
            return s
        }
        
        var charList: [Character] = []
        var result: [Character] = []
        for i in s{
            charList.append(i)
        }
        
        let maxStep =  (numRows - 1) * 2
        for i in 0..<numRows{
            var step = 2 * i
            var cur = -i + step
            
            while cur < s.count{
                result.append(charList[cur])
                step = maxStep - step
                if step == 0{
                    step = maxStep - step
                }
                cur += step
            }
        }
        return String(result)
    }
}

class Solution2 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1{
            return s
        }
        var strList = Array(repeating: "", count: numRows)
        var curRow = 0
        var rev = false
        for i in s{
            strList[curRow].append(i)
            if curRow == numRows - 1{
                rev = true
            }else if curRow == 0{
                rev = false
            }
            curRow += rev ? -1 : 1
        }
        var result = ""
        for i in strList{
            result += i
        }
        return result
    }
}


let sol = Solution2()
print(sol.convert("PAYPALISHIRING", 3))
print(sol.convert("PAYPALISHIRING", 4))
print(sol.convert("A", 1))
print(sol.convert("AB", 1))
