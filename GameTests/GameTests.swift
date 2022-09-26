//
//  GameTests.swift
//  GameTests
//
//  Created by Indy McGinnis on 9/26/22.
//

import XCTest

@testable import MemorizeGame

class GameTests: XCTestCase {
    var game: MemoryGame!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        game = MemoryGame()
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        game = nil
    }

    func savedCardsEqualCardsOnScreen() {
        XCTAssertEqual(game.savedMatchedCards, game.cards)
    }
    
    func savedCardsAreAllMatches() {
        for card in game.savedMatchedCards {
            XCTAssertEqual(card.isMatched, false)
        }
    }

}
