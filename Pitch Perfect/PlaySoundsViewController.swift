//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Ghassan Mohammed on 2/7/15.
//  Copyright (c) 2015 Ghassan Mohammed. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    
    var audioPlayer = AVAudioPlayer()
    var receivedAudio : RecordedAudio!
    var audioEngin: AVAudioEngine!
    var audioFile : AVAudioFile!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        println(receivedAudio.filePathUrl)
        
        audioEngin = AVAudioEngine()
        
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func playSlowAudio(sender: UIButton) {
        
        audioEngin.stop()
        audioEngin.reset()
        playAudio(audioPlayer, rate: 0.5)
    }
    
    @IBAction func playFastAudio(sender: UIButton) {
        
        audioEngin.stop()
        audioEngin.reset()
        playAudio(audioPlayer, rate: 2.0)
    }
    
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        
        
       playAudioWithVariablePitch(1000)
       
    
    }
    
    
    @IBAction func playDarthvaderAudio(sender: UIButton) {
        
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch (pitch : Float) {
        
        audioPlayer.stop()
        audioEngin.stop()
        audioEngin.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngin.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngin.attachNode(changePitchEffect)
        
        audioEngin.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngin.connect(changePitchEffect, to: audioEngin.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngin.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    
    
    @IBAction func normalPlayback(sender: UIButton) {
        
        audioEngin.stop()
        audioEngin.reset()
        audioPlayer.stop()
        audioPlayer.play()
    }
   
    @IBAction func stopAudio(sender: UIButton) {
        
        audioEngin.stop()
        audioEngin.reset()
        audioPlayer.stop()
        
    }
    
    func playAudio (player : AVAudioPlayer, rate : Float) {
        
        player.stop()
        player.rate = rate
        player.volume = 1.0
        player.currentTime = 0.0
        player.play()
        
    }

}
