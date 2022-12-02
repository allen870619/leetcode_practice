class Solution {
    func closeStrings(_ word1: String, _ word2: String) -> Bool {
        let word1 = [Character](word1), word2 = [Character](word2)
        var dict1 = [Character: Int](), dict2 = [Character: Int]()
        if word1.count != word2.count {
            return false
        }
        
        for i in 0..<word1.count {
            dict1[word1[i], default: 0] += 1
            dict2[word2[i], default: 0] += 1
        }
        
        for key in dict1.keys {
            if dict1[key] == dict2[key] {
                dict1.removeValue(forKey: key)
                dict2.removeValue(forKey: key)
            }
        }
        
        if dict1.keys.sorted() == dict2.keys.sorted()
            && dict1.values.sorted() == dict2.values.sorted() {
            return true
        }
        return false
    }
}
