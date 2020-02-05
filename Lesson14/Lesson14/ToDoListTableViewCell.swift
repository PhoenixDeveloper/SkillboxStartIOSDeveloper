//
//  ToDoListTableViewCell.swift
//  Lesson14
//
//  Created by Михаил Беленко on 04.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTModelStorage
import SnapKit
import RxSwift

class ToDoListTableViewCell: UITableViewCell, ModelTransfer {
    typealias ModelType = TaskRealmEntity
    var model: ModelType!

    private let disableColor: UIColor = UIColor.black.withAlphaComponent(0.1)

    private var isComplite = false {
        didSet {
            if isComplite {
                nameTaskLabel.attributedText = setStruckThroughText(text: nameTaskLabel.text)
                dateCreateTaskLabel.attributedText = setStruckThroughText(text: dateCreateTaskLabel.text)
                descriptionTaskTextView.isEditable = false
                descriptionTaskTextView.backgroundColor = disableColor
                compliteTaskButton.isEnabled = false
                compliteTaskButton.setTitleColor(.black, for: .normal)
                compliteTaskButton.backgroundColor = disableColor
            }
        }
    }

    var disposeBag = DisposeBag()

    private lazy var nameTaskLabel = UILabel()
    private lazy var dateCreateTaskLabel = UILabel()
    
    lazy var descriptionTaskTextView: UITextView = {
        let textView = UITextView()
        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.black.cgColor
        return textView
    }()

    lazy var compliteTaskButton: UIButton = {
        let button = UIButton()
        button.setTitle("✓", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupCell() {
        contentView.addSubview(nameTaskLabel)
        contentView.addSubview(dateCreateTaskLabel)
        contentView.addSubview(descriptionTaskTextView)
        contentView.addSubview(compliteTaskButton)

        setupConstraint()
    }

    private func setStruckThroughText(text: String?) -> NSAttributedString? {
        guard let text = text else {
            return nil
        }
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }

    func update(with model: TaskRealmEntity) {
        self.model = model
        nameTaskLabel.text = self.model.name
        dateCreateTaskLabel.text = convertDate(date: self.model.createdAt)
        descriptionTaskTextView.text = self.model.notes
        isComplite = self.model.isCompleted
    }

    func setComplite() {
        isComplite = true
    }

    private func convertDate(date: NSDate) -> String {
        let formatter = DateFormatter()
        // initially set the format based on your datepicker date / server String
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let myString = formatter.string(from: date as Date) // string purpose I add here
        // convert your string to date
        let yourDate = formatter.date(from: myString)
        //then again set the date format whhich type of output you need
        formatter.dateFormat = "dd MMMM yyyy HH:mm"
        // again convert your date to string
        return formatter.string(from: yourDate!)
    }

    private func setupConstraint() {
        nameTaskLabel.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().inset(16)
        }

        compliteTaskButton.snp.makeConstraints { make in
            make.top.equalTo(nameTaskLabel.snp.top)
            make.trailing.equalToSuperview().inset(16)
            make.leading.greaterThanOrEqualTo(nameTaskLabel.snp.trailing).offset(16)
            make.bottom.lessThanOrEqualTo(descriptionTaskTextView.snp.top).offset(-8)
            make.height.width.equalTo(30)
        }

        dateCreateTaskLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTaskLabel.snp.bottom).offset(8)
            make.trailing.equalTo(nameTaskLabel.snp.trailing)
            make.leading.equalToSuperview().inset(16)
        }

        descriptionTaskTextView.snp.makeConstraints { make in
            make.top.equalTo(dateCreateTaskLabel.snp.bottom).offset(8)
            make.leading.trailing.bottom.equalToSuperview().inset(16)
            make.height.equalTo(100)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()
    }
}
