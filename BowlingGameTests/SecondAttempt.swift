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

private extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

final class SecondAttemptTestt: XCTestCase {

    struct BowlingGame {
            
        private struct Frame {
            let firstRoll: Int
            let secondRoll: Int?
        }
        
        static func determineScore(forRolls rolls: [Int]) -> Int {
            var score = 0
            var frames: [Frame] = []
            var remainingRolls = Array(rolls.reversed())
            
            repeat {
                let first = remainingRolls.popLast()
                let second = remainingRolls.popLast()
                let firstChunk = remainingRolls.dropLast(2)
                if firstChunk.reduce(0, +) == 10 {
                    
                }
            } while !remainingRolls.isEmpty
            
            
        }
    }
    
    func test_scoreForOneGutterRoll() {
        assertThatDetermineScore(forRolls: [0], equals: 0)
    }
    
    func test_scoreGutterGame() {
        let rolls: [Int] = Array(repeating: 0, count: 20)
        assertThatDetermineScore(forRolls: rolls, equals: 0)
    }
        
    func test_scoreForSingleRoll() {
        assertThatDetermineScore(forRolls: [1], equals: 1)
        assertThatDetermineScore(forRolls: [2], equals: 2)
        assertThatDetermineScore(forRolls: [3], equals: 3)
        assertThatDetermineScore(forRolls: [4], equals: 4)
        assertThatDetermineScore(forRolls: [5], equals: 5)
        assertThatDetermineScore(forRolls: [6], equals: 6)
        assertThatDetermineScore(forRolls: [7], equals: 7)
        assertThatDetermineScore(forRolls: [8], equals: 8)
        assertThatDetermineScore(forRolls: [9], equals: 9)
    }

    func test_scroreForRollingOneTwentyTimes() {
        let rolls: [Int] = Array(repeating: 1, count: 20)
        assertThatDetermineScore(forRolls: rolls, equals: 20)
    }
        
    // MARK: Helpers
    
    private func assertThatDetermineScore(
        forRolls rolls: [Int],
        equals expectedScore: Int,
        file: StaticString = #filePath,
        line: UInt = #line
    ) {
        let score = BowlingGame
            .determineScore(forRolls: rolls)
        
        XCTAssertTrue(score == expectedScore, "Expected a score of \(expectedScore), got \(score) instead", file: file, line: line)
    }
}
