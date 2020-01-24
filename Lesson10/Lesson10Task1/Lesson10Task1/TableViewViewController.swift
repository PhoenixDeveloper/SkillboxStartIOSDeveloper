//
//  TableViewViewController.swift
//  Lesson10Task1
//
//  Created by Михаил Беленко on 24.01.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit

class TableViewViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var menuItems: [[MenuItemModel]] = []

    func getMockedData() -> [[MenuItemModel]] {
        var firstSection: [MenuItemModel] = []
        var secondSection: [MenuItemModel] = []
        var thirdSection: [MenuItemModel] = []
        var fourthSection: [MenuItemModel] = []
        for index in 1...42 {
            let name = "Настройка №\(index)"
            if index % 7 == 0 {
                firstSection.append(MenuItemModel(icon: UIImage(imageLiteralResourceName: "icon\(index)"), name: name))
                continue
            }
            if index % 3 == 0 {
                secondSection.append(MenuItemModel(icon: UIImage(imageLiteralResourceName: "icon\(index)"), name: name))
                continue
            }
            if index % 2 == 0 {
                fourthSection.append(MenuItemModel(icon: UIImage(imageLiteralResourceName: "icon\(index)"), name: name))
                continue
            }
            thirdSection.append(MenuItemModel(icon: UIImage(imageLiteralResourceName: "icon\(index)"), name: name))
        }
        return [firstSection, secondSection, thirdSection, fourthSection]
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        menuItems = getMockedData()
        view.backgroundColor = .lightGray
    }
}

extension TableViewViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return menuItems.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems[section].count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section != 0 {
            let header = UIView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: view.bounds.width,
                                            height: 16))
            header.backgroundColor = .gray
            return header
        }
        return UIView()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell") as! MenuTableViewCell

        cell.menuItemIcon.image = menuItems[indexPath.section][indexPath.row].icon
        cell.menuItemName.text = menuItems[indexPath.section][indexPath.row].name

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
