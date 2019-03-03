//
//  CustomDialog.swift
//  Jellyfish Game
//
//  Created by shohei on 2018/09/09.
//  Copyright © 2018年 Shohei Kobayashi. All rights reserved.
//

import UIKit
import SpriteKit

class CustomDialog2: UIView {
  
  var backGroundView : UIView!
  var scene : SKScene!
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)!
  }
  
  init(scene : SKScene,frame : CGRect){
    super.init(frame: scene.view!.bounds)
    
    // 自分が追加されたシーン.
    self.scene = scene
    
    // シーン内をポーズ.
    self.scene.view!.isPaused = true
    
    // シーン内のタッチを検出させなくする.
    self.scene.isUserInteractionEnabled = false
    
    self.layer.zPosition = 10
    
    // シーン全体を被せる背景を追加.
    self.backGroundView = UIView(frame: scene.view!.bounds)
    self.backGroundView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.3)
    self.backGroundView.layer.position = scene.view!.center
    self.addSubview(backGroundView)
    
    // ダイアログの背景を追加.
    let board = UIView(frame: frame)
    board.backgroundColor = UIColor.white
    board.layer.position = backGroundView.center
    board.layer.masksToBounds = true
    board.layer.cornerRadius = 20.0
    board.layer.borderColor = UIColor.black.cgColor
    self.addSubview(board)
    
    // ラベルを追加.
    let textView = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
    textView.text = "hogehoge"
    textView.textAlignment = NSTextAlignment.center
    textView.layer.position = backGroundView.center
    textView.backgroundColor = UIColor.clear
    textView.textColor = UIColor.black
    self.addSubview(textView)
    
    // 閉じるボタンを追加.
    let myWindowExitButton = UIButton(type: UIButtonType.contactAdd)
    myWindowExitButton.tintColor = UIColor.black
    myWindowExitButton.layer.position = CGPoint(x: board.bounds.maxX - myWindowExitButton.bounds.midX - 5, y: myWindowExitButton.bounds.midY + 5)
    
    // 追加ボタンを回転させる事で閉じるボタンっぽくみせる.
    myWindowExitButton.transform = CGAffineTransform(rotationAngle: CGFloat((45.0 * .pi) / 180.0))
    
    myWindowExitButton.addTarget(self, action: #selector(onExitButton), for: UIControlEvents.touchUpInside)
    board.addSubview(myWindowExitButton)
    
  }
  
  @objc func onExitButton(sender : UIButton){
    
    // シーン内のボーズを解除.
    self.scene.view!.isPaused = false
    
    // シーン内のタッチを検出させる.
    self.scene.isUserInteractionEnabled = true
    
    // シーンから自身を削除.
    self.removeFromSuperview()
    
  }
}
