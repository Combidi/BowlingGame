
import XCTest

final class ThirdAttemptTests: XCTestCase {
    
    final class Game {
        
        private var rolls: [Int] = .init(repeating: 0, count: 20)
        private var currentRoll = 0
        
        func roll(pins: Int) { rolls[currentRoll] = pins; currentRoll += 1 }
        
        func score() -> Int {
            var currentRoll = 0
            var score = 0
            let frames = (0..<10)
            
            frames.forEach { _ in
                if isStrike(for: currentRoll) {
                    score += rolls[currentRoll]
                    score += strikeBonus(for: currentRoll)
                    currentRoll += 1
                } else if isSpare(for: currentRoll) {
                    score += rolls[currentRoll]
                    score += rolls[currentRoll + 1]
                    score += spareBonus(for: currentRoll)
                    currentRoll += 2
                } else {
                    score += rolls[currentRoll]
                    score += rolls[currentRoll + 1]
                    currentRoll += 2
                }
            }
            return score
        }
        
        private func isSpare(for roll: Int) -> Bool {
            rolls[roll] + rolls[roll + 1] == 10
        }
        
        private func spareBonus(for roll: Int) -> Int {
            rolls[roll + 2]
        }
        
        private func isStrike(for roll: Int) -> Bool {
            rolls[roll] == 10
        }
        
        private func strikeBonus(for roll: Int) -> Int {
            rolls[roll + 1] + rolls[roll + 2]
        }
    }
    
    func test_gutterGame_returnsScoreOfZero() {
        let sut = Game()
        let frames = (0..<10)
        
        frames.forEach { _ in
            sut.roll(pins: 0)
            sut.roll(pins: 0)
        }

        XCTAssertEqual(sut.score(), 0)
    }
    
    func test_gameOfOnes_returnsScoreOfTwenty() {
        let sut = Game()
        let frames = (0..<10)
        
        frames.forEach { _ in
            sut.roll(pins: 1)
            sut.roll(pins: 1)
        }

        XCTAssertEqual(sut.score(), 20)
    }
    
    func test_rollingSpare_appliesSpareBonus() {
        let sut = Game()
        
        // rolling a spare
        sut.roll(pins: 5)
        sut.roll(pins: 5)
        
        // this roll will be applied as the spare bonus
        sut.roll(pins: 1)
        sut.roll(pins: 0)
        
        
        let remainingFrames = (0..<8)
        remainingFrames.forEach { _ in
            sut.roll(pins: 0)
            sut.roll(pins: 0)
        }
        
        XCTAssertEqual(sut.score(), 12)
    }
    
    func test_rollingSpare_appliesStrikeBonus() {
        let sut = Game()
        
        // rolling a spare
        sut.roll(pins: 10)
        
        // these rolls will be applied as the spare bonus
        sut.roll(pins: 1)
        sut.roll(pins: 8)
        
        let remainingFrames = (0..<8)
        remainingFrames.forEach { _ in
            sut.roll(pins: 0)
            sut.roll(pins: 0)
        }
        
        XCTAssertEqual(sut.score(), 28)
    }

    func test_perfectGame_deliversScoreOf300() {
        let sut = Game()
        let frames = (0..<12)
        
        frames.forEach { _ in
            sut.roll(pins: 10)
        }

        XCTAssertEqual(sut.score(), 300)
    }
}
