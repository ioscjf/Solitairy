//
//  Pile.swift
//  Solitairy (iOS)
//
//  Created by Connor Fitzpatrick on 4/27/21.
//

import Foundation

struct Pile {
    var cards: [Card]
    let isPlayer: Bool
    
    func canPlay(card: Card) -> Bool {
        if (isPlayer) {
            if (cards.count == 0) {
                return card.isKing ? true : false
            } else { // Only if a card is the opposite suit and one lower than the previous can it be played
                return cards.last!.isRed && !card.isRed && card.numberValue + 1 == cards.last!.numberValue ? true : false
            }
        } else { // Board
            if (cards.count == 0) {
                return card.isAce ? true : false
            } else { // Only if a card is the same suit and one higher than the previous can it be played
                return cards.last!.suit == card.suit && cards.last!.numberValue + 1 == card.numberValue ? true : false
            }
        }
    }
}
