class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let keyboard: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        var result: [String] = []
        
        for i in digits{
            let com = keyboard[i]!
            if result.isEmpty{
                for j in com{
                    result.append("\(j)")
                }
            }else{
                var tmp: [String] = []
                for k in 0..<result.count{
                    for j in com{
                        tmp.append("\(result[k])\(j)")
                    }
                }
                result = tmp
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.letterCombinations("23"))
