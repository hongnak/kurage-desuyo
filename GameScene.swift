//
//  GameScene.swift
//  test
//
//  Created by shohei on 2018/08/05.
//  Copyright © 2018年 Shohei Kobayashi. All rights reserved.
//

import SpriteKit
import GameplayKit
import Social

class GameScene: SKScene {
  
  var titleLabel = SKLabelNode()
  var startLabel = SKLabelNode()
  var fishLabel = SKLabelNode()
  var bestScoreLabel = SKLabelNode()
  var twitterIcon = SKSpriteNode()
  
  override func didMove(to view: SKView) {
    titleLabel = self.childNode(withName: "titleLabel") as! SKLabelNode
    startLabel = self.childNode(withName: "startLabel") as! SKLabelNode
    startLabel.text = "Tap to Start"
    fishLabel = self.childNode(withName: "fishLabel") as! SKLabelNode
    bestScoreLabel = self.childNode(withName: "bestScoreLabel") as! SKLabelNode
    twitterIcon = self.childNode(withName: "twitterIcon") as! SKSpriteNode

    let fadeActions = SKAction.sequence([SKAction.fadeIn(withDuration: 1.0), SKAction.fadeOut(withDuration: 1.0)])
    startLabel.run(SKAction.repeatForever(fadeActions))
  }
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      for touch: AnyObject in touches {
        let location = touch.location(in: self)
        if startLabel.contains(location) {
    
        let SelectScene = selectScene(fileNamed: "selectScene")
          if (UIDevice.current.model.range(of: "iPad") != nil) {
            SelectScene?.scaleMode = .fill
            self.view?.presentScene(SelectScene!)
          } else {
            SelectScene?.scaleMode = .aspectFill
            self.view?.presentScene(SelectScene!)
            }
           }
        let location2 = touch.location(in: self)
        if fishLabel.contains(location2) {
        let FishScene = fishScene(fileNamed: "fishScene")
          if (UIDevice.current.model.range(of: "iPad") != nil) {
            FishScene?.scaleMode = .fill
            self.view?.presentScene(FishScene!)
          } else {
            FishScene?.scaleMode = .aspectFill
            self.view?.presentScene(FishScene!)
            }
          }
  }
  }

    override func update(_ currentTime: TimeInterval) {
      
    }
}

