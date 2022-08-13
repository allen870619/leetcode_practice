class Solution { // Not good, almost TLE but pass
    func findSubstring(_ s: String, _ words: [String]) -> [Int] {
        let s = [Character](s)
        let words = words.sorted()
        var result = [Int]()
        let subCount = words.first?.count ?? 0
        
        func getList(_ index: Int, _ list: [String]) -> [String]{
            if index >= s.count - subCount + 1 || list.isEmpty{
                return []
            }
            
            var w = list
            let sub = String(s[index..<index+subCount])
            if w.contains(sub){
                if let i = w.firstIndex(of: sub){
                    w.remove(at: i)
                }else{
                    return []
                }
                return [sub] + getList(index + subCount, w)
            }
            return []
        }
        
        for i in 0..<s.count - words.count + 1 {
            if words == getList(i, words).sorted(){
                result.append(i)
            }
        }
        
        return result
    }
}

let sol = Solution()
print(sol.findSubstring("barfoothefoobarman", ["foo","bar"]))
print(sol.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"]))
print(sol.findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"]))
print(sol.findSubstring("barfoofoobarthefoobarman", ["bar","foo","the"]))
print(sol.findSubstring("aaaaaaaaaaaaaa", ["aa","aa"]))
print(sol.findSubstring("aaaaaaaaaaaaaa", ["aa","aa", "aa"]))
print(sol.findSubstring("ababaab", ["ab","ba","ba"]))
print(sol.findSubstring("abaababbaba", ["ab","ba","ab","ba"]))
