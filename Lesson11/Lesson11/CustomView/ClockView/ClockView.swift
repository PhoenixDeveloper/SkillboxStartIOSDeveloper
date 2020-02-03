//
//  ClockView.swift
//  Lesson11
//
//  Created by Михаил Беленко on 29.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

@IBDesignable
class ClockView: UIView {

    private var isSetuped = false

    @IBInspectable var clockBackgroundColor: UIColor = .gray {
        didSet {
            backgroundColor = clockBackgroundColor
        }
    }

    var markerSize: CGFloat = 4
    var markerLength: CGFloat = 12
    var markerColor: UIColor = .blue

    @IBInspectable var hourLineSize: CGFloat = 8 {
        didSet {
            hourLine.frame = CGRect(origin: hourLine.frame.origin, size: CGSize(width: hourLineSize, height: hourLine.frame.size.height))
        }
    }
    @IBInspectable var hourLineColor: UIColor = .yellow {
        didSet {
            hourLine.backgroundColor = hourLineColor
        }
    }

    @IBInspectable var minuteLineSize: CGFloat = 7 {
        didSet {
            minuteLine.frame = CGRect(origin: minuteLine.frame.origin, size: CGSize(width: minuteLineSize, height: minuteLine.frame.size.height))
        }
    }
    @IBInspectable var minuteLineColor: UIColor = .red {
        didSet {
            minuteLine.backgroundColor = minuteLineColor
        }
    }

    @IBInspectable var secondLineSize: CGFloat = 6 {
        didSet {
            secondLine.frame = CGRect(origin: secondLine.frame.origin, size: CGSize(width: secondLineSize, height: secondLine.frame.size.height))
        }
    }
    @IBInspectable var secondLineColor: UIColor = .green {
        didSet {
            secondLine.backgroundColor = secondLineColor
        }
    }

    @IBInspectable var hours: CGFloat = 3 {
        didSet {
            updateHours()
        }
    }
    @IBInspectable var minutes: CGFloat = 45 {
        didSet {
            updateMinutes()
        }
    }
    @IBInspectable var seconds: CGFloat = 30 {
        didSet {
            updateSeconds()
        }
    }

    private let topMarker = UIView()
    private let leftMarker = UIView()
    private let rightMarker = UIView()
    private let bottomMarker = UIView()

    private let hourLine = UIView()
    private let minuteLine = UIView()
    private let secondLine = UIView()

    override func layoutSubviews() {
        super.layoutSubviews()

        backgroundColor = clockBackgroundColor

        let width = frame.size.width
        let height = frame.size.height

        hourLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        minuteLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        secondLine.layer.anchorPoint = CGPoint(x: 0.5, y: 1)

        hourLine.frame = CGRect(x: width / 2 - hourLineSize / 2, y: height / 2 - height / 6, width: hourLineSize, height: height / 6)
        minuteLine.frame = CGRect(x: width / 2 - minuteLineSize / 2, y: height / 2 - height / 4, width: minuteLineSize, height: height / 4)
        secondLine.frame = CGRect(x: width / 2 - secondLineSize / 2, y: height / 2 - height / 3, width: secondLineSize, height: height / 3)
        updateTime()

        topMarker.frame = CGRect(x: width / 2 - markerSize / 2, y: 0, width: markerSize, height: markerLength)
        leftMarker.frame = CGRect(x: 0, y: height / 2 - markerSize / 2, width: markerLength, height: markerSize)
        rightMarker.frame = CGRect(x: width - markerLength, y: height / 2 - markerSize / 2, width: markerLength, height: markerSize)
        bottomMarker.frame = CGRect(x: width / 2 - markerSize / 2, y: height - markerLength, width: markerSize, height: markerLength)

        for v in [topMarker, leftMarker, rightMarker, bottomMarker] {
            v.backgroundColor = markerColor
        }

        hourLine.backgroundColor = hourLineColor
        minuteLine.backgroundColor = minuteLineColor
        secondLine.backgroundColor = secondLineColor

        layer.cornerRadius = width / 2

        if isSetuped { return }
        isSetuped = false

        for v in [topMarker, leftMarker, rightMarker, bottomMarker, secondLine, minuteLine, hourLine] {
            addSubview(v)
        }
    }

    private func updateTime() {
        updateHours()
        updateMinutes()
        updateSeconds()
    }

    private func updateHours() {
        let angle = CGFloat.pi * 2 * (hours / CGFloat(12))
        hourLine.transform = CGAffineTransform(rotationAngle: angle)
    }

    private func updateMinutes() {
        let angle = CGFloat.pi * 2 * (minutes / CGFloat(60))
        minuteLine.transform = CGAffineTransform(rotationAngle: angle)
    }

    private func updateSeconds() {
        let angle = CGFloat.pi * 2 * (seconds / CGFloat(60))
        secondLine.transform = CGAffineTransform(rotationAngle: angle)
    }

    static func loadFromNIB() -> ClockView {
        let nib = UINib(nibName: "ClockView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! ClockView
    }

}
