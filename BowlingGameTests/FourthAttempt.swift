//
//  Created by Peter Combee on 23/10/2023.
//

import XCTest

final class FourthAttemptTests: XCTestCase {
    
    struct BowlingGame {
        func roll(pins: Int) {}
        func score() -> Int { 0 }
    }
    
    func test_rollOneGutterBall_deliversScoreOfZero() {
        let sut = BowlingGame()
        
        sut.roll(pins: 0)
        
        XCTAssertEqual(sut.score(), 0)
    }
    
    func test_rollOnlyGutterBalls_deliversScoreOfZero() {
        let sut = BowlingGame()
        
        sut.roll(pins: 0, times: 20)
        
        XCTAssertEqual(sut.score(), 0)
    }
}

private extension FourthAttemptTests.BowlingGame {
    func roll(pins: Int, times: Int) {
        (0..<times).forEach { _ in
            roll(pins: pins)
        }
    }
}
