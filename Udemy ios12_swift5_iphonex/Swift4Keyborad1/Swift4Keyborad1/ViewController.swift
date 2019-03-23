//
//  ViewController.swift
//  Swift4Keyborad1
//
//  Created by Takamichi URATA on 2019/03/23.
//  Copyright © 2019 Takamichi URATA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var mailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        mailTextField.delegate = self
        passwordTextField.delegate = self
    }

    @IBAction func signin(_ sender: Any) {
        resultLabel.text = mailTextField.text! + ":" + passwordTextField.text!
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        return true
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        mailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
}

