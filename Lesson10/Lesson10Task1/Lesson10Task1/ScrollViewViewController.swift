//
//  ScrollViewViewController.swift
//  Lesson10Task1
//
//  Created by Михаил Беленко on 24.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import SnapKit

class ScrollViewViewController: UIViewController {

    private lazy var scrollView = UIScrollView()

    private lazy var imageBurger: UIView = {
        let view = UIView()
        view.backgroundColor = .brown
        return view
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "Бургерная Джо"
        label.textAlignment = .center
        return label
    }()

    private lazy var typeKitchenLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.tintColor = .gray
        label.text = "Американская кухня"
        label.textAlignment = .center
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupConstrains()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        scrollView.contentSize = CGSize(width: view.frame.width,
                                        height: calculateHeight())
    }

    func addSubviews() {
        scrollView.addSubview(imageBurger)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(typeKitchenLabel)

        view.addSubview(scrollView)
    }

    func setupConstrains() {

        scrollView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
        
        imageBurger.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.height.equalTo(1000)
            make.width.equalTo(view.frame.width).offset(8)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageBurger.snp.bottom).offset(8)
            make.leading.trailing.equalToSuperview().inset(8)
        }

        typeKitchenLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(8)
        }
    }

    func calculateHeight() -> CGFloat {
        return imageBurger.bounds.height + titleLabel.bounds.height + typeKitchenLabel.bounds.height + 32
    }

}
