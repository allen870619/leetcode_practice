class Solution {
    func countPrefixes(_ words: [String], _ s: String) -> Int {
        let s = [Character](s)
        let sc = s.count
        var total = 0
        for i in words{
            let c = [Character](i)
            var isSame = true
            if (c.count <= sc){
                for j in 0..<c.count{
                    if c[j] != s[j]{
                        isSame = false
                        break
                    }
                }
                if isSame{
                    total += 1
                }
            }
        }
        return total
    }
}

class Solution2 {
    func countPrefixes(_ words: [String], _ s: String) -> Int {
        return words.filter{ s.hasPrefix($0) }.count
    }
}

let sol = Solution()
print(sol.countPrefixes(["a","b","c","ab","bc","abc"], "abc"))
print(sol.countPrefixes(["a","a"], "aa"))
print(sol.countPrefixes(["feh","w","w","lwd","c","s","vk","zwlv","n","w","sw","qrd","w","w","mqe","w","w","w","gb","w","qy","xs","br","w","rypg","wh","g","w","w","fh","w","w","sccy"], "w"))
