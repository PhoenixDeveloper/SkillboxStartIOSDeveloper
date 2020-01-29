//
//  ViewController.swift
//  Lesson10Task1
//
//  Created by Михаил Беленко on 24.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()

        setChildViewController(controller: storyboard!.instantiateViewController(identifier: "CollectionViewViewController"))
    }

    private func setChildViewController(controller: UIViewController) {
        addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(controller.view)

        NSLayoutConstraint.activate([
            controller.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            controller.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            controller.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            controller.view.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -8)
        ])

        controller.didMove(toParent: self)
    }

    @IBAction func changeSegmantedControl(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "CollectionViewViewController"))
        case 1:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "TableViewViewController"))
        case 2:
            setChildViewController(controller: storyboard!.instantiateViewController(identifier: "ScrollViewViewController"))
        default:
            fatalError("imposible")
        }
    }
}

