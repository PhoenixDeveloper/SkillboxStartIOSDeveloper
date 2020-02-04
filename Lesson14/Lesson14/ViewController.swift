//
//  ViewController.swift
//  Lesson14
//
//  Created by Михаил Беленко on 04.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        lastNameTextField.text = UserDefaultsPersistence.storage.lastName
        firstNameTextField.text = UserDefaultsPersistence.storage.firstName
    }

    @IBAction func lastNameChange(_ sender: Any) {
        UserDefaultsPersistence.storage.lastName = lastNameTextField.text
    }

    @IBAction func firstNameChange(_ sender: Any) {
        UserDefaultsPersistence.storage.firstName = firstNameTextField.text
    }
}

