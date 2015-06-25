//
//  ViewController.swift
//  noodletimer
//
//  Created by hayashi on 2015/06/25.
//  Copyright (c) 2015年 hayashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
private let TIMER_INTERVAL: Double = 0.1
    
    // タイマーのラベル
    @IBOutlet weak var time01: UILabel!
    
    
// タイマーの設定
    private var timer: NSTimer?
    private var count: Int = 0
    private var min: Int = 3
    private var sec: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTimer()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func resetTimer() {
        stopTimer()
        min = 3
        sec = 0
        time01.text = timeStringGenerate()
    }
    
    func timeStringGenerate() -> String {
        var secString: String = String(sec)
        if (sec < 10) {
            secString = "0" + secString
        }
        return (String(min) + ":" + secString)
    }

    
    
    func startTimer() {
        stopTimer()
        timer = NSTimer.scheduledTimerWithTimeInterval(TIMER_INTERVAL, target: self, selector: "onTick", userInfo: nil, repeats: true)
    }
    
    
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    
    func onTick() {
        count++
        if (count >= 10) {
            countDown()
            count = 0
        }
    }
    
    func countDown() {
        sec--
        if (sec < 0) {
            min--
            if (min < 0) {
                stopTimer()
            }
            sec = 59
        }
        time01.text = timeStringGenerate()
    }

    @IBAction func start_button(sender: AnyObject) {
        startTimer()
    }
    
    @IBAction func stop_button(sender: AnyObject) {
          stopTimer()
    }
    
    @IBAction func reset_button(sender: AnyObject) {
        resetTimer()
    }
    
    
}

