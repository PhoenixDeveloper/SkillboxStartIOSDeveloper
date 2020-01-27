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

    private lazy var saleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "Ваша скидка: 20%"
        return label
    }()

    private lazy var rateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.text = "5.0"
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 15, weight: .regular)
        label.text = "Что нужно чтобы приготовить самые лучшие бургеры? Сперва - это качественные ингредиенты."
        return label
    }()

    private lazy var menuButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.setTitle("Меню", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()

    private lazy var mapView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    private lazy var costDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.tintColor = .gray
        label.text = "Депозит состовляет 100 руб. При отмене брони, менее чем за 2 часа депозит удерживается"
        label.textAlignment = .center
        return label
    }()

    private lazy var createButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 10
        button.setTitle("Создать событие", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()

    private lazy var deliveryButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
        button.setTitle("Заказать на вынос", for: .normal)
        button.setTitleColor(.systemGreen, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        setupConstrains()
    }

    func addSubviews() {
        scrollView.addSubview(imageBurger)
        scrollView.addSubview(titleLabel)
        scrollView.addSubview(typeKitchenLabel)
        scrollView.addSubview(saleLabel)
        scrollView.addSubview(rateLabel)
        scrollView.addSubview(descriptionLabel)
        scrollView.addSubview(menuButton)
        scrollView.addSubview(mapView)
        scrollView.addSubview(costDescriptionLabel)
        scrollView.addSubview(createButton)
        scrollView.addSubview(deliveryButton)

        view.addSubview(scrollView)
    }

    func setupConstrains() {

        let superview = view.safeAreaLayoutGuide

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(superview.snp.edges)
        }
        
        imageBurger.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalTo(superview.snp.leading).offset(8)
            make.trailing.equalTo(superview.snp.trailing).offset(-8)
            make.height.equalTo(400)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageBurger.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(8)
            make.trailing.equalTo(superview.snp.trailing).offset(-8)
        }

        typeKitchenLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(8)
            make.trailing.equalTo(superview.snp.trailing).offset(-8)
        }

        saleLabel.snp.makeConstraints { make in
            make.top.equalTo(typeKitchenLabel.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(8)
        }

        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(typeKitchenLabel.snp.bottom).offset(8)
            make.leading.greaterThanOrEqualTo(saleLabel.snp.trailing).offset(8)
            make.trailing.equalTo(superview.snp.trailing).offset(-8)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(saleLabel.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(8)
            make.trailing.equalTo(superview.snp.trailing).offset(-8)
        }

        menuButton.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(32)
            make.trailing.equalTo(superview.snp.trailing).offset(-32)
        }

        mapView.snp.makeConstraints { make in
            make.top.equalTo(menuButton.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(8)
            make.trailing.equalTo(superview.snp.trailing).offset(-8)
            make.height.equalTo(300)
        }

        costDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(mapView.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(16)
            make.trailing.equalTo(superview.snp.trailing).offset(-16)
        }

        createButton.snp.makeConstraints { make in
            make.top.equalTo(costDescriptionLabel.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(8)
            make.trailing.equalTo(superview.snp.trailing).offset(-8)
        }

        deliveryButton.snp.makeConstraints { make in
            make.top.equalTo(createButton.snp.bottom).offset(8)
            make.leading.equalTo(superview.snp.leading).offset(8)
            make.trailing.equalTo(superview.snp.trailing).offset(-8)
            make.bottom.lessThanOrEqualToSuperview()
        }
    }
}
