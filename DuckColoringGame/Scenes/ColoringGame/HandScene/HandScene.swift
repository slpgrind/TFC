//
//  HandScene.swift
//  TimeForChildrenGame
//
//  Created by Eleanor Meriwether on 12/7/17.
//  Copyright © 2017 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class HandScene: SKScene {
    // local variables to keep track of whether instructions are playing
    var instructionsComplete = false
    var reminderComplete = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var hand_incorrectTouches = 0
    var hand_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // remove scene's physics body, so alpha mask on target sprite is accessible
        self.physicsBody = nil
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
        run(instructions, completion: { self.instructionsComplete = true })
        
        /////////////////////////////////
        ////// IDLE REMINDER TIMER //////
        /////////////////////////////////
        let oneSecTimer = SKAction.wait(forDuration: 1.0)
        var timerCount = 1
        var currentTouches = 0
        
        // set up sequence for if the scene has not been touched for 10 seconds: play the idle reminder
        let reminderIfIdle = SKAction.run {
            self.reminderComplete = false
            let hand_reminder = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
            self.run(hand_reminder, completion: { self.reminderComplete = true} )
        }
        
        // for every one second, do this action:
        let timerAction = SKAction.run {
            // if no touch...
            if (self.totalTouches - currentTouches == 0) {
                // ...timer progresses one second...
                timerCount += 1
            }
                // ... else if a touch...
            else {
                // ... increase touch count...
                currentTouches += 1
                // ... and start timer over...
                timerCount = 1
            }
            // if timer seconds are divisable by 10 ...
            if (timerCount % 10 == 0) {
                // ... play the reminder.
                self.run(reminderIfIdle)
            }
        }
        // set up sequence: run 1s timer, then play action
        let timerActionSequence = SKAction.sequence([oneSecTimer, timerAction])
        // repeat the timer forever
        let repeatTimerActionSequence = SKAction.repeatForever(timerActionSequence)
        run(repeatTimerActionSequence)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // local variable for hand sprite
        let hand = self.childNode(withName: "hand_bw")
        
        // if no instructions are playing
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            
            //If hand sprite's alpha mask is touched...
            if (physicsWorld.body(at: touch.location(in: self)) == hand?.physicsBody) && (sceneOver == false) {
                sceneOver = true
                hand_correctTouches += 1
                correctTouches += 1
                
                // if there weren't any incorrect touches, add to game-wide numOfCorrectFirstTry
                if (hand_incorrectTouches == 0) {
                    numOfCorrectFirstTry += 1
                    numOfCorrectSimpleBG += 1
                    numOfCorrectSetSize4 += 1
                    
                    correctFirstTriesArray.append("hand")
                    correctTouchesArray.append("hand")
                    correctSetSize4.append("hand")
                    correctBGSimple.append("hand")
                }
                
                // Change sprite to colored hand
                let coloredhand:SKTexture = SKTexture(imageNamed: "handScene_hand_colored")
                let changeToColored:SKAction = SKAction.animate(with: [coloredhand], timePerFrame: 0.0001)
                hand!.run(changeToColored)
                
                //Variables for hand audio
                let clap = SKAction.playSoundFileNamed("hand", waitForCompletion: true)
                
                //Run all actions
                hand!.run(clap)
                
                //Variables to switch screens
                let fadeOut = SKAction.fadeOut(withDuration:2)
                let wait2 = SKAction.wait(forDuration: 2)
                let sequenceFade = SKAction.sequence([wait2, fadeOut])
                run(sequenceFade) {
                    let duckScene = SKScene(fileNamed: "DuckScene")
                    duckScene?.scaleMode = SKSceneScaleMode.aspectFill
                    self.scene!.view?.presentScene(duckScene!)
                }
            }
            else {
                hand_incorrectTouches += 1
                incorrectTouches += 1
                
                // Play wrong noise
                let wrong = SKAction.playSoundFileNamed("wrong", waitForCompletion: true)
                hand?.run(wrong)
            }
            
            // play reminder instructions if user has touched screen 3 times incorrectly
            if (hand_incorrectTouches % 3 == 0) && hand_correctTouches < 1 {
                reminderComplete = false
                let hand_reminder = SKAction.playSoundFileNamed("instructions_hamburger", waitForCompletion: true)
                run(hand_reminder, completion: { self.reminderComplete = true} )
            }
        }
        // update totalTouches variable for idle reminder
        totalTouches = hand_correctTouches + hand_incorrectTouches
    }
}





