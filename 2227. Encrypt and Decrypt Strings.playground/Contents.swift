class Encrypter {
    var ans = [String: Int]()
    var k2v = [Character: String]()
    init(_ keys: [Character], _ values: [String], _ dictionary: [String]) {
        for i in 0..<keys.count{
            k2v[keys[i]] = values[i]
        }
        
        // pre-calculate answer
        for i in dictionary{
            var tmp = ""
            for j in i{
                tmp += k2v[j]!
            }
            if ans[tmp] == nil{
                ans[tmp] = 1
            }else{
                ans[tmp]! += 1
            }
        }
    }
    
    func encrypt(_ word1: String) -> String {
        var tmp = ""
        for i in word1{
            tmp += k2v[i] ?? ""
        }
        return tmp
    }
    
    func decrypt(_ word2: String) -> Int {
        return ans[word2] ?? 0
    }
}

let obj = Encrypter(["a", "b", "c", "d"], ["ei", "zf", "ei", "am"], ["abcd", "acbd", "adbc", "badc", "dacb", "cadb", "cbda", "abad"])
print(obj.encrypt("abcd"))
print(obj.decrypt("eizfeiam"))

