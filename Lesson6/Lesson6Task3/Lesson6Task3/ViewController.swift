//
//  ViewController.swift
//  Lesson6Task3
//
//  Created by Михаил Беленко on 09.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstValueTextField: UITextField!
    @IBOutlet weak var operatorTextField: UITextField!
    @IBOutlet weak var secondValueTextField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func applyButtonAction(_ sender: Any) {
        if let operatorValue = operatorTextField.text, let firstValue = Float.init(firstValueTextField.text ?? ""), let secondValue = Float.init(secondValueTextField.text ?? "") {
            switch operatorValue {
            case "+":
                answerLabel.text = "\(firstValue + secondValue)"
            case "-":
                answerLabel.text = "\(firstValue - secondValue)"
            case "/", "%":
                answerLabel.text = "\(firstValue / secondValue)"
            case "*":
                answerLabel.text = "\(firstValue * secondValue)"
            default:
                answerLabel.text = "Некорректные данные"
            }
        }
        else {
            answerLabel.text = "Некорректные данные"
        }
    }
}

