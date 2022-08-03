class MyCalendar {
    var list = [(Int, Int)]()
    init() {}
    
    func book(_ start: Int, _ end: Int) -> Bool {
        for i in list{
            if (i.0..<i.1).contains(start) || (i.0+1...i.1).contains(end) {
                return false
            }
            if start <= i.0 && end >= i.1{
                return false
            }
        }
        list.append((start, end))
        return true
    }
}
