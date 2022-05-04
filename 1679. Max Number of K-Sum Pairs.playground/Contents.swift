class Solution {
    func maxOperations(_ nums: [Int], _ k: Int) -> Int {
        var total = 0
        var dict = [Int: Int]()
        
        // init dict
        for i in nums{
            if dict[i] == nil{
                dict[i] = 1
            }else{
                dict[i]! += 1
            }
        }
        
        // cal and remove
        for i in nums{
            let diff = k - i
            if let remain = dict[diff]{
                if diff == i{
                    if dict[i]! > 1{
                        total += 1
                        dict[i]! -= 2
                    }
                }else{
                    if dict[i]! > 0 && remain > 0{
                        total += 1
                        dict[i]! -= 1
                        dict[diff]! -= 1
                    }
                }
            }
        }
        return total
    }
}

let sol = Solution()
print(sol.maxOperations([1,2,3,4], 5))
print(sol.maxOperations([3,1,3,4,3], 6))
