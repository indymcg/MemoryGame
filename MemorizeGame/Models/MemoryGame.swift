//
//  MemoryGameModel.swift
//  MemorizeGame
//
//  Created by Indy McGinnis on 8/31/22.
//

import Foundation
import SwiftUI



struct MemoryGame {
    var cards: [Card]
    var chosenTheme: Theme = getTheme(theme: availableThemes.party)
    var lastTappedCard: Card? = nil
    var currentCard: Card? = nil
    var cardsAreMatched: Bool = false
    var savedMatchedCards: [Card] = []
    var isGameOver = false
    
     mutating func changeChosenTheme() {
        if chosenTheme.name == "Under the Sea" {
            chosenTheme = getTheme(theme: availableThemes.party)
            newGame()
            print(cards.count, chosenTheme.emojis.count)
        } else if chosenTheme.name == "Halloween" {
            chosenTheme = getTheme(theme: availableThemes.underTheSea)
            newGame()
            print(cards.count, chosenTheme.emojis.count)
        } else if chosenTheme.name == "Party" {
            chosenTheme = getTheme(theme: availableThemes.halloween)
            newGame()
            print(cards.count, chosenTheme.emojis.count)
        }
    }
    
    mutating func saveTappedCards(card: Card) {
        currentCard = card
        
        if lastTappedCard != nil && currentCard != nil {
            cardsAreMatched = checkForMatch(card1: &lastTappedCard!, card2: &currentCard!)
            
            //unwrap card optionals
            let firstCard = lastTappedCard!
            let secondCard = currentCard!
            
            if cardsAreMatched {
                firstCard.isMatched = true
                secondCard.isMatched = true
                savedMatchedCards.append(firstCard)
                savedMatchedCards.append(secondCard)
                changeMatchedCardVisibility()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    firstCard.flip()
                    secondCard.flip()
                }
            }
            lastTappedCard = nil
        } else {
            lastTappedCard = currentCard
        }
        print(savedMatchedCards)
    }
    
    func changeMatchedCardVisibility() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            savedMatchedCards.map { $0.cardOpacity = 0 }
        }
    }
    
    func checkForMatch(card1: inout Card, card2: inout Card) -> Bool {
        if card1.emoji == card2.emoji {
            return true
        } else {
            return false
        }
    }
    
    mutating func endGame() {
        if savedMatchedCards.count == chosenTheme.emojis.count {
            print("game over")
            isGameOver = true
        }
    }
    
    mutating func newGame() {
        lastTappedCard = nil
        currentCard = nil
        isGameOver = false
        cards = []
        savedMatchedCards = []
        for i in 0..<chosenTheme.emojis.count {
            let newCard = Card(emoji: chosenTheme.emojis[i], color: chosenTheme.color)
            newCard.isFaceUp = false
            cards.append(newCard)
        }
    }

    init() {
        cards = []
        for i in 0..<chosenTheme.emojis.count {
            let newCard = Card(emoji: chosenTheme.emojis[i], color: chosenTheme.color)
            cards.append(newCard)
        }
    }
    
}
    



