//
//  ViewController.swift
//  Lesson6Task1
//
//  Created by Михаил Беленко on 09.01.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!

    private var memoryText = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func applyButton(_ sender: Any) {
        if let text = inputTextField?.text {
            memoryText += text.isEmpty ? "" : "\(text) "
        }

        descriptionLabel.text = memoryText
    }
}

