//
//  GameOverAlert.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 9/26/22.
//

import SwiftUI

struct GameOverAlert: View {
    @Binding var game: MemoryGame
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .shadow(radius: 5)
                .foregroundColor(.white)
                .frame(maxWidth: 350, maxHeight: 200)

            GameOverAlertText(game: $game)
        }
    }
}

struct GameOverAlertText: View {
    @Binding var game: MemoryGame
    
    var body: some View {
        VStack {
            Text("🎉🎉🎉")
                .font(.title)
                .padding(3)
                .shadow(radius: 2)
            
            Text("You matched all the cards!")
                .font(.title2)
                .foregroundColor(.black)
                .fontWeight(.semibold)
            
            Button {
                game.changeChosenTheme()
            } label: {
                Text("Play Again")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .padding(8)
            }
            .frame(width: 105)
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(radius: 3)
        }
        .multilineTextAlignment(.center)
    }
}

//struct GameOverAlert_Previews: PreviewProvider {
//    static var previews: some View {
//        GameOverAlert()
//    }
//}
