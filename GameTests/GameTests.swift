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
        game = MemoryGame()

    }

    override func tearDownWithError() throws {
        game = nil
    }
    
    func testEndGame() {
        game.score = 0
        game.endGame()
        XCTAssertEqual(game.isGameOver, true)
        XCTAssertEqual(game.alertMessage, "Try again")
    }
    
    func testScoring() {
        game.numOfTurns = 30
        game.score = 5
        game.updateAlertMessage()
        XCTAssertEqual(game.alertMessage, "Good job!")
        XCTAssertEqual(game.isGameOver, false)
    }
    
    
}
