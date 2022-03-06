class Solution {
    func sortJumbled(_ mapping: [Int], _ nums: [Int]) -> [Int] {
        var dict = [Int: [Int]]()
        for i in nums{
            var total = 0
            var num = "\(i)"
            for j in num{
                total *= 10
                total += mapping[Int("\(j)")!]
            }
            
            if dict[total] == nil{
                dict[total] = [i]
            }else{
                dict[total]?.append(i)
            }
        }
        let arr = dict.sorted(by: {$0.key < $1.key})
        
        
        var result = [Int]()
        for i in arr{
            result += i.value
        }
        return result
    }
}

let sol = Solution()
print(sol.sortJumbled([8,9,4,0,2,1,3,5,7,6], [991,338,38]))
print(sol.sortJumbled([0,1,2,3,4,5,6,7,8,9], [789,456,123]))
print(sol.sortJumbled([8,2,9,5,3,7,1,0,6,4],
                      [418,4191,916,948,629641556,574,111171937,28250,42775632,6086,85796326,696292542,186,67559,2167,366,854,2441,78176,621,4257,2250097,509847,7506,77,50,4135258,4036,59934,59474,3646243,9049356,85852,90298188,2448206,30401413,33190382,968234660,7973,668786,992777977,77,355766,221,246409664,216290476,45,87,836414,40952]))
