//
//  ProductShopModel.swift
//  Lesson10Task1
//
//  Created by Михаил Беленко on 24.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

struct ProductShopModel {
    let name: String
    let oldPrice: Int
    let sale: Int
    let productImage: UIImage

    lazy var currentPrice: Int = {
        return roundUp((Double(oldPrice) * (Double(sale) / 100)), toNearest: 500) - 1
    }()

    init(name: String,
         oldPrice: Int,
         sale: Int,
         productImage: UIImage) {
        self.name = name
        self.oldPrice = oldPrice
        self.sale = sale
        self.productImage = productImage
    }

    func roundUp(_ value: Double, toNearest: Double) -> Int {
      return Int(ceil(value / toNearest) * toNearest)
    }
}
