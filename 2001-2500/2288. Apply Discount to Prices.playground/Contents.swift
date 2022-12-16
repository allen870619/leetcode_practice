class Solution {
    func discountPrices(_ sentence: String, _ discount: Int) -> String {
        var result = ""
        let digits: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        var prefixSpace = true
        var tmp = ""

        func calPrice() -> String {
            tmp.removeFirst()
            let price = (Double(tmp)! * Double(100 - discount)).rounded()
            let result = "$\(price / 100)\(price.truncatingRemainder(dividingBy: 10) == 0 ? "0" : "")"
            tmp.removeAll()
            return result
        }

        for i in sentence {
            if i == " " {
                if tmp.count > 1 {
                    result += "\(calPrice()) "
                } else {
                    result += "\(tmp) "
                    tmp.removeAll()
                }
            } else if i == "$" {
                if tmp.isEmpty {
                    if prefixSpace {
                        tmp += "$"
                    } else {
                        result += "$"
                    }
                } else {
                    result += "\(tmp)$"
                    tmp.removeAll()
                }
            } else if digits.contains(i) {
                if tmp.isEmpty {
                    result += "\(i)"
                } else {
                    tmp += "\(i)"
                }
            } else {
                result += "\(tmp)\(i)"
                tmp.removeAll()
            }
            prefixSpace = i == " "
        }
        if tmp.count > 1 {
            result += calPrice()
        } else {
            result += "\(tmp)"
        }

        return result
    }
}

let sol = Solution()
// print(sol.discountPrices("there are $1 $2 and 5$ candies in the shop", 50))
// print(sol.discountPrices("1 2 $3 4 $5 $6 7 8$ $9 $10$", 100))
// print(sol.discountPrices("ka3caz4837h6ada4 r1 $602",9))
// print(sol.discountPrices("$7383692 5q $5870426",64))
// print(sol.discountPrices("$76111 ab $6 $" ,48))
print(sol.discountPrices("favsijl39l3ur$czt6rz hz $68050 lz9 ny 59o $4 $ $", 9))
