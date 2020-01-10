//
//  ViewController.swift
//  Lesson6Task2
//
//  Created by Михаил Беленко on 09.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var numberTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func applyButton(_ sender: Any) {
        if let number = Int.init(numberTextField.text ?? "") {
            answerLabel.text = "\(pow(2, number))"
        }
        else {
            answerLabel.text = "Введите целое число в строку"
        }
    }

}

