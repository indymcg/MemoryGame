//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 8/30/22.
//

import SwiftUI

struct ContentView: View {
    @State private var game = MemoryGame()
    @State private var cardIsNotTappable = false
    
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    let portraitColumns = Array(repeating: GridItem(.adaptive(minimum: 80, maximum: 100)), count: 4)

    var body: some View {
        ScrollView(.vertical) {
                HeaderView(game: $game)
                    LazyVGrid(columns: portraitColumns) {
                                ForEach(game.cards) { card in
                                    Button {
                                        card.flip()
                                        game.saveTappedCards(card:  card)
                                    } label: {
                                       if card.isFaceUp {
                                            CardFront(emoji: card.emoji, color: card.color, opacity: card.cardOpacity)
                                       } else if !card.isFaceUp {
                                           CardBack(color: card.color, opacity: card.cardOpacity)
                                       }
                                }
                            }
                            .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
        
            .alert("You matched all the cards! \n 🎉🎉🎉", isPresented: $game.isGameOver, actions: {
                Button("OK") { game.newGame() }
            }) {
                Text("Tap OK to play again")
            }

    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
            .preferredColorScheme(.dark)
    }
}
