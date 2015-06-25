//
//  ViewController.swift
//  noodletimer
//
//  Created by hayashi on 2015/06/25.
//  Copyright (c) 2015年 hayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
// タイマーのラベル
    @IBOutlet weak var time01: UILabel!
// タイマーの設定
    private var timer: NSTimer?
    private var count: Int = 0
    
    private var min: Int = 2
    private var sec: Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func start_button(sender: AnyObject) {
    }

    
    @IBAction func stop_button(sender: AnyObject) {
    }
    
    @IBAction func reset_button(sender: AnyObject) {
    }
    
}

