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
    
    enum Roll {
        case gutter
    }
    
    static func determineScore(forRolls: [Roll]) -> Int { 0 }
}

final class BowlingScoreTests: XCTestCase {

    func test_gutterGame() {
        let score = BowlingGame
            .determineScore(forRolls: [.gutter])
        
        XCTAssertEqual(score, 0)
    }
}
