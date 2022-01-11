class Solution { //TLE
    func wordCount(_ startWords: [String], _ targetWords: [String]) -> Int {
        var total = 0
        for i in targetWords{
            let tar = strToSet(i)
            for s in startWords{
                let start = strToSet(s)
                if tar.intersection(start) == start && tar.subtracting(start).count == 1{
                    print(i)
                    total += 1
                    break
                }
            }
        }
        return total
    }
    
    private func strToSet(_ str: String) -> Set<Character>{
        var result: Set<Character> = []
        for i in str{
            result.insert(i)
        }
        return result
    }
}

class Solution2 {
    func wordCount(_ startWords: [String], _ targetWords: [String]) -> Int {
        var targetWords = targetWords
        var targets: [String] = []
        var starts: [String] = []
        for i in startWords{
            starts.append(String(i.sorted()))
        }
        
        for i in targetWords{
            targets.append(String(i.sorted()))
        }
        
        var result = 0
        for i in starts{
            var pointer = 0
            if targets.isEmpty{
                break
            }
            while pointer < targets.count{
                let target = targets[pointer]
                if i.difference(from: target).count == 1 && i.count + 1 == target.count{
                    result += 1
                    targets.remove(at: pointer)
                }else{
                    pointer += 1
                }
            }
        }
        return result
    }
}

class Solution3 {
    func wordCount(_ startWords: [String], _ targetWords: [String]) -> Int {
        var startWordsDict: [Int: [[Character]]] = [:]
        var targetWords = targetWords
        
        for str in startWords{
            if startWordsDict[str.count] == nil{
                startWordsDict[str.count] = []
            }
            startWordsDict[str.count]!.append(str.sorted())
        }
        
        var total = 0
        for t in targetWords{
            for i in 0..<t.count{
                var tt = t.sorted()
                tt.remove(at: i)
                if let dict = startWordsDict[t.count-1]{
                    if dict.contains(tt){
                        total += 1
                        break
                    }
                }else{
                    break
                }
            }
        }
        return total
    }
    
}

let sol = Solution2()
print(sol.wordCount(["ant","act","tack"], ["tack","act","acti"])) // 2
print(sol.wordCount(["ab","a"], ["abc","abcd"])) // 1

