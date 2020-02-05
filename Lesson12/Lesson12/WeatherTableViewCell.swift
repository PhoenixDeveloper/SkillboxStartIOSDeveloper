//
//  WeatherTableViewCell.swift
//  Lesson12
//
//  Created by Михаил Беленко on 31.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTModelStorage
import SnapKit
import RealmSwift

class WeatherTableViewCell: UITableViewCell, ModelTransfer {

    private lazy var dtLabel = UILabel()
    private lazy var minTempDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Min:"
        return label
    }()
    private lazy var minTempLabel = UILabel()
    private lazy var maxTempDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Max:"
        return label
    }()
    private lazy var maxTempLabel = UILabel()

    typealias ModelType = WeatherTableViewCellModel

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(dtLabel)
        contentView.addSubview(minTempDescriptionLabel)
        contentView.addSubview(minTempLabel)
        contentView.addSubview(maxTempDescriptionLabel)
        contentView.addSubview(maxTempLabel)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func update(with model: WeatherTableViewCellModel) {
        dtLabel.text = model.dt
        minTempLabel.text = "\(model.tempMin) °F"
        maxTempLabel.text = "\(model.tempMax) °F"
    }

    private func setupConstraints() {
        dtLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(16)
        }

        minTempLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(16)
        }

        minTempDescriptionLabel.snp.makeConstraints { make in
            make.trailing.equalTo(minTempLabel.snp.leading).offset(-8)
            make.top.equalTo(minTempLabel.snp.top)
        }

        maxTempLabel.snp.makeConstraints { make in
            make.top.greaterThanOrEqualTo(minTempLabel.snp.bottom).offset(8)
            make.bottom.trailing.equalToSuperview().inset(16)
        }

        maxTempDescriptionLabel.snp.makeConstraints { make in
            make.trailing.equalTo(maxTempLabel.snp.leading).offset(-8)
            make.top.equalTo(maxTempLabel.snp.top)
        }
    }

}

class WeatherTableViewCellModel: Object {
    @objc dynamic var dt: String
    @objc dynamic var tempMin: Double
    @objc dynamic var tempMax: Double

    init?(data: NSDictionary) {
        guard let main = data["main"] as? NSDictionary,
            let dt = data["dt_txt"] as? String,
            let tempMin = main["temp_min"] as? Double,
            let tempMax = main["temp_max"] as? Double
            else {
                return nil
        }

        self.dt = dt
        self.tempMin = tempMin
        self.tempMax = tempMax
    }

    required init() {
        self.dt = ""
        self.tempMin = 0.0
        self.tempMax = 0.0
        super.init()
    }
}
