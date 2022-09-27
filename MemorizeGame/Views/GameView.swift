//
//  GameView.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 9/26/22.
//

import SwiftUI

struct GameView: View {
    @Binding var game: MemoryGame
    let portraitColumns = Array(repeating: GridItem(.adaptive(minimum: 80, maximum: 100)), count: 4)

    var body: some View {
        ZStack {
            VStack {
                HeaderView(game: $game)
                    .padding(.bottom, -10)
                LazyVGrid(columns: portraitColumns, spacing: 15) {
                    ForEach(game.cards) { card in
                        if card.isFaceUp {
                            CardFront(emoji: card.emoji, color: card.color, opacity: card.cardOpacity)
                        } else if !card.isFaceUp {
                            CardBack(color: card.color, opacity: card.cardOpacity)
                                .onTapGesture {
                                    card.flip()
                                    game.saveTappedCards(card:  card)
                                }
                        }
                    }
                    .aspectRatio(2/3, contentMode: .fit)
                }
                .padding(.leading)
                .padding(.trailing)
                
                FooterView(score: game.score, turns: game.numOfTurns)
            }
        }
        .background(Color("BackgroundColor"))
    }

}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView()
//    }
//}
