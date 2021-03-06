//
//  ScoreScene3.swift
//  DuckColoringGame
//
//  Created by Eleanor Meriwether on 3/11/18.
//  Copyright © 2018 Eleanor Meriwether. All rights reserved.
//

import SpriteKit

class ScoreScene3: SKScene {
    
    override func didMove(to view: SKView) {
        
    ////////////////////////////////////////////////////////////////////////////////////////////
        let nameLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
        let ageLabel = SKLabelNode(fontNamed:"Montserrat-Regular")
        
        // PLACE NAME & AGE LABELS
        printLabel (scene: self, label: nameLabel, words: "\(userName)", xCoord: -123.989, yCoord: -486.239, fontSize: 28)
        printLabel (scene: self, label: ageLabel, words: "\(userAge)", xCoord: 237.836, yCoord: -486.239, fontSize: 28)
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE COMPLETED LABELS
        for (scene, firstTry) in correctFirstTries {
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rock", firstTry: firstTry, xCoord: 197.198, yCoord: 226)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lamp", firstTry: firstTry, xCoord: 197.198, yCoord: 190)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cat", firstTry: firstTry, xCoord: 197.198, yCoord: 154)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "lion", firstTry: firstTry, xCoord: 197.198, yCoord: 118)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hand", firstTry: firstTry, xCoord: 197.198, yCoord: 82)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "rain", firstTry: firstTry, xCoord: 197.198, yCoord: 46)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "duck", firstTry: firstTry, xCoord: 197.198, yCoord: 10)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "moon", firstTry: firstTry, xCoord: 197.198, yCoord: -26)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cow", firstTry: firstTry, xCoord: 197.198, yCoord: -62)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "trash", firstTry: firstTry, xCoord: 197.198, yCoord: -98)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "airplane", firstTry: firstTry, xCoord: 197.198, yCoord: -134)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "shoes", firstTry: firstTry, xCoord: 197.198, yCoord: -170)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cake", firstTry: firstTry, xCoord: 197.198, yCoord: -211)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "stroller", firstTry: firstTry, xCoord: 197.198, yCoord: -247)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "toast", firstTry: firstTry, xCoord: 197.198, yCoord: -283)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "hat", firstTry: firstTry, xCoord: 197.198, yCoord: -319)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "cookie", firstTry: firstTry, xCoord: 197.198, yCoord: -355)
            checkOrX_firstTry (scene: self, dictWord: scene, word: "mouse", firstTry: firstTry, xCoord: 197.198, yCoord: -391)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE INCORRECT-TOUCHES LABELS
        for (sceneString, numIncorrect) in numIncorrectPerScene {
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rock", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 218)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "lamp", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 184)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cat", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 147)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "lion", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 110)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "hand", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 73)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "rain", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: 36)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "duck", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -1)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "moon", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -38)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cow", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -75)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "trash", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -112)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "airplane", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -149)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "shoes", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -186)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cake", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -222)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "stroller", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -259)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "toast", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -296)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "hat", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -333)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "cookie", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -370)
            incorrectTouchesLabels (scene: self, sceneString: sceneString, word: "mouse", numIncorrect: numIncorrect, xCoord: -20.398, yCoord: -403)
        }
        
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE FIRST-TRY LABELS
        for (scene, correct) in numCorrectPerScene {
            checkOrX_completed (scene: self, dictWord: scene, word: "rock", correct: correct, xCoord: -259.663, yCoord: 226)
            checkOrX_completed (scene: self, dictWord: scene, word: "lamp", correct: correct, xCoord: -259.663, yCoord: 190)
            checkOrX_completed (scene: self, dictWord: scene, word: "cat", correct: correct, xCoord: -259.663, yCoord: 154)
            checkOrX_completed (scene: self, dictWord: scene, word: "lion", correct: correct, xCoord: -259.663, yCoord: 118)
            checkOrX_completed (scene: self, dictWord: scene, word: "hand", correct: correct, xCoord: -259.663, yCoord: 82)
            checkOrX_completed (scene: self, dictWord: scene, word: "rain", correct: correct, xCoord: -259.663, yCoord: 46)
            checkOrX_completed (scene: self, dictWord: scene, word: "duck", correct: correct, xCoord: -259.663, yCoord: 10)
            checkOrX_completed (scene: self, dictWord: scene, word: "moon", correct: correct, xCoord: -259.663, yCoord: -26)
            checkOrX_completed (scene: self, dictWord: scene, word: "cow", correct: correct, xCoord: -259.663, yCoord: -62)
            checkOrX_completed (scene: self, dictWord: scene, word: "trash", correct: correct, xCoord: -259.663, yCoord: -98)
            checkOrX_completed (scene: self, dictWord: scene, word: "airplane", correct: correct, xCoord: -259.663, yCoord: -134)
            checkOrX_completed (scene: self, dictWord: scene, word: "shoes", correct: correct, xCoord: -259.663, yCoord: -170)
            checkOrX_completed (scene: self, dictWord: scene, word: "cake", correct: correct, xCoord: -259.663, yCoord: -211)
            checkOrX_completed (scene: self, dictWord: scene, word: "stroller", correct: correct, xCoord: -259.663, yCoord: -247)
            checkOrX_completed (scene: self, dictWord: scene, word: "toast", correct: correct, xCoord: -259.663, yCoord: -283)
            checkOrX_completed (scene: self, dictWord: scene, word: "hat", correct: correct, xCoord: -259.663, yCoord: -319)
            checkOrX_completed (scene: self, dictWord: scene, word: "cookie", correct: correct, xCoord: -259.663, yCoord: -355)
            checkOrX_completed (scene: self, dictWord: scene, word: "mouse", correct: correct, xCoord: -259.663, yCoord: -391)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
    ////////////////////////////////////////////////////////////////////////////////////////////
        //CALCULATE AND PLACE ACCURACY LABELS
        for (scene, accuracy) in accuracyPerScene {
            accuracyLabels (scene: self, sceneString: scene, word: "rock", accuracy: accuracy, xCoord: 415.72, yCoord: 218)
            accuracyLabels (scene: self, sceneString: scene, word: "lamp", accuracy: accuracy, xCoord: 415.72, yCoord: 184)
            accuracyLabels (scene: self, sceneString: scene, word: "cat", accuracy: accuracy, xCoord: 415.72, yCoord: 147)
            accuracyLabels (scene: self, sceneString: scene, word: "lion", accuracy: accuracy, xCoord: 415.72, yCoord: 110)
            accuracyLabels (scene: self, sceneString: scene, word: "hand", accuracy: accuracy, xCoord: 415.72, yCoord: 73)
            accuracyLabels (scene: self, sceneString: scene, word: "rain", accuracy: accuracy, xCoord: 415.72, yCoord: 36)
            accuracyLabels (scene: self, sceneString: scene, word: "duck", accuracy: accuracy, xCoord: 415.72, yCoord: -1)
            accuracyLabels (scene: self, sceneString: scene, word: "moon", accuracy: accuracy, xCoord: 415.72, yCoord: -38)
            accuracyLabels (scene: self, sceneString: scene, word: "cow", accuracy: accuracy, xCoord: 415.72, yCoord: -75)
            accuracyLabels (scene: self, sceneString: scene, word: "trash", accuracy: accuracy, xCoord: 415.72, yCoord: -112)
            accuracyLabels (scene: self, sceneString: scene, word: "airplane", accuracy: accuracy, xCoord: 415.72, yCoord: -149)
            accuracyLabels (scene: self, sceneString: scene, word: "shoes", accuracy: accuracy, xCoord: 415.72, yCoord: -186)
            accuracyLabels (scene: self, sceneString: scene, word: "cake", accuracy: accuracy, xCoord: 415.72, yCoord: -222)
            accuracyLabels (scene: self, sceneString: scene, word: "stroller", accuracy: accuracy, xCoord: 415.72, yCoord: -259)
            accuracyLabels (scene: self, sceneString: scene, word: "toast", accuracy: accuracy, xCoord: 415.72, yCoord: -296)
            accuracyLabels (scene: self, sceneString: scene, word: "hat", accuracy: accuracy, xCoord: 415.72, yCoord: -333)
            accuracyLabels (scene: self, sceneString: scene, word: "cookie", accuracy: accuracy, xCoord: 415.72, yCoord: -370)
            accuracyLabels (scene: self, sceneString: scene, word: "mouse", accuracy: accuracy, xCoord: 415.72, yCoord: -403)
        }
    ////////////////////////////////////////////////////////////////////////////////////////////
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // variable for buttons
        let backButton = self.childNode(withName: "back")
        let nextButton = self.childNode(withName: "next")
        
        // variable to keep track of touch
        let touch = touches.first!
        
        // if next button is touched
        if nextButton!.contains(touch.location(in:self)){
            transitionScene (currentScene: self, sceneString: "ScoreScene4", waitTime: 0, fadeTime: 0)
        }
        
        // if back button is touched
        if backButton!.contains(touch.location(in: self)) {
            transitionScene (currentScene: self, sceneString: "ScoreScene2", waitTime: 0, fadeTime: 0)
        }
    }
}
