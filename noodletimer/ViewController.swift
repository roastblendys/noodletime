//
//  ViewController.swift
//  noodletimer
//
//  Created by hayashi on 2015/06/25.
//  Copyright (c) 2015年 hayashi. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
private let TIMER_INTERVAL: Double = 0.1
    
    // タイマーのラベル
    @IBOutlet weak var time01: UILabel!
    
    
// タイマーの設定
 
    private var timer: NSTimer?
    private var count: Int = 0
    private var initMin: Int = 3
    private var min: Int = 3
    private var sec: Int = 0

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetTimer(3)
        initMin = 3
        self.view.backgroundColor = UIColorFromHex(0xfcf4df)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    

    func resetTimer(min: Int) {
        stopTimer()
        self.min = min
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
       
        if count == 0{
            println("おとならす")
            // 再生する audio ファイルのパスを取得
            let audioPath = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("microwave-tin1", ofType: "mp3")!)
            
            // auido を再生するプレイヤーを作成する
            var audioError:NSError?
            var audioPlayer = AVAudioPlayer(contentsOfURL: audioPath, error:&audioError)
            
            // エラーが起きたとき
            if let error = audioError {
                println("Error \(error.localizedDescription)")
            }
            audioPlayer!.prepareToPlay()
        }
        
        
    }
    
    func countDown() {
        sec--
        if (sec < 0) {
            min--
            if (min < 0) {
                sec = 0
                min = 0
                time01.text = timeStringGenerate()
                stopTimer()
                return
            }
            sec = 59
        }
        time01.text = timeStringGenerate()
    }
    
    
    

    @IBAction func start_button(sender: AnyObject) {
        if (timer == nil) {
            startTimer()
        }
    }
    
    @IBAction func stop_button(sender: AnyObject) {
          stopTimer()
    }
    
    @IBAction func reset_button(sender: AnyObject) {
        resetTimer(initMin)
    }
    
    
    @IBAction func three(sender: AnyObject) {
        resetTimer(3)
        initMin = 3
    }

    @IBAction func four(sender: AnyObject) {
        resetTimer(4)
        initMin = 4
    }
    
    @IBAction func five(sender: AnyObject) {
        resetTimer(5)
        initMin = 5
    }
    
    
   
}

