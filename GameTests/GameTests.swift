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
        game.score = -5
        game.endGame()
        XCTAssertEqual(game.isGameOver, true)
        
        game.score = 0
        game.endGame()
        XCTAssertEqual(game.isGameOver, true)
    }
    
    func testBadScoring() {
        game.score = -5
        game.updateAlertMessage()
        XCTAssertEqual(game.alertMessage, "Try again")
        XCTAssertEqual(game.alertMessageEmojis, "😕😕😕")
    }
    
    func testGoodScoring() {
        game.score = 80
        game.updateAlertMessage()
        XCTAssertEqual(game.alertMessage, "Good job!")
        XCTAssertEqual(game.alertMessageEmojis, "🎉🎉🎉")
    }
    func testGreatScoring() {
        game.score = 150
        game.updateAlertMessage()
        XCTAssertEqual(game.alertMessage, "Amazing!")
        XCTAssertEqual(game.alertMessageEmojis, "🎉🎉🎉")
    }
}
