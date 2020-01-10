//
//  FirstTabMainViewController.swift
//  Lesson7Task1
//
//  Created by Михаил Беленко on 10.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class FirstTabMainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onGreenControllerClick(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "GreenController") else { return }
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func onBlueControllerClick(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "BlueController") else { return }
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }


    @IBAction func onRedControllerClick(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(identifier: "RedController") else { return }
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
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
