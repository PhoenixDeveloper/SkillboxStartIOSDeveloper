//
//  SecondTabChangeTypeScreenViewController.swift
//  Lesson7Task1
//
//  Created by Михаил Беленко on 12.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

protocol ChangeTypeScreenDelegate {
    var typeScreen: SecondTabTypeScreen { get set }
}

class SecondTabChangeTypeScreenViewController: UIViewController {

    var delegate: ChangeTypeScreenDelegate!

    @IBOutlet weak var descriptionTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        switch delegate.typeScreen {
        case .green:
            descriptionTextField.text = "Выбран зеленый"
            descriptionTextField.textColor = .systemGreen
        case .blue:
            descriptionTextField.text = "Выбран синий"
            descriptionTextField.textColor = .systemBlue
        case .red:
            descriptionTextField.text = "Выбран красный"
            descriptionTextField.textColor = .systemRed
        }
    }
    
    @IBAction func selectGreen(_ sender: Any) {
        delegate.typeScreen = .green
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selectBlue(_ sender: Any) {
        delegate.typeScreen = .blue
        dismiss(animated: true, completion: nil)
    }

    @IBAction func selectRed(_ sender: Any) {
        delegate.typeScreen = .red
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
