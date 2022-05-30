class Solution { // bit manipulation, faster
    func maxProduct(_ words: [String]) -> Int {
        var list = [Int]()
        for i in words{
            var value = 0
            for c in i{
                value |= 1 << (c.asciiValue! - Character("a").asciiValue!)
            }
            list.append(value)
        }
        
        var result = 0
        
        for i in 0..<list.count-1{
            for j in i..<list.count{
                if list[i] & list[j] == 0{
                    result = max(result, words[i].count * words[j].count)
                }
            }
        }
        return result
    }
}

class Solution2 { // set
    func maxProduct(_ words: [String]) -> Int {
        var sets = [Set<Character>]()
        for i in words{
            sets.append(Set(i))
        }
        var result = 0
        
        for i in 0..<sets.count-1{
            for j in i..<sets.count{
                let intersec = sets[i].intersection(sets[j])
                if intersec.count == 0{
                    result = max(result, words[i].count * words[j].count)
                }
            }
        }
        return result
    }
}

let sol = Solution()
print(sol.maxProduct(["abcw","baz","foo","bar","xtfn","abcdef"]))
print(sol.maxProduct(["a","ab","ac"]))
