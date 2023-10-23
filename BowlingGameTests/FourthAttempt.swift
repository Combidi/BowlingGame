//
//  Created by Peter Combee on 23/10/2023.
//

import XCTest

final class FourthAttemptTests: XCTestCase {
    
    struct BowlingGame {
        func roll(pins: Int) {}
        func score() -> Int { 0 }
    }
    
    func test_rollOneGutterBall_deliversScoreOnZero() {
        let sut = BowlingGame()

        sut.roll(pins: 0)
        
        XCTAssertEqual(sut.score(), 0)
    }
    
    func test_rollOnlyGutterBalls_deliversScoreOnZero() {
        let sut = BowlingGame()

        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        sut.roll(pins: 0)
        
        XCTAssertEqual(sut.score(), 0)
    }
}
