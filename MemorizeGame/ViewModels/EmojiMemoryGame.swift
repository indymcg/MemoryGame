//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 8/30/22.
//

import SwiftUI



class EmojiMemoryGame: ObservableObject {
    @Published var memoryGame: MemoryGame
    
    func newGame() {
        memoryGame = MemoryGame()
    }
    
    init(memoryGame: MemoryGame) {
        self.memoryGame = memoryGame
    }
 }
