//
//  SecondTaskMainViewController.swift
//  Lesson9Task1
//
//  Created by Михаил Беленко on 24.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class SecondTaskMainViewController: UIViewController {
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!

    @IBOutlet weak var textFieldOne: UITextField!
    @IBOutlet weak var textFieldTwo: UITextField!
    
    @IBAction func textFieldOneChange(_ sender: Any) {
        labelOne.text = textFieldOne.text
    }

    @IBAction func textFieldTwoChange(_ sender: Any) {
        labelTwo.text = textFieldTwo.text
    }

}
