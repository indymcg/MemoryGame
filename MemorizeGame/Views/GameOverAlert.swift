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
        VStack(spacing: 5) {
            Text(game.alertMessageEmojis)
                .font(.title)
                .kerning(4.0)
                .shadow(radius: 2)
            
            Text(game.alertMessage)
                .font(.title)
                .foregroundColor(.black)
                .fontWeight(.semibold)
                .kerning(1.0)
            
            Text(game.alertScoreMessage)
                .font(.title3)
                .foregroundColor(.black)
                .kerning(0.5)
                .padding(3)
            
            Button {
                game.changeChosenTheme()
            } label: {
                Text("New Game")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .kerning(0.5)
                    .padding(15)
            }
                .frame(width: 150)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 3)
        }
        .multilineTextAlignment(.center)
    }
}

struct GameOverAlert_Previews: PreviewProvider {
    static var previews: some View {
        GameOverAlert(game: .constant(MemoryGame()))
    }
}
