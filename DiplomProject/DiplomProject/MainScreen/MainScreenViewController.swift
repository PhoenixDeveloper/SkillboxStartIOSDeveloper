//
//  MainScreenViewController.swift
//  DiplomProject
//
//  Created by Михаил Беленко on 05.02.2020.
//  Copyright © 2020 Михаил Беленко. All rights reserved.
//

import UIKit
import DTTableViewManager
import RxSwift
import RxCocoa

class MainScreenViewController: UIViewController, DTTableViewManageable {

    var disposeBag = DisposeBag()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var addIncomeButton: UIButton!
    @IBOutlet weak var goToExpenseIncomeChartButton: UIButton!

    private lazy var addCategoryView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 70))
        let button = DefaultButton()
        button.setTitle("Добавить категорию", for: .normal)

        button.rx.controlEvent(.touchUpInside).subscribe(onNext: { [unowned self] _ in
            self.showAddCategotyAlert()
        }).disposed(by: disposeBag)

        view.addSubview(button)

        button.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(16)
        }

        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        configureCells()
        configureTableView()
        balanceLabel.text = "\(Persistence.storage.getBalance()) ₽"
        manager.memoryStorage.setItems(Persistence.storage.getCategories())
    }

    private func setupUI() {
        navigationItem.title = "Главный экран"

        addIncomeButton.layer.cornerRadius = 10
        goToExpenseIncomeChartButton.layer.cornerRadius = 10

        balanceLabel.rx.observe(String.self, "text").subscribe(onNext: { [unowned self] _ in
            self.balanceLabel.textColor = Persistence.storage.getBalance() >= 0 ? UIColor.systemGreen : UIColor.systemRed
            }).disposed(by: disposeBag)
    }

    private func configureCells() {
        manager.register(ExcensesCategoryTableViewCell.self)
    }

    private func configureTableView() {
        tableView.tableFooterView = addCategoryView
    }
    
    @IBAction func addIncomeClick(_ sender: Any) {
        showAddIncomeAlert()
    }

    @IBAction func goToExpenseIncomeChartClick(_ sender: Any) {
        let vc = storyboard!.instantiateViewController(withIdentifier: "ChartExpenseIncomeViewController")
        navigationController?.pushViewController(vc, animated: true)
    }

}
