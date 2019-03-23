//
//  ViewController.swift
//  Swift4Manga
//
//  Created by Takamichi URATA on 2019/03/23.
//  Copyright © 2019 Takamichi URATA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var counterLabel: UILabel!
    @IBOutlet var runnerImageView: UIImageView!
    @IBOutlet var runButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    var imageList = [UIImage]()
    var timer1 = Timer()
    var timer2 = Timer()
    var countUp = 0
    var updateCount = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        stopButton.isEnabled = false

        let image0 = UIImage(named: "dash0.png")
        let image1 = UIImage(named: "dash1.png")
        let image2 = UIImage(named: "dash2.png")
        let image3 = UIImage(named: "dash3.png")
        let image4 = UIImage(named: "dash4.png")
        let image5 = UIImage(named: "dash5.png")

        imageList = [
            image0!,
            image1!,
            image2!,
            image3!,
            image4!,
            image5!,
        ]
    }

    @IBAction func run(_ sender: Any) {
        runButton.isEnabled = false
        stopButton.isEnabled = true

        timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.countUp = self.countUp + 1

            self.counterLabel.text = String(self.countUp)
        })
        
        timer2 = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { (timer) in

            self.updateCount = self.updateCount > 5 ? 0 : self.updateCount
            self.runnerImageView.image = self.imageList[self.updateCount]

            self.updateCount = self.updateCount + 1
        })
    }

    @IBAction func stop(_ sender: Any) {
        stopButton.isEnabled = false
        runButton.isEnabled = true

        timer1.invalidate()
        timer2.invalidate()
    }
}

