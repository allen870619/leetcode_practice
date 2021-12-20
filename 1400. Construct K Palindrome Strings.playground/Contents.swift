class Solution {
    func canConstruct(_ s: String, _ k: Int) -> Bool {
        if s.count == k{
            return true
        }
        if s.count < k{
            return false
        }
        
        var cSet: [Character: Int] = [:]
        for i in s{
            if cSet[i] == 0{
                cSet[i] = 1
            }else{
                cSet[i] += 1
            }
        }
        
        var type = 0
        for i in cSet{
            if i.value % 2 != 0{
                type += 1
            }
        }
        
        if type > k{
            return false
        }
        return true
    }
}
