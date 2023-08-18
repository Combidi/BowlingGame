//
//  Created by Peter Combee on 17/08/2023.
//


/*
 Game rules
 
 roll = an opportunity to knock down pins
 frame = a set of two rolls to knock down 10 pins
 gutter = ball that rolls down the gutter
 spare = all ten pins with two balls
 strike = all ten pins with one ball
 
 The game consists of 10 frames. In each frame the player has two opportunities to knock down 10 pins. The score for the frame is the total number of pins knocked down, plus bonuses for strikes and spares. This means that his turn ends if player manages to knock down 10 pins in one roll.
 
 A spare is when the player knocks down all 10 pins in two tries. The bonus for that frame is the number of pins knocked down by the next roll. So in frame 3 above, the score is 10 (the total number knocked down) plus a bonus of 5 (the number of pins knocked down on the next roll.)
 
 A strike is when the player knocks down all 10 pins on his first try. The bonus for that frame is the value of the next two balls rolled.
 
 In the tenth frame a player who rolls a spare or strike is allowed to roll the extra balls to complete the frame. However no more than three balls can be rolled in tenth frame.

 
 
 
 Requirements
 
 - We should be able to get the score at anytime during the game.
  
 */

import XCTest

struct BowlingGame {
    
    enum Roll: Equatable {
        case gutter
        case pins(Int)
    }
    
    static func determineScore(forRolls rolls: [Roll]) -> Int {
        guard let first = rolls.first else { return 0 }
        switch first {
        case .gutter: return 0
        case let .pins(count): return count
        }
    }
}

final class BowlingScoreTests: XCTestCase {
    
    func test_scoreForOneGutterRoll() {
        let score = BowlingGame
            .determineScore(forRolls: [.gutter])
        
        XCTAssertEqual(score, 0)
    }
    
    func test_scoreGutterGame() {
        let rolls = [BowlingGame.Roll](repeating: .gutter, count: 20)
        let score = BowlingGame
            .determineScore(forRolls: rolls)
        
        XCTAssertEqual(score, 0)
    }
        
    func test_scoreForSingleRoll() {
        assertThatDetermineScore(forSingleRoll: .pins(1), equals: 1)
        assertThatDetermineScore(forSingleRoll: .pins(2), equals: 2)
        assertThatDetermineScore(forSingleRoll: .pins(3), equals: 3)
        assertThatDetermineScore(forSingleRoll: .pins(4), equals: 4)
        assertThatDetermineScore(forSingleRoll: .pins(5), equals: 5)
        assertThatDetermineScore(forSingleRoll: .pins(6), equals: 6)
        assertThatDetermineScore(forSingleRoll: .pins(7), equals: 7)
        assertThatDetermineScore(forSingleRoll: .pins(8), equals: 8)
        assertThatDetermineScore(forSingleRoll: .pins(9), equals: 9)
    }

    // MARK: Helpers
    
    private func assertThatDetermineScore(
        forSingleRoll roll: BowlingGame.Roll,
        equals expectedScore: Int,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let score = BowlingGame
            .determineScore(forRolls: [roll])
        
        XCTAssertTrue(score == expectedScore, "Expected a score of \(expectedScore), got \(score) instead", file: file, line: line)
    }
}
