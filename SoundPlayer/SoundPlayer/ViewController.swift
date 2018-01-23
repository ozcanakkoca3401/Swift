//
//  ViewController.swift
//  SoundPlayer
//
//  Created by Özcan AKKOCA on 2.06.2017.
//  Copyright © 2017 Özcan AKKOCA. All rights reserved.
//

import UIKit
import AVFoundation // Ses kütüphanesi ekle

class ViewController: UIViewController {

    
    var player : AVAudioPlayer?

    override func viewDidLoad() {
        super.viewDidLoad()
        //TODO fix this!
        let path = Bundle.main.path(forResource: "biz_dertliyiz", ofType:"mp3")!
        let url = URL(fileURLWithPath: path)
        
        do {
            let sound = try AVAudioPlayer(contentsOf: url)
            self.player = sound
            //sound.numberOfLoops = 2 // 2 defa çal
            sound.prepareToPlay() // play için hazırla
            sound.play()
            //sound.pause() // duraklat
            //sound.stop() //durdur
        } catch {
            print("error loading file")
            // couldn't load file :(
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

