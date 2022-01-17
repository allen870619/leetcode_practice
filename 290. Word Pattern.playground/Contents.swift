class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        let list = s.split(separator: " ")
        if pattern.count != list.count{
            return false
        }
        
        var dict: [Character: String] = [:]
        var count = 0
        for i in pattern{
            if dict[i] == nil{
                if dict.contains(where: {$1 == list[count]}){
                    return false
                }
                dict[i] = String(list[count])
            }else{
                if dict[i]! != list[count]{
                    return false
                }
            }
            count += 1
        }
        return true
    }
}

let sol = Solution()
print(sol.wordPattern("abba", "dog dog dog dog"))
