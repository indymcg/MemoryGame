//
//  ContentView.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 8/30/22.
//

import SwiftUI

struct ContentView: View {
    @State private var game = MemoryGame()

    var body: some View {
        if game.isGameOver {
            ZStack {
                GameView(game: $game)
                    .blur(radius: 3)
                GameOverAlert(game: $game)
            }
            
        } else {
            GameView(game: $game)
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
