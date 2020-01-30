//
//  CustomSegmentControl.swift
//  Lesson11
//
//  Created by Михаил Беленко on 30.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

protocol CustomSegmentControlDelegate {

    func getSelectedItem() -> UIView
}

@IBDesignable
class CustomSegmentControl: UISegmentedControl, CustomSegmentControlDelegate {

    private var isSetuped = false

    @IBInspectable var firstSegmentText: String? {
        didSet {
            setTitle(firstSegmentText, forSegmentAt: 0)
        }
    }

    @IBInspectable var secondSegmentText: String? {
        didSet {
            setTitle(secondSegmentText, forSegmentAt: 1)
        }
    }

    @IBInspectable var firstSegmentBackgroundColor: UIColor?

    @IBInspectable var secondSegmentBackgroundColor: UIColor?

    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        if isSetuped { return }
        isSetuped = true

        changeSelectedItem(sender: self)
        addTarget(self, action: #selector(changeSelectedItem), for: .valueChanged)
    }

    @objc
    private func changeSelectedItem(sender: UISegmentedControl)
    {
        if #available(iOS 13.0, *) {
            switch selectedSegmentIndex {
            case 0:
                selectedSegmentTintColor = firstSegmentBackgroundColor
            case 1:
                selectedSegmentTintColor = secondSegmentBackgroundColor
            default:
                fatalError("Not first or second item")
            }
        }
        else {
            let color = selectedSegmentIndex == 0 ? firstSegmentBackgroundColor : secondSegmentBackgroundColor
            let subViewOfSegment: UIView = subviews[selectedSegmentIndex] as UIView
            subViewOfSegment.tintColor = color
        }
    }

    func getSelectedItem() -> UIView {
        return subviews[selectedSegmentIndex] as UIView
    }
}
