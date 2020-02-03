//
//  ViewController.swift
//  Lesson13
//
//  Created by Михаил Беленко on 03.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animateView: UIView!
    @IBOutlet weak var animateViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var animateViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var numberOfAnimationLabel: UILabel!
    
    private var numberOfAnimation: Int = 1

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        animate()
    }

    private func animate() {
        switch numberOfAnimation {
        case 1:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations:
                { [unowned self] in
                    self.animateView.backgroundColor = .systemYellow
                }, completion: { [unowned self] _ in
                    self.animateView.backgroundColor = .systemRed
            })
        case 2:
            self.animateView.frame.origin.y = self.view.frame.size.height / 2
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: { [unowned self] in
                self.animateView.frame.origin.y = self.view.frame.size.height
                self.animateView.frame.origin.x = 0
                }, completion: nil)
        case 3:
            CATransaction.begin()
            CATransaction.setCompletionBlock { [unowned self] in
                let animateOff = CABasicAnimation(keyPath: "cornerRadius")
                animateOff.fromValue = self.animateView.frame.size.width / 2
                animateOff.toValue = 0
                animateOff.duration = 1
                self.animateView.layer.add(animateOff, forKey: "cornerRadiusOff")
                self.animateView.layer.cornerRadius = 0
            }
            let animateOn = CABasicAnimation(keyPath: "cornerRadius")
            animateOn.fromValue = 0
            animateOn.toValue = animateView.frame.size.width / 2
            animateOn.duration = 1
            animateView.layer.add(animateOn, forKey: "cornerRadiusOn")
            animateView.layer.cornerRadius = animateView.frame.size.width / 2
            CATransaction.commit()
        case 4:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: { [unowned self] in
                self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
                }, completion: nil)
        case 5:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: { [unowned self] in
                self.animateView.alpha = 0
                }, completion: { [unowned self] _ in
                    self.animateView.alpha = 1
            })
        case 6:
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: { [unowned self] in
                self.animateViewWidthConstraint.constant = self.animateViewWidthConstraint.constant * 2
                self.animateViewHeightConstraint.constant = self.animateViewHeightConstraint.constant * 2
                self.view.layoutIfNeeded()
                }, completion: {[unowned self] _ in
                    self.animateViewWidthConstraint.constant = self.animateViewWidthConstraint.constant / 2
                    self.animateViewHeightConstraint.constant = self.animateViewHeightConstraint.constant / 2
                    self.view.layoutIfNeeded()
            })
        case 7:
            UIView.animate(withDuration: 1, delay: 0, options: [.repeat, .curveLinear], animations: { [unowned self] in
                self.animateView.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2)
                }, completion: nil)
        default:
            fatalError("number of animation more 7 or less 1")
        }
    }

    @IBAction func backBatton(_ sender: Any) {
        if numberOfAnimation != 1 {
            numberOfAnimation -= 1
            numberOfAnimationLabel.text = "\(numberOfAnimation)"
            animate()
        }
    }
    
    @IBAction func nextButton(_ sender: Any) {
        if numberOfAnimation != 7 {
            numberOfAnimation += 1
            numberOfAnimationLabel.text = "\(numberOfAnimation)"
            animate()
        }
    }
}

