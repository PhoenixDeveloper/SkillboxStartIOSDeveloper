//
//  ViewController.swift
//  Lesson8Task3
//
//  Created by Михаил Беленко on 23.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        setChildViewController(controller: storyboard!.instantiateViewController(identifier: "GreenController"))
    }

    private func setChildViewController(controller: UIViewController) {
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)

        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            controller.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            controller.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            controller.view.bottomAnchor.constraint(equalTo: segmentControl.topAnchor, constant: -8)
        ])

        controller.didMove(toParent: self)
    }

    @IBAction func changeSegmantController(_ sender: Any) {
        switch segmentControl.selectedSegmentIndex {
        case 0:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "GreenController"))
        case 1:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "BlueController"))
        case 2:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "PurpleController"))
        default:
            fatalError("impossible")
        }
    }

}

