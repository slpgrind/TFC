//
//  TomatoScene.swift
//  DuckColoringGame
//
//  Created by Gustavo C Figueroa on 3/6/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit
import GameplayKit

class TomatoScene: SKScene {
    //Timer Variables
    var gameTimer: Timer!
    var gameCounter = 0
    
    private var foodNode1:SKNode?
    private var foodNode2:SKNode?
    private var foodNode3:SKNode?
    private var monsterNode:SKNode?
    
    private var selectedNode:SKNode?
    private var nodeIsSelected:Bool?
    
    var tomato_incorrectTouches = 0
    var tomato_correctTouches = 0
    
    var instructionsComplete:Bool = false
    var feedbackComplete:Bool = true
    
    var sceneOver = false
    
    override func didMove(to view: SKView) {
        foodNode1 = self.childNode(withName: "tomato")
        foodNode2 = self.childNode(withName: "raisin")
        foodNode3 = self.childNode(withName: "egg")
        monsterNode = self.childNode(withName: "Monster")
        playInstructionsWithName(audioName: "instructions_raisins")
    }
    
    ////////////////////////////
    /////Helper Functions///////
    ////////////////////////////
    @objc func runTimedCode(){
        if gameCounter == 60{
            nextScene(sceneName: "CakeScene_Monster")
        } else if gameCounter%20 == 0 && gameCounter != 0{
            playFeedbackWithName(audioName: "reminder_raisins")
            gameCounter = gameCounter + 1
        }else{
            gameCounter = gameCounter + 1
        }
    }
    
    func playInstructionsWithName(audioName:String){
        instructionsComplete = false
        let instructions = SKAction.playSoundFileNamed(audioName, waitForCompletion: true)
        self.run(instructions, completion: {
            self.instructionsComplete = true
            self.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runTimedCode), userInfo: nil, repeats: true)
        })
    }
    
    func playFeedbackWithName(audioName:String){
        feedbackComplete = false
        let instructions = SKAction.playSoundFileNamed(audioName, waitForCompletion: true)
        monsterNode!.run(instructions, completion: { self.feedbackComplete = true })
    }
    
    func animateMonster(withAudio:String) {
        let openMouth = SKTexture(imageNamed: "monsterScene_stillMonster")
        let closedMouth = SKTexture(imageNamed: "monsterScene_chewingMonster")
        let animation = SKAction.animate(with: [openMouth, closedMouth], timePerFrame: 0.2)
        let openMouthAction = SKAction.repeat(animation, count: 10)
        monsterNode!.run(openMouthAction)
        playFeedbackWithName(audioName: withAudio)
    }
    
    func nextScene(sceneName:String){
        let fadeOut = SKAction.fadeOut(withDuration:1)
        let wait2 = SKAction.wait(forDuration: 1)
        let sequenceFade = SKAction.sequence([wait2, fadeOut])
        run(sequenceFade) {
            let sceneToLoad = SKScene(fileNamed: sceneName)
            sceneToLoad?.scaleMode = SKSceneScaleMode.aspectFill
            self.scene!.view?.presentScene(sceneToLoad!)}
    }
    ////////////////////////////
    ////////////////////////////
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (feedbackComplete == true) && (sceneOver == false){
            let touch = touches.first!
            let touchLocation = touch.location(in: self)
            if (self.atPoint(touchLocation).name == "tomato"){
                selectedNode = foodNode1
                nodeIsSelected = true
            } else if (self.atPoint(touchLocation).name == "raisin"){
                selectedNode = foodNode2
                nodeIsSelected = true
            }else if (self.atPoint(touchLocation).name == "egg"){
                selectedNode = foodNode3
                nodeIsSelected = true
            }else{
                playFeedbackWithName(audioName: "wrong")
                selectedNode = nil
                nodeIsSelected = false
            }
        }
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if  (instructionsComplete == true) && (sceneOver == false) && (nodeIsSelected == true) && (feedbackComplete == true) {
            for touch in touches{
                let location = touch.location(in: self)
                selectedNode?.position = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (instructionsComplete == true) && (sceneOver == false) && (nodeIsSelected == true) && (feedbackComplete == true){
            let touch = touches.first!
            let touchLocation = touch.location(in: self)
            
            for items in self.nodes(at: touchLocation){
                if items.name == "Monster"{
                    if (selectedNode?.name == "raisin"){
                        tomato_correctTouches += 1
                        selectedNode?.removeFromParent()
                        sceneOver = true
                        animateMonster(withAudio: "Sound_Chewing")
                        nextScene(sceneName: "CakeScene_Monster")
                    }else{
                        playFeedbackWithName(audioName: "wrong")
                        tomato_incorrectTouches += 1
                        if tomato_incorrectTouches > 15{
                            sceneOver = true
                            nextScene(sceneName: "CakeScene_Monster")
                        }
                    }
                }
            }
            selectedNode = nil
            nodeIsSelected = false
        }
    }
}
