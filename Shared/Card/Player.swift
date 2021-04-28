//
//  Player.swift
//  Solitairy (iOS)
//
//  Created by Connor Fitzpatrick on 4/27/21.
//

import Foundation

struct Player {
    let deck: Deck
    var totalPoints: Int
    var roundPoints: Int
    var piles: [Pile]
}
