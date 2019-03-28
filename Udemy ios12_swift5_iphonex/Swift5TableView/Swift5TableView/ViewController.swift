//
//  ViewController.swift
//  Swift5TableView
//
//  Created by Takamichi URATA on 2019/03/28.
//  Copyright © 2019 Takamichi URATA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!

    var box = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func countUp(_ sender: Any) {
        box = box + 1
        label.text = String(box)
        
        if box > 10 {
            let viewController2: ViewController2 = self.storyboard?.instantiateViewController(withIdentifier: "next") as! ViewController2
            
            viewController2.count = box
            self.navigationController?.pushViewController(viewController2, animated: true)
        }
    }
    
}

