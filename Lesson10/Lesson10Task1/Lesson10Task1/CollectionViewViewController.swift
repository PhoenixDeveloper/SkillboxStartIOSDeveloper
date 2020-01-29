//
//  CollectionViewViewController.swift
//  Lesson10Task1
//
//  Created by Михаил Беленко on 24.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class CollectionViewViewController: UIViewController {

    var product: [ProductShopModel] = []

    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        product = getMockedData()
    }

    func getMockedData() -> [ProductShopModel] {
        return [
            ProductShopModel(name: "Жакет женский",
                             oldPrice: 4999,
                             sale: 40,
                             productImage: UIImage(imageLiteralResourceName: "clothes1")),
            ProductShopModel(name: "Кофта женская",
                             oldPrice: 3599,
                             sale: 35,
                             productImage: UIImage(imageLiteralResourceName: "clothes2")),
            ProductShopModel(name: "Рубашка мужская",
                             oldPrice: 6999,
                             sale: 60,
                             productImage: UIImage(imageLiteralResourceName: "clothes3")),
            ProductShopModel(name: "Куртка мужская",
                             oldPrice: 13999,
                             sale: 50,
                             productImage: UIImage(imageLiteralResourceName: "clothes4")),
            ProductShopModel(name: "Платье женское",
                             oldPrice: 8999,
                             sale: 75,
                             productImage: UIImage(imageLiteralResourceName: "clothes5")),
            ProductShopModel(name: "Свитшот мужской",
                             oldPrice: 4999,
                             sale: 30,
                             productImage: UIImage(imageLiteralResourceName: "clothes6"))
        ]
    }

    func throughText(text: String) -> NSAttributedString {
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: text)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}

extension CollectionViewViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.bounds.width / 2 - 26
        return CGSize(width: width, height: collectionView.bounds.height / 2 - 10)
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        product.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShopCollectionViewCell

        var currentProduct = product[indexPath.row]
        cell.productImageView.image = currentProduct.productImage
        cell.oldPriceLabel.attributedText = throughText(text: "\(currentProduct.oldPrice) руб.")
        cell.saleLabel.text = "-\(currentProduct.sale)%"
        cell.currentPriceLabel.text = "\(currentProduct.currentPrice) руб."
        cell.nameProductLabel.text = currentProduct.name

        return cell
    }


}
