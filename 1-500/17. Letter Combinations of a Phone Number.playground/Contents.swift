// 202200509 second
class Solution2 {
    func letterCombinations(_ digits: String) -> [String] {
        var result = [String]()
        let keyPair = ["abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]

        for i in digits {
            let index = Int("\(i)")! - 2
            if result.isEmpty {
                for j in keyPair[index] {
                    result.append("\(j)")
                }
            } else {
                for j in result {
                    let lastSet = result.removeFirst()
                    for k in keyPair[index] {
                        result.append("\(lastSet)\(k)")
                    }
                }
            }
        }
        return result
    }
}

//
class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        let keyboard: [Character: String] = ["2": "abc", "3": "def", "4": "ghi", "5": "jkl", "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"]
        var result: [String] = []

        for i in digits {
            let com = keyboard[i]!
            if result.isEmpty {
                for j in com {
                    result.append("\(j)")
                }
            } else {
                var tmp: [String] = []
                for k in 0 ..< result.count {
                    for j in com {
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
