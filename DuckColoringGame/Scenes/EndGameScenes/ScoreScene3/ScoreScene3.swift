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
            resetAllGameStats_coloring()
            transitionScene (currentScene: self, sceneString: "ScoreScene2", waitTime: 0, fadeTime: 0)
        }
    }
}