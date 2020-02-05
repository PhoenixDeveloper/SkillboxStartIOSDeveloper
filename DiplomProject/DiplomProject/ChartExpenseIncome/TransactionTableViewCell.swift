//
//  TransactionTableViewCell.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTModelStorage
import SnapKit

class TransactionTableViewCell: UITableViewCell, ModelTransfer {
    typealias ModelType = Transaction

    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .systemBlue
        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(dateLabel)
        contentView.addSubview(valueLabel)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update(with model: Transaction) {
        if model is Income {
            dateLabel.text = convertDate(date: model.date)
            valueLabel.text = "\(model.value) ₽"
            valueLabel.textColor = .systemGreen
        } else if model is Expense {
            dateLabel.text = convertDate(date: model.date)
            valueLabel.text = "-\(model.value) ₽"
            valueLabel.textColor = .systemRed
        } else { fatalError("unknown model")}
    }

    private func convertDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMMM yyyy HH:mm"
        return formatter.string(from: date)
    }

    private func setupConstraints() {
        dateLabel.snp.makeConstraints { make in
            make.top.bottom.leading.equalToSuperview().inset(16)
        }

        valueLabel.snp.makeConstraints { make in
            make.leading.equalTo(dateLabel.snp.trailing).offset(8)
            make.top.bottom.trailing.equalToSuperview().inset(16)
        }
    }
}
