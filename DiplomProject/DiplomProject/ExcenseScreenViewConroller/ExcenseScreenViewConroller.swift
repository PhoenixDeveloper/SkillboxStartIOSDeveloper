//
//  ExcenseScreenViewConroller.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTTableViewManager
import RxSwift
import RxCocoa

class ExcenseScreenViewConroller: UIViewController, DTTableViewManageable {

    var disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!

    private lazy var addExcenseView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 70))
        let button = DefaultButton()
        button.setTitle("Добавить расход", for: .normal)

        button.rx.controlEvent(.touchUpInside).subscribe(onNext: { [unowned self] _ in
            self.showAddExcenseAlert()
        }).disposed(by: disposeBag)

        view.addSubview(button)

        button.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }

        return view
    }()

    var nameCategory: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        manager.register(TransactionTableViewCell.self)
        setupUI()
        configureTableView()
        manager.memoryStorage.setItems(Persistence.storage.getExpensesFromCategory(nameCategory: nameCategory))
    }

    private func setupUI() {
        navigationItem.title = nameCategory
    }

    private func configureTableView() {
        tableView.tableFooterView = addExcenseView
    }
}
