//
//  SoundViewController.swift
//  SwiftMousouLINE
//
//  Created by Takamichi URATA on 2019/03/24.
//  Copyright © 2019 Takamichi URATA. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var imageView2: UIImageView!

    var audioPlayer:AVAudioPlayer!
    var count:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        imageView2.isHidden = true
        timeLabel.isHidden = true

        if let url = Bundle.main.url(forResource: "callMusic", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                audioPlayer = nil
            }
        } else {
            fatalError("Url is nil.")
        }
    }

    @IBAction func tapCatch(_ sender: Any) {
        imageView2.isHidden = false
        timeLabel.isHidden = false

        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCountup), userInfo: nil, repeats: true)

        timeLabel.text = String(count)
        playBabySound()
    }

    @objc func timerCountup() {
        count = count + 1
        timeLabel.text = String(count)
    }

    func playBabySound() {
        if let url = Bundle.main.url(forResource: "baby", withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer?.play()
            } catch {
                audioPlayer = nil
            }
        } else {
            fatalError("Url is nil.")
        }
    }

    @IBAction func tapDenied(_ sender: Any) {
        audioPlayer.stop()
        dismiss(animated: true, completion: nil)
    }
}
