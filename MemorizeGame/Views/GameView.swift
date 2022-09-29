//
//  GameView.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 9/26/22.
//

import SwiftUI

struct GameView: View {
    @Binding var game: MemoryGame

    var body: some View {
            ZStack {
                VStack {
                    HeaderView(game: $game)
                    GameBoardView(game: $game)
                    FooterView(score: game.score, turns: game.numOfTurns)
                    Spacer(minLength: 10)
                }
            .background(Color("BackgroundColor"))
        }
    }
}

struct GameBoardView: View {
    @Binding var game: MemoryGame
    let columns = Array(repeating: GridItem(.adaptive(minimum: 90, maximum: 90)), count: 4)
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(game.cards) { card in
                    if card.isFaceUp {
                        CardFront(emoji: card.emoji, color: card.color, opacity: card.cardOpacity)
                    } else if !card.isFaceUp {
                        CardBack(color: card.color, opacity: card.cardOpacity)
                            .onTapGesture {
                                if !game.isGameOver {
                                    card.flip()
                                    game.saveTappedCards(card:  card)
                                }
                            }
                        }
                    }
                .aspectRatio(0.8, contentMode: .fit)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(game: .constant(MemoryGame()))
    }
}
