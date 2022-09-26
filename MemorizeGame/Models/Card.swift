//
//  Card.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 9/20/22.
//

import Foundation

class Card: Identifiable, Equatable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        return lhs.emoji == rhs.emoji 
    }
    
    var id = UUID()
    var isFaceUp = false
    var isMatched = false
    var color: String
    var emoji: String
    var cardOpacity = 1.0

    func flip() {
        isFaceUp.toggle()
    }
    
    init(emoji: String, color: String) {
        self.emoji = emoji
        self.color = color
    }
}
