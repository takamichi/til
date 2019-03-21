//
//  NextViewController.swift
//  Swift5Button
//
//  Created by Takamichi URATA on 2019/03/21.
//  Copyright © 2019 Takamichi URATA. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var changeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func change(_ sender: Any) {
        self.changeLabel.text = "暗号が解除されました。"
    }
}
