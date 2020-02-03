//
//  CustomButton.swift
//  Lesson11
//
//  Created by Михаил Беленко on 29.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

@IBDesignable
class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 2 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = .black {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable var width: CGFloat = 100 {
        didSet {
            frame = CGRect(origin: frame.origin, size: CGSize(width: width, height: frame.height))
        }
    }
}
