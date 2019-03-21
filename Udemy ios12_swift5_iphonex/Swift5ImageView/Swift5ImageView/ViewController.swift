//
//  ViewController.swift
//  Swift5ImageView
//
//  Created by Takamichi URATA on 2019/03/21.
//  Copyright © 2019 Takamichi URATA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeImage(_ sender: Any) {
        count = count + 1
        
        if count >= 10 {
            imageView.image = UIImage(named: "background")
        }
    }
    
}

