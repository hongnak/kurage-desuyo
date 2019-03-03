//
//  selectScene.swift
//  Jellyfish Game
//
//  Created by shohei on 2018/08/25.
//  Copyright © 2018年 Shohei Kobayashi. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class selectScene: SKScene {
  
  var easyLabel = SKLabelNode()
  var mediumLabel = SKLabelNode()
  var superLabel = SKLabelNode()
  var backLabel = SKLabelNode()
  var myField: SKFieldNode!
  var myButton: UIButton!
  var myButton2: UIButton!
  var myButton3: UIButton!
  
  override func didMove(to view: SKView) {
    easyLabel = self.childNode(withName: "easyLabel") as! SKLabelNode
    mediumLabel = self.childNode(withName: "mediumLabel") as! SKLabelNode
    superLabel = self.childNode(withName: "superLabel") as! SKLabelNode
    backLabel = self.childNode(withName: "backLabel") as! SKLabelNode
    myButton = UIButton()
    myButton.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    myButton.backgroundColor = UIColor.darkGray
    myButton.layer.masksToBounds = true
    myButton.setTitle("?", for: UIControlState.normal)
    myButton.setTitleColor(UIColor.white, for: UIControlState.normal)
    myButton.setTitle("Done", for: UIControlState.highlighted)
    myButton.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    myButton.layer.cornerRadius = 15.0
    myButton.layer.position = CGPoint(x: 280, y: 200)
    myButton.addTarget(self, action: #selector(onClickMyButton), for: .touchUpInside)
    self.view!.addSubview(myButton)
    
    myButton2 = UIButton()
    myButton2.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    myButton2.backgroundColor = UIColor.darkGray
    myButton2.layer.masksToBounds = true
    myButton2.setTitle("?", for: UIControlState.normal)
    myButton2.setTitleColor(UIColor.white, for: UIControlState.normal)
    myButton2.setTitle("Done", for: UIControlState.highlighted)
    myButton2.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    myButton2.layer.cornerRadius = 15.0
    myButton2.layer.position = CGPoint(x: 280, y: 335)
    myButton2.addTarget(self, action: #selector(onClickMyButton), for: .touchUpInside)
    self.view!.addSubview(myButton2)
    
    myButton3 = UIButton()
    myButton3.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
    myButton3.backgroundColor = UIColor.darkGray
    myButton3.layer.masksToBounds = true
    myButton3.setTitle("?", for: UIControlState.normal)
    myButton3.setTitleColor(UIColor.white, for: UIControlState.normal)
    myButton3.setTitle("Done", for: UIControlState.highlighted)
    myButton3.setTitleColor(UIColor.black, for: UIControlState.highlighted)
    myButton3.layer.cornerRadius = 15.0
    myButton3.layer.position = CGPoint(x: 280, y: 470)
    myButton3.addTarget(self, action: #selector(onClickMyButton), for: .touchUpInside)
    self.view!.addSubview(myButton3)
    
    // VortexFieldをを作る.
    myField = SKFieldNode.vortexField()
    myField.position = self.view!.center
    
    // 場の強さ設定.
    myField.strength = 0.1
    
    // 中央に近づけば近づくほど強くなるかどうかの設定.
    // 値が増す毎に力が中央から強くなっていく.
    myField.falloff = 1.0
    
    self.addChild(myField)
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch: AnyObject in touches {
      let location = touch.location(in: self)
      if easyLabel.contains(location) {
        let scene2 = Scene2(fileNamed: "Scene2")
        if (UIDevice.current.model.range(of: "iPad") != nil) {
          scene2?.scaleMode = .fill
          self.view?.presentScene(scene2!, transition: SKTransition.fade(withDuration: 1.0))
        } else {
          scene2?.scaleMode = .aspectFill
          self.view?.presentScene(scene2!, transition: SKTransition.fade(withDuration: 1.0))
        }
        myButton.isHidden = true
        myButton2.isHidden = true
        myButton3.isHidden = true
      }
      let location2 = touch.location(in: self)
      if mediumLabel.contains(location2) {
        let scene3 = Scene3(fileNamed: "Scene3")
        if (UIDevice.current.model.range(of: "iPad") != nil) {
          scene3?.scaleMode = .fill
          self.view?.presentScene(scene3!, transition: SKTransition.fade(withDuration: 1.0))
        } else {
          scene3?.scaleMode = .aspectFill
          self.view?.presentScene(scene3!, transition: SKTransition.fade(withDuration: 1.0))
        }
        myButton.isHidden = true
        myButton2.isHidden = true
        myButton3.isHidden = true
      }
      let location3 = touch.location(in: self)
      if superLabel.contains(location3) {
        let scene4 = Scene4(fileNamed: "Scene4")
        if (UIDevice.current.model.range(of: "iPad") != nil) {
          scene4?.scaleMode = .fill
          self.view?.presentScene(scene4!, transition: SKTransition.fade(withDuration: 1.0))
        } else {
          scene4?.scaleMode = .aspectFill
          self.view?.presentScene(scene4!, transition: SKTransition.fade(withDuration: 1.0))
        }
        myButton.isHidden = true
        myButton2.isHidden = true
        myButton3.isHidden = true
      }
      let location4 = touch.location(in:self)
      if backLabel.contains(location4) {
        let gameScene = GameScene(fileNamed: "GameScene")
        if (UIDevice.current.model.range(of: "iPad") != nil) {
          gameScene?.scaleMode = .fill
          self.view?.presentScene(gameScene!)
        } else {
          gameScene?.scaleMode = .aspectFill
          self.view?.presentScene(gameScene!)
        }
        myButton.isHidden = true
        myButton2.isHidden = true
        myButton3.isHidden = true
      }
      let location5 = touch.location(in: self)
      // 円を生成.
      let circle = SKShapeNode(circleOfRadius: 15.0)
      circle.position = location5
      circle.name = "Circle"
      circle.fillColor = UIColor.red
      circle.alpha = 0
      
      // 円の剛体を生成.
      circle.physicsBody = SKPhysicsBody(circleOfRadius: 15.0)
      
      // 影響を受けるフィールドを指定.
      circle.physicsBody!.fieldBitMask = 1
      
      // 重力を受けなくさせる.
      circle.physicsBody!.affectedByGravity = true
      
      self.addChild(circle)
    }
  }
  
  @objc func onClickMyButton(sender: UIButton) {
    // カスタムダイアログを生成.
    let dialog = CustomDialog(scene: self, frame: CGRect(x: 0, y: 0, width: self.view!.bounds.maxX - 50, height: 300))
    self.view!.addSubview(dialog)
  }
}
