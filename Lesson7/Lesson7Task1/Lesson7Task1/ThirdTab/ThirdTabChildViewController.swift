//
//  ThirdTabChildViewController.swift
//  Lesson7Task1
//
//  Created by Михаил Беленко on 12.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ThirdTabChildViewController: UIViewController {

    var parentVC: ThirdTabChangeColorScreenDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func selectPurple(_ sender: Any) {
        parentVC.changeColorScreen(color: .purple)
    }

    @IBAction func selectYellow(_ sender: Any) {
        parentVC.changeColorScreen(color: .yellow)
    }

    @IBAction func selectGreen(_ sender: Any) {
        parentVC.changeColorScreen(color: .green)
    }
}

extension ThirdTabChildViewController: ThirdTabChangeColorScreenDelegate {

    func changeColorScreen(color: ThirdTabColorScreen) {
        switch color {
        case .green:
            view.backgroundColor = .green
        case .yellow:
            view.backgroundColor = .yellow
        case .purple:
            view.backgroundColor = .purple
        }
    }
}
