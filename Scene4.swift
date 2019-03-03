//
//  Scene2.swift
//  test
//
//  Created by shohei on 2018/08/05.
//  Copyright © 2018年 Shohei Kobayashi. All rights reserved.
//

import Foundation
import SpriteKit

class Scene4: SKScene, SKPhysicsContactDelegate {
  
  var background = SKSpriteNode()
  var player = SKSpriteNode()
  var jellyfish = SKSpriteNode()
  var scoreLabel = SKLabelNode()
  var score = SKSpriteNode()
  var gameOverLabel = SKLabelNode()
  var bestScoreBox = SKLabelNode()
  var blockNode = SKSpriteNode()
  var lifeGauge = SKSpriteNode()
  var lifeGauge2 = SKSpriteNode()
  var timerK: Timer?
  var count = Int()
  var point = Int()
  var contactCount = Int()
  var invincible: Bool = false

  override func didMove(to view: SKView) {
    
    physicsWorld.contactDelegate = self
    background = self.childNode(withName: "background") as! SKSpriteNode
    background.zPosition = 0
    player = self.childNode(withName: "player") as! SKSpriteNode
    player.zPosition = 2
    jellyfish = SKSpriteNode(imageNamed: "jellyfishC")
    jellyfish.position = CGPoint(x: 0, y: 500)
    jellyfish.size = CGSize(width: 100, height: 100)
    jellyfish.zPosition = 2
    self.addChild(jellyfish)
    scoreLabel = self.childNode(withName: "scoreLabel") as! SKLabelNode
    scoreLabel.zPosition = 2
    bestScoreBox = self.childNode(withName: "bestScoreBox") as! SKLabelNode
    bestScoreBox.zPosition = 2
    score = self.childNode(withName: "score") as! SKSpriteNode
    score.zPosition = 2
    blockNode = self.childNode(withName: "blockNode") as! SKSpriteNode
    blockNode.zPosition = 1
    lifeGauge = self.childNode(withName: "player2") as! SKSpriteNode
    lifeGauge.zPosition = 2
    lifeGauge2 = self.childNode(withName: "player3") as! SKSpriteNode
    lifeGauge2.zPosition = 2
    gameOverLabel = self.childNode(withName: "gameOverLabel") as! SKLabelNode
    gameOverLabel.zPosition = 3
    gameOverLabel.isHidden = true
    gameOverLabel.fontSize = 96
    gameOverLabel.fontName = "Helvetica Neue Bold"
    gameOverLabel.fontColor = UIColor.orange
    player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
    player.physicsBody?.affectedByGravity = false
    player.physicsBody?.isDynamic = true
    player.physicsBody?.allowsRotation = false
    player.physicsBody?.mass = 0.10
    player.physicsBody?.angularDamping = 0
    player.physicsBody?.linearDamping = 0
    player.physicsBody?.friction = 0
    player.physicsBody?.restitution = 1
    player.physicsBody?.categoryBitMask = 1
    player.physicsBody?.contactTestBitMask = 1
    player.physicsBody?.collisionBitMask = 2
    jellyfish.physicsBody = SKPhysicsBody(rectangleOf: jellyfish.size)
    jellyfish.physicsBody?.affectedByGravity = false
    jellyfish.physicsBody?.isDynamic = true
    jellyfish.physicsBody?.allowsRotation = true
    jellyfish.physicsBody?.mass = 0.10
    jellyfish.physicsBody?.angularDamping = 0
    jellyfish.physicsBody?.linearDamping = 0
    jellyfish.physicsBody?.friction = 0
    jellyfish.physicsBody?.restitution = 1
    jellyfish.physicsBody?.categoryBitMask = 2
    jellyfish.physicsBody?.contactTestBitMask = 3
    jellyfish.physicsBody?.collisionBitMask = 1
    blockNode.physicsBody = SKPhysicsBody(rectangleOf: blockNode.size)
    blockNode.physicsBody?.isDynamic = false
    blockNode.physicsBody?.affectedByGravity = false
    blockNode.physicsBody?.allowsRotation = false
    blockNode.physicsBody?.friction = 0
    blockNode.physicsBody?.restitution = 1
    self.physicsWorld.contactDelegate = self
    let border = SKPhysicsBody(edgeLoopFrom: self.background.frame)
    border.friction = 0
    border.restitution = 1
    self.physicsBody = border
    timerK = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
    timerK = Timer.scheduledTimer(timeInterval: 0.8, target: self, selector: #selector(swimFish), userInfo: nil, repeats: true)
    timerK = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(swimSquid), userInfo: nil, repeats: true)
    timerK = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(swimShrimp), userInfo: nil, repeats: true)
    timerK = Timer.scheduledTimer(timeInterval: 11.0, target: self, selector: #selector(swimHotate), userInfo: nil, repeats: true)
    timerK = Timer.scheduledTimer(timeInterval: 20.0, target: self, selector: #selector(swimBubble), userInfo: nil, repeats: true)
    
    let bestScore = UserDefaults.standard.integer(forKey: "bestScore")
    let bestScoreLabel = SKLabelNode(text: "\(bestScore)")
    bestScoreLabel.zPosition = 3
    bestScoreLabel.fontName = "BlueHighwayD-Regular"
    bestScoreLabel.fontSize = 32
    bestScoreLabel.fontColor = UIColor.black
    bestScoreLabel.position = scoreLabel.position.applying(CGAffineTransform(translationX: -280, y: -bestScoreLabel.frame.height))
    addChild(bestScoreLabel)
    startGame()
  }
  
  func startGame() {
    jellyfish.physicsBody?.applyImpulse(CGVector(dx: 30, dy: 30))
    count = 0
    point = 0
    contactCount = 0
  }
  
  @objc func timerRun(timer: Timer) {
    count += 1
    if count > 30  {
      jellyfish.physicsBody?.applyImpulse(CGVector(dx: 31, dy: 31))
    }
  }
  
  @objc func swimFish() {
    let fish = SKSpriteNode(imageNamed: "fish")
    fish.zPosition = 1
    fish.size = CGSize(width: 150, height: 150)
    fish.position = CGPoint(x: 600, y: CGFloat(arc4random_uniform(UInt32(self.frame.size.height - 160))))
    fish.physicsBody = SKPhysicsBody(rectangleOf: fish.size)
    fish.physicsBody?.affectedByGravity = false
    fish.physicsBody?.isDynamic = false
    fish.physicsBody?.categoryBitMask = 4
    fish.physicsBody?.contactTestBitMask = 5
    fish.physicsBody?.collisionBitMask = 1
    let action = SKAction.moveTo(x: -600, duration: 2.0)
    let actionDone = SKAction.removeFromParent()
    fish.run(SKAction.sequence([action, actionDone]))
    self.addChild(fish)
  }
  
  @objc func swimSquid() {
    let squid = SKSpriteNode(imageNamed: "squid")
    squid.zPosition = 1
    squid.size = CGSize(width: 150, height: 150)
    squid.position = CGPoint(x: 600, y: CGFloat(arc4random_uniform(UInt32(self.frame.size.height - 160))))
    squid.physicsBody = SKPhysicsBody(rectangleOf: squid.size)
    squid.physicsBody?.affectedByGravity = false
    squid.physicsBody?.isDynamic = false
    squid.physicsBody?.categoryBitMask = 4
    squid.physicsBody?.contactTestBitMask = 7
    squid.physicsBody?.collisionBitMask = 1
    let action2 = SKAction.moveTo(x: -600, duration: 2.0)
    let actionDone2 = SKAction.removeFromParent()
    squid.run(SKAction.sequence([action2, actionDone2]))
    self.addChild(squid)
  }
  
  @objc func swimShrimp() {
    let Shrimp = SKSpriteNode(imageNamed: "shrimp")
    Shrimp.zPosition = 1
    Shrimp.size = CGSize(width: 150, height: 150)
    Shrimp.position = CGPoint(x: 600, y: CGFloat(arc4random_uniform(UInt32(self.frame.size.height - 160))))
    Shrimp.physicsBody = SKPhysicsBody(rectangleOf: Shrimp.size)
    Shrimp.physicsBody?.affectedByGravity = false
    Shrimp.physicsBody?.isDynamic = false
    Shrimp.physicsBody?.categoryBitMask = 4
    Shrimp.physicsBody?.contactTestBitMask = 9
    Shrimp.physicsBody?.collisionBitMask = 1
    let action3 = SKAction.moveTo(x: -600, duration: 3.0)
    let actionDone3 = SKAction.removeFromParent()
    Shrimp.run(SKAction.sequence([action3, actionDone3]))
    self.addChild(Shrimp)
  }
  
  @objc func swimHotate() {
    let Hotate = SKSpriteNode(imageNamed: "hotate")
    Hotate.zPosition = 1
    Hotate.size = CGSize(width: 100, height: 100)
    Hotate.position = CGPoint(x: 600, y: CGFloat(arc4random_uniform(UInt32(self.frame.size.height - 160))))
    Hotate.physicsBody = SKPhysicsBody(rectangleOf: Hotate.size)
    Hotate.physicsBody?.affectedByGravity = false
    Hotate.physicsBody?.isDynamic = false
    Hotate.physicsBody?.categoryBitMask = 4
    Hotate.physicsBody?.contactTestBitMask = 11
    Hotate.physicsBody?.collisionBitMask = 1
    let action4 = SKAction.moveTo(x: -600, duration: 3.0)
    let actionDone4 = SKAction.removeFromParent()
    Hotate.run(SKAction.sequence([action4, actionDone4]))
    self.addChild(Hotate)
  }
  
  @objc func swimBubble() {
    let Bubble = SKSpriteNode(imageNamed: "bubble")
    Bubble.zPosition = 1
    Bubble.size = CGSize(width: 100, height: 100)
    Bubble.position = CGPoint(x: 600, y: CGFloat(arc4random_uniform(UInt32(self.frame.size.height - 160))))
    Bubble.physicsBody = SKPhysicsBody(rectangleOf: Bubble.size)
    Bubble.physicsBody?.affectedByGravity = false
    Bubble.physicsBody?.isDynamic = false
    Bubble.physicsBody?.categoryBitMask = 4
    Bubble.physicsBody?.contactTestBitMask = 13
    Bubble.physicsBody?.collisionBitMask = 1
    let action4 = SKAction.moveTo(x: -600, duration: 3.0)
    let actionDone4 = SKAction.removeFromParent()
    Bubble.run(SKAction.sequence([action4, actionDone4]))
    self.addChild(Bubble)
  }
  
  func didBegin(_ contact: SKPhysicsContact) {
    let firstBody: SKPhysicsBody = contact.bodyA
    let secondBody: SKPhysicsBody = contact.bodyB
    
    if ((firstBody.contactTestBitMask == 1) && (secondBody.contactTestBitMask == 3)) {
      print("touched")
      collisionWithJellyfish(player: firstBody.node as! SKSpriteNode, jellyfish: secondBody.node as! SKSpriteNode)
      let particle = SKEmitterNode(fileNamed: "MyParticle.sks")
      particle?.position = CGPoint(x: contact.contactPoint.x, y: contact.contactPoint.y)
      let action5 = SKAction.wait(forDuration: 0.7)
      let action6 = SKAction.removeFromParent()
      let actionAll = SKAction.sequence([action5, action6])
      self.addChild(particle!)
      particle!.run(actionAll)
      invincible = true
      let action7 = SKAction.wait(forDuration: 1.5)
      let action8 = SKAction.run {
      self.invincible = false
      }
      let actionAll2 = SKAction.sequence([action7, action8])
      player.run(actionAll2)
    }
    else if ((firstBody.contactTestBitMask == 1) && (secondBody.contactTestBitMask == 5)) {
      collisionWithFish(player: firstBody.node as! SKSpriteNode, fish: secondBody.node as! SKSpriteNode)
    }
    else if ((firstBody.contactTestBitMask == 1) && (secondBody.contactTestBitMask == 7)) {
      collisionWithSquid(player: firstBody.node as! SKSpriteNode, squid: secondBody.node as! SKSpriteNode)
    }
    else if ((firstBody.contactTestBitMask == 1) && (secondBody.contactTestBitMask == 9)) {
      collisionWithShrimp(player: firstBody.node as! SKSpriteNode, Shrimp: secondBody.node as! SKSpriteNode)
    }
    else if ((firstBody.contactTestBitMask == 1) && (secondBody.contactTestBitMask == 11)) {
      collisionWithHotate(player: firstBody.node as! SKSpriteNode, Hotate: secondBody.node as! SKSpriteNode)
    }
    else if ((firstBody.contactTestBitMask == 1) && (secondBody.contactTestBitMask == 13)) {
      collisionWithBubble(player: firstBody.node as! SKSpriteNode, Bubble: secondBody.node as! SKSpriteNode)
    }
  }
  
  func collisionWithJellyfish(player: SKSpriteNode, jellyfish: SKSpriteNode) {
    switch invincible {
    case false: contactCount += 1
      if contactCount == 1 {
        lifeGauge.isHidden = true
      }
      if contactCount == 2 {
        lifeGauge2.isHidden = true
      }
      if contactCount == 3 {
        gameOver()
      }
    case true: contactCount += 0
    }
  }
  
  func collisionWithFish(player: SKSpriteNode, fish: SKSpriteNode) {
    fish.removeFromParent()
    point += 10
    displayPoint()
  }
  
  func collisionWithSquid(player: SKSpriteNode, squid: SKSpriteNode) {
    squid.removeFromParent()
    point += 50
    displayPoint()
  }
  
  func collisionWithShrimp(player: SKSpriteNode, Shrimp: SKSpriteNode) {
    Shrimp.removeFromParent()
    point += 100
    displayPoint()
  }
  
  func collisionWithHotate(player: SKSpriteNode, Hotate: SKSpriteNode) {
    Hotate.removeFromParent()
    point *= 2
    displayPoint()
  }
  
  func collisionWithBubble(player: SKSpriteNode, Bubble: SKSpriteNode) {
    Bubble.removeFromParent()
    invincible = true
    let texture = SKTexture(imageNamed: "playerBubble")
    let texture2 = SKTexture(imageNamed: "player")
    let action = SKAction.setTexture(texture, resize: true)
    let action2 = SKAction.wait(forDuration: 5.0)
    let action3 = SKAction.setTexture(texture2, resize: true)
    let action4 = SKAction.run {
      self.invincible = false
    }
    let actionAll = SKAction.sequence([action, action2, action3, action4])
    player.run(actionAll)
  }

  func displayPoint() {
    scoreLabel.text = "\(point)"
  }

  func gameOver() {
    isPaused = true
    timerK?.invalidate()
    let bestScore = UserDefaults.standard.integer(forKey: "bestScore")
    let scene1 = GameScene(fileNamed: "GameScene")
    if point > bestScore {
      UserDefaults.standard.set(point, forKey: "bestScore")
      gameOverLabel.text = "Best Score!"
      gameOverLabel.fontName = "BlueHighwayD-Regular"
      gameOverLabel.isHidden = false
    } else {
      gameOverLabel.text = "Game Over!"
      gameOverLabel.fontName = "BlueHighwayD-Regular"
      gameOverLabel.isHidden = false
    }
    if (UIDevice.current.model.range(of: "iPad") != nil) {
      scene1?.scaleMode = .fill
      self.view?.presentScene(scene1!, transition: SKTransition.fade(withDuration: 5.0))
    } else {
      scene1?.scaleMode = .aspectFill
      self.view?.presentScene(scene1!, transition: SKTransition.fade(withDuration: 5.0))
      }
     }
  
  
  override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    let location = touches.first!.location(in: self)
    let action = SKAction.move(to: CGPoint(x: location.x, y: location.y + 40), duration: 0.1)
    player.run(action)
    }
  
  override func update(_ currentTime: TimeInterval) {
    
  }
}
