//
//  ExcensesCategoryTableViewCell.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTModelStorage
import SnapKit

class ExcensesCategoryTableViewCell: UITableViewCell, ModelTransfer {
    typealias ModelType = ExpenseCategory

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .systemBlue
        return label
    }()

    private lazy var expensesSumLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemRed
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(nameLabel)
        contentView.addSubview(expensesSumLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with model: ExpenseCategory) {
        nameLabel.text = model.name
        expensesSumLabel.text = "-\(model.expensesList.reduce(0, { $0 + $1.value })) ₽"
    }

    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(16)
        }

        expensesSumLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel.snp.trailing).offset(8)
            make.top.bottom.trailing.equalToSuperview().inset(16)
        }
    }
}
