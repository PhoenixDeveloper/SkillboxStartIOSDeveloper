//
//  SecondTabMainViewController.swift
//  Lesson7Task1
//
//  Created by Михаил Беленко on 12.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class SecondTabMainViewController: UIViewController {

    var typeScreen: SecondTabTypeScreen = .green {
        didSet {
            switch typeScreen {
            case .green:
                descriptionLabel.text = "Выбран зеленый"
                descriptionLabel.textColor = .systemGreen
            case .blue:
                descriptionLabel.text = "Выбран синий"
                descriptionLabel.textColor = .systemBlue
            case .red:
                descriptionLabel.text = "Выбран красный"
                descriptionLabel.textColor = .systemRed
            }
        }
    }

    @IBOutlet weak var descriptionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeTypeScreen(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "ChangeTypeScreenController") as? SecondTabChangeTypeScreenViewController else { return }
        vc.delegate = self
        vc.hidesBottomBarWhenPushed = true
        present(vc, animated: true, completion: nil)
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

extension SecondTabMainViewController: ChangeTypeScreenDelegate {

}
