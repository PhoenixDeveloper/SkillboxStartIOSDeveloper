//
//  ThirdTaskMainViewController.swift
//  Lesson9Task1
//
//  Created by Михаил Беленко on 24.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ThirdTaskMainViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!

    var isLabelCollapse = false

    @IBAction func changeLabelNumberOfLines(_ sender: Any) {
        label.numberOfLines = isLabelCollapse ? 0 : 1
        isLabelCollapse = !isLabelCollapse
        button.setTitle(isLabelCollapse ? "Развернуть Label" : "Свернуть Label", for: .normal)
    }
}
