class Solution {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let mos = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var set = Set<String>()
        for word in words {
            var tmp = ""
            for i in word {
                let index = Int(i.asciiValue! - 97)
                tmp += mos[index]
            }
            set.insert(tmp)
        }
        return set.count
    }
}

class Solution2 {
    func uniqueMorseRepresentations(_ words: [String]) -> Int {
        let mos = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        var set = Set<String>()
        for word in words {
            let mos = word.reduce("", { $0 + mos[Int($1.asciiValue! - 97)]})
            set.insert(mos)
        }
        return set.count
    }
}
