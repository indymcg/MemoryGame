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
    
    func testPerfectScore() {
        game.numOfTurns = 15
        let score = game.updateScore()
        XCTAssertEqual(score, 100)
    }
    
    
    func testGoodScoreEdgeCase() {
        game.numOfTurns = 16
        let score = game.updateScore()
        XCTAssertEqual(score, 100)
    }
    
}
