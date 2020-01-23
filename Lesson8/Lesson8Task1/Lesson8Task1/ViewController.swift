//
//  ViewController.swift
//  Lesson8Task1
//
//  Created by Михаил Беленко on 23.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pictureImageView: UIImageView!

    var pictureList: [UIImage] = []
    var counter: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 1...10 {
            pictureList.append(UIImage(imageLiteralResourceName: "Image\(i)"))
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        pictureImageView.image = pictureList.first
    }

    @IBAction func backButtonClick(_ sender: Any) {
        if counter != 0 {
            counter -= 1
            pictureImageView.image = pictureList[counter]
        }
    }
    
    @IBAction func nextButtonClick(_ sender: Any) {
        if counter != 9 {
            counter += 1
            pictureImageView.image = pictureList[counter]
        }
    }
}

