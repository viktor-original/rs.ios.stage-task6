import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        
        var startPlayer: Player?
        var minTrump: Card = .init(suit: .hearts, value: .ace)
        
        for player in players {
            
            for card in player.hand! {
                
                if card.isTrump {
                    
                    if (card.value.rawValue < minTrump.value.rawValue) {
                        startPlayer = player
                        minTrump = card
                    }
                }
            }
        }
        
        return startPlayer
        
    }
}
