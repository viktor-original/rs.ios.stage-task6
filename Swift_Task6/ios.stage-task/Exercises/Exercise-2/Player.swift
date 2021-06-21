import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        
        guard let currentHand = hand else { return false }
        for currentCard in currentHand {
            
            if currentCard.value == card.value {
                return true
            }
        
        }
        
        return false
        
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        
        for (firstPlayerCard, secondPlayerCard) in table {
            
            if checkIfCanTossWhenAttacking(card: firstPlayerCard) || checkIfCanTossWhenAttacking(card: secondPlayerCard) {
                return true
            }
        }

        return false
        
    }
}
