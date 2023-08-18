//
//  Created by Peter Combee on 17/08/2023.
//

import XCTest

final class Game {
    private var rolls = [Int](repeating: 0, count: 21)
    private var currentRoll = 0
    
    func roll(_ pins: Int) {
        rolls[currentRoll] = pins
        currentRoll += 1
    }
    func score() -> Int {
        var score = 0
        var roll = 0
        for _ in 1...10 {
            if isStrike(roll) {
                score += 10 + strikeBonus(for: roll)
                roll += 1
            } else if isSpare(roll) {
                score += 10 + spareBonus(for: roll)
                roll += 2
            } else {
                score += rolls[roll] + rolls[roll + 1]
                roll += 2
            }
        }
        return score
    }
    
    private func isStrike(_ roll: Int) -> Bool {
        rolls[roll] == 10
    }
    
    private func isSpare(_ roll: Int) -> Bool {
        rolls[roll] + rolls[roll + 1] == 10
    }
    
    private func strikeBonus(for roll: Int) -> Int {
        rolls[roll + 1] + rolls[roll + 2]
    }
    
    private func spareBonus(for roll: Int) -> Int {
        rolls[roll + 2]
    }
    
    private func sumOfBallsInFrame(for roll: Int) -> Int {
        rolls[roll] + rolls[roll + 1]
    }
}

final class BowlingGameTests: XCTestCase {
    func test_gutterGame() {
        let game = Game()
        
        game.rollMany(pins: 0, times: 20)
        
        XCTAssertEqual(game.score(), 0)
    }
    
    func test_allInOne() {
        let game = Game()
        
        game.rollMany(pins: 1, times: 20)
        
        XCTAssertEqual(game.score(), 20)
    }
    
    func test_oneSpare() {
        let game = Game()
        
        game.rollSpare()
        game.roll(3)
        game.rollMany(pins: 0, times: 17)
        
        XCTAssertEqual(game.score(), 16)
    }
    
    func testOneStrike() {
        let game = Game()

        game.rollStrike()
        game.roll(3)
        game.roll(4)

        game.rollMany(pins: 0, times: 16)

        XCTAssertEqual(game.score(), 24)
    }
    
    func testPerfectGame() {
        let game = Game()
        
        game.rollMany(pins: 10, times: 12)

        XCTAssertEqual(game.score(), 300)
    }
}

// MARK: Helpers

private extension Game {
    func rollSpare() {
        roll(5)
        roll(5)
    }
    
    func rollStrike() {
        roll(10)
    }
    
    func rollMany(pins: Int, times: Int) {
        for _ in 1...times {
            roll(pins)
        }
    }
}
