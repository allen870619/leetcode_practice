class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> [String] {
        var result = [String]()
        var tmp = ""
        for i in 0 ..< s.count {
            tmp.append(s[s.index(s.startIndex, offsetBy: i)])

            if wordDict.contains(tmp) {
                let subString = s[s.index(s.startIndex, offsetBy: i + 1)...]
                let subList = wordBreak(String(subString), wordDict)

                for i in subList {
                    result.append("\(tmp) \(i)")
                }
            }
        }
        if wordDict.contains(tmp) {
            result.append(tmp)
        }

        return result
    }
}
