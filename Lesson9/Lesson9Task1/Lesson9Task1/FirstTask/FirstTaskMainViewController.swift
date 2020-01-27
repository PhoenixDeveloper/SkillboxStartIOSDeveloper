//
//  FirstTaskMainViewController.swift
//  Lesson9Task1
//
//  Created by Михаил Беленко on 23.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class FirstTaskMainViewController: UIViewController {

    @IBOutlet weak var useStackViewsLabel: UILabel!
    @IBOutlet weak var useStackViewsSwitch: UISwitch!
    @IBOutlet weak var typeSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        setChildViewController(controller: storyboard!.instantiateViewController(identifier: "FirstTaskTypeOneStackViewsOn"))
    }
    
    private func setChildViewController(controller: UIViewController) {
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)

        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            controller.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            controller.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            controller.view.bottomAnchor.constraint(equalTo: useStackViewsLabel.topAnchor, constant: -16)
        ])

        controller.didMove(toParent: self)
    }

    private func changeValue() {
        let useStackViewsString: String = useStackViewsSwitch.isOn ? "On" : "Off"
        var typeTaskString: String!

        switch typeSegmentedControl.selectedSegmentIndex {
        case 0:
            typeTaskString = "One"
        case 1:
            typeTaskString = "Two"
        default:
            fatalError("imposible")
        }

        setChildViewController(controller: storyboard!.instantiateViewController(identifier: "FirstTaskType\(typeTaskString!)StackViews\(useStackViewsString)"))
    }

    @IBAction func changeSwitch(_ sender: Any) {
        changeValue()
    }

    @IBAction func changeSegmentedControl(_ sender: Any) {
        changeValue()
    }

}
