class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var m = m, n = n
        var n1 = nums1, n2 = nums2
        nums1.removeAll()
        while m > 0 || n > 0{
            if m > 0 && n > 0{
                if n1.first! < n2.first!{
                    nums1.append(n1.removeFirst())
                    m -= 1
                }else{
                    nums1.append(n2.removeFirst())
                    n -= 1
                }
            }else if m > 0{
                nums1.append(n1.removeFirst())
                m -= 1
            }else{
                nums1.append(n2.removeFirst())
                n -= 1
            }
        }
    }
}

class Solution2 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var tmp = nums1[0..<m]
        nums1 = tmp + nums2
        nums1.sort()
    }
}
