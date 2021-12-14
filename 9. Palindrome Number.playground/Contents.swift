class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0{
            return false
        }
        
        var cList: [Character] = []
        for i in "\(x)"{
            cList.append(i)
        }
        var left = 0
        var right = cList.count - 1
        while left <= right{
            if cList[left] != cList[right]{
                return false
            }
            left += 1
            right -= 1
        }
        return true
    }
}
