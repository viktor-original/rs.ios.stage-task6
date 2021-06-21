import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var seatsCount: Int
    
    
    init(n: Int) {
        seatsCount = n
    }
    
    func seat() -> Int {
        
        var seat: Int = 0
        var seatNumber: Int = 0
        let lastSeat: Int = seatsCount - 1
        
        if seats.isEmpty {
            seats.append(0)
            
        } else {
            
            if lastSeat != seats.last {
                
                if seat < (lastSeat - seats.last!) {
                    seatNumber = lastSeat
                    seats.append(lastSeat)
                }
                
            } else {
                
                for index in 0..<seats.count - 1 {
                    
                    if (seat < (seats[index + 1] - seats[index]) / 2) {
                        seat = ((seats[index + 1] - seats[index]) / 2)
                        seatNumber = (seats[index] + seat)
                    }
                    
                }
                
                seats.append(seatNumber)
                seats = seats.sorted()
                
            }
            
        }
        
    return seatNumber
        
}
        
    func leave(_ p: Int) {
        
        guard let index = seats.firstIndex(of: p) else { return }
             seats.remove(at: index)
        
    }
}

