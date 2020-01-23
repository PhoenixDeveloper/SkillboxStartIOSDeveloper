//
//  ThirdTabParentViewController.swift
//  Lesson7Task1
//
//  Created by Михаил Беленко on 12.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

protocol ThirdTabChangeColorScreenDelegate {
    func changeColorScreen(color: ThirdTabColorScreen)
}

class ThirdTabParentViewController: UIViewController {

    private var childVC: ThirdTabChangeColorScreenDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ThirdTabChildViewController, segue.identifier == "EmbedChild"{
            childVC = vc
            vc.parentVC = self
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }


    @IBAction func selectPurple(_ sender: Any) {
        childVC.changeColorScreen(color: .purple)
    }

    @IBAction func selectYellow(_ sender: Any) {
        childVC.changeColorScreen(color: .yellow)
    }

    @IBAction func selectGreen(_ sender: Any) {
        childVC.changeColorScreen(color: .green)
    }

}

extension ThirdTabParentViewController: ThirdTabChangeColorScreenDelegate {

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
