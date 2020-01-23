//
//  ViewController.swift
//  Lesson8Task2
//
//  Created by Михаил Беленко on 23.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...4 {
            let imageView = UIImageView(frame: CGRect(x: i % 2 == 1 ? 50 : 200,
                                                      y: i > 2 ? 200 : 50,
                                                      width: 100,
                                                      height: 100))
            imageView.image = UIImage(imageLiteralResourceName: "Image\(i)")
            let label = UILabel(frame: CGRect(x: imageView.frame.minX,
                                              y: imageView.frame.maxY + 20,
                                              width: imageView.frame.width,
                                              height: 20))
            label.textAlignment = .center
            label.text = "Image\(i)"
            view.addSubview(imageView)
            view.addSubview(label)
        }
    }


}

