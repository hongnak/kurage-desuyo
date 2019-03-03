//
//  GameScene.swift
//  test
//
//  Created by shohei on 2018/08/05.
//  Copyright © 2018年 Shohei Kobayashi. All rights reserved.
//

import SpriteKit
import GameplayKit

class fishScene: SKScene {
  
  var backLabel = SKLabelNode()
  
  override func didMove(to view: SKView) {
    backLabel = self.childNode(withName: "backLabel") as! SKLabelNode
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch: AnyObject in touches {
      let location = touch.location(in: self)
      if backLabel.contains(location) {
        let scene1 = GameScene(fileNamed: "GameScene")
        if (UIDevice.current.model.range(of: "iPad") != nil) {
          scene1?.scaleMode = .fill
          self.view?.presentScene(scene1!, transition: SKTransition.fade(withDuration: 1.0))
        } else {
          scene1?.scaleMode = .aspectFill
          self.view?.presentScene(scene1!, transition: SKTransition.fade(withDuration: 1.0))
        }
      }
  }
  }
  
  override func update(_ currentTime: TimeInterval) {
    
  }
}

