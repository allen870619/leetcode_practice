///
/// 用stack 方式疊起來，遇到數字儲存上一個情況，
/// 等結束在合併
///
class Solution {
    func decodeString(_ s: String) -> String {
        let nums: [Character] = ["0","1","2","3","4","5","6","7","8","9"]
        var timeStack: [Int] = []
        var strStack: [String] = []
        
        var result = ""
        var numStr = ""
        for c in s{
            if nums.contains(c){
                numStr += "\(c)"
            }else if c  == "["{
                // rec time
                timeStack.append(Int(numStr)!)
                numStr = ""
                
                // start record
                strStack.append(result) // save last result to stack
                result = ""
            }else if c == "]"{ // end rec this round
                let part = result
                var tmp = ""
                for i in 0..<timeStack.removeLast(){
                    tmp += part // duplicate this part
                }
                
                // combine
                let prev = strStack.removeLast()
                result = prev+tmp
            }else{
                result += "\(c)"
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.decodeString("3[a]2[bc]"))
print(sol.decodeString("3[a2[c]]"))
print(sol.decodeString("2[abc]3[cd]ef"))
print(sol.decodeString("abc3[cd]xyz"))
print(sol.decodeString("100[leetcode]"))
print(sol.decodeString("3[a]2[bc]"))
