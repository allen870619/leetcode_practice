class Solution {
    func repeatLimitedString(_ s: String, _ repeatLimit: Int) -> String {
        var dict : [Character: Int] = [:]
        for i in s{
            if dict[i] == nil{
                dict[i] = 1
            }else{
                dict[i]! += 1
            }
        }
        
        var arr = dict.sorted(by: {$0.key.asciiValue!>$1.key.asciiValue!})
        print(arr)
        
        var result = ""
        var index = 0
        var isBreak = false
        while !arr.isEmpty{
            var tmpCount = 0
            while true{
                if tmpCount == repeatLimit{
                    isBreak = true
                    break
                }
                if index == arr.count{
                    return result
                }
                result.append(arr[index].key)
                arr[index].value -= 1
                if index != 0{
                    if arr[index].value == 0{
                        arr.remove(at: index)
                    }
                    index -= 2
                    isBreak = true
                    break
                }
                if arr[index].value == 0{
                    arr.remove(at: index)
                    break
                }

                
                tmpCount += 1
            }
            if isBreak{
                index += 1
                isBreak = false
            }
            
        }
        return result
    }
}
let sol = Solution()
print(sol.repeatLimitedString("zzcccac", 3))
print(sol.repeatLimitedString("aababab", 2))
