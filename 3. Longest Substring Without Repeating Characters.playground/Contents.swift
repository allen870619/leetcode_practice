// 2022/06/10
class Solution2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let s = [Character](s)
        var tmpArr = [Character]()
        var maxLen = 0
        for i in s{
            if tmpArr.contains(i){
                maxLen = max(maxLen, tmpArr.count)
                while !tmpArr.isEmpty{
                    let p = tmpArr.removeFirst()
                    if p == i{
                        break
                    }
                }
            }
            tmpArr.append(i)
        }
        return max(maxLen, tmpArr.count)
    }
}

// 2021/11/10
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var maxInt = 0
        var strList: [Character] = []
        for i in s{
            if strList.contains(i){
                maxInt = strList.count > maxInt ? strList.count : maxInt
                repeat{
                    strList.remove(at: 0)
                }while(strList.contains(i))
            }
            strList.append(i)
        }
        maxInt = strList.count  > maxInt ? strList.count : maxInt
        return maxInt
    }
}

let tester = Solution()
print(tester.lengthOfLongestSubstring(" "))
print(tester.lengthOfLongestSubstring("dvdj"))
print(tester.lengthOfLongestSubstring("asjrgapa"))
print(tester.lengthOfLongestSubstring("abcabcbb"))
//  print(tester.lengthOfLongestSubstring(t))

/// bad tle
class BadSolution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count <= 1{
            return s.count
        }
        var maxInt = 0
        var count = 0
        var exist: [Character] = []
        for start in 0..<s.count{
            var isBreak = false
            for i in start..<s.count{
                let c = s[s.index(s.startIndex, offsetBy: i)]
                if exist.contains(c){
                    maxInt = count > maxInt ? count : maxInt
                    count = 0
                    exist.removeAll()
                    isBreak = true
                    break
                }
                exist.append(c)
                count += 1
            }
            if !isBreak{
                maxInt = count > maxInt ? count : maxInt
            }
            exist.removeAll()
            count = 0
            
        }
        return maxInt
    }
}
