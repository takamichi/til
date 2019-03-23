//
//  ViewController.swift
//  Swift5Countup
//
//  Created by Takamichi URATA on 2019/03/21.
//  Copyright © 2019 Takamichi URATA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var resultLabel: UILabel!

    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func plus(_ sender: Any) {
        count = count + 1
        resultLabel.text = String(count)
    }

    @IBAction func minus(_ sender: Any) {
        if count <= 0 {
            return
        }

        count = count - 1
        resultLabel.text = String(count)
    }
}

