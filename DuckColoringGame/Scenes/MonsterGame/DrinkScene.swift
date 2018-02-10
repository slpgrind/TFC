import SpriteKit
import GameplayKit

class DrinkScene: SKScene {

    private var monsterObject:SKNode?
    // Variables for draggable items
    private var item1Object:SKNode?
    private var item2Object:SKNode?
    
    // Variables for tracking SpriteNode that is being dragged
    private var objectSelected:SKNode?
    private var objectIsSelected:Bool?
    
    // Variable to track location of dragged item's original position
    private var defaultPosition:CGPoint?
    
    // Local variables to keep track of whether instructions are playing
    var instructionsComplete:Bool = false
    var reminderComplete:Bool = true
    
    // local variable to keep track of whether correct sprite has been touched
    var sceneOver = false
    
    // local variables to keep track of touches for this scene
    var drink_incorrectTouches = 0
    var drink_correctTouches = 0
    var totalTouches = 0
    
    override func didMove(to view: SKView) {
        // Link SKS to appropriate variables
        monsterObject = self.childNode(withName: "Monster")
        item1Object = self.childNode(withName: "item1")
        item2Object = self.childNode(withName: "item2")
        
        // run the introductory instructions, then flag instructionsComplete as true
        let instructions = SKAction.playSoundFileNamed("instructions_drink", waitForCompletion: true)
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
            let drink_reminder = SKAction.playSoundFileNamed("instructions_drink", waitForCompletion: true)
            self.run(drink_reminder, completion: { self.reminderComplete = true} )
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
            if (timerCount % 15 == 0) {
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
        // If no audio is playing and the scene is not over...
        if (instructionsComplete == true) && (reminderComplete == true) && (sceneOver == false){
            let touch = touches.first!
            // If a touch is detected on item 1...
            if self.atPoint((touch.location(in: self))).name == "item1" {
                // Update variables to track item 1
                objectSelected = item1Object
                objectIsSelected = true
                defaultPosition = objectSelected?.position
            // Else if a touch is detected on item 2...
            }else if self.atPoint((touch.location(in: self))).name == "item2"{
                // Update variables to track item 2
                objectSelected = item2Object
                objectIsSelected = true
                defaultPosition = objectSelected?.position
            }else{
                // Else update variables to reflect that no item has been touched
                objectSelected = nil
                objectIsSelected = false
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // If an item is selected, no audio is playing, and the scene is not over...
        if (objectSelected != nil) && (sceneOver == false) && (instructionsComplete == true) && (reminderComplete == true){
            for touch in touches{
                // Update the location of the selected item as it it dragged across the screen
                let location = touch.location(in: self)
                objectSelected?.position = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        // If, at the point the user releases their touch, contains the Monster object, and item is selcted,
        // and the selected object is item1 (the correct item)...
        if self.atPoint((touch?.location(in: self))!).name == "Monster" && (objectIsSelected == true) && (objectSelected == item1Object){
            // Award points for correct touch
            drink_correctTouches += 1
            correctTouches += 1
            // Remove the selected object from the screen
            objectSelected?.removeFromParent()
            
            //Set and Run instructions for  Scene transition
            let fadeOut = SKAction.fadeOut(withDuration:1)
            let wait2 = SKAction.wait(forDuration: 1)
            let sequenceFade = SKAction.sequence([wait2, fadeOut])
            run(sequenceFade) {
                let ScoreScene = SKScene(fileNamed: "ScoreScene")
                ScoreScene?.scaleMode = SKSceneScaleMode.aspectFill
                self.scene!.view?.presentScene(ScoreScene!)}
        } else{
            // Else if the the item selected was the wrong item...
            // Restore to original location
            objectSelected?.position = defaultPosition!
            // Award incorrect points
            drink_incorrectTouches += 1
            incorrectTouches += 1
            //Reset varibles for tracking
            objectIsSelected = false
            objectSelected = nil
            //Need to fix bug of not replaying audio after 3 incorrect moves.
        }
    }
}