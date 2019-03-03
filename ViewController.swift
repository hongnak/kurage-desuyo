//
//  ViewController.swift
//  Jellyfish Game
//
//  Created by shohei on 2018/08/18.
//  Copyright © 2018年 Shohei Kobayashi. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  @IBAction func tapStart(_ sender: Any) {
    let scene = Scene2(size: view.bounds.size)
    SKView.presentScene(scene)
  }
  
  
}
