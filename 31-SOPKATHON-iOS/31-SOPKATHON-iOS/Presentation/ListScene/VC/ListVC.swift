//
//  ListVC.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import UIKit

import SnapKit
import Then

// MARK: - ListVC

class ListVC: UIViewController {
    
    // MARK: - UI Components
    
    private let titleView = UIView().then {
        $0.backgroundColor = .black
    }
    
    private lazy var titleStackView = UIStackView(arrangedSubviews: [backButton, dateLabel, nextButton]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .equalSpacing
    }
    
    private lazy var backButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        $0.tintColor = .white
    }
    
    private lazy var dateLabel = UILabel().then {
        $0.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
        $0.text = "22.11"
        $0.textColor = .white
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .white
    }
    
    private lazy var listTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        config()
        register()
    }
}

// MARK: - Extension

extension ListVC {
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        view.addSubviews(titleView, listTableView)
        titleView.addSubview(titleStackView)
        
        titleView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(140)
        }
        
        titleStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-11)
            $0.width.equalTo(146)
            $0.height.equalTo(41)
        }
        
        listTableView.snp.makeConstraints {
            $0.top.equalTo(titleView.snp.bottom).offset(32)
            $0.leading.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-16)
            //$0.height.equalTo(90 * 5)
            $0.bottom.equalToSuperview()
        }
    }
    
    // MARK: - General Helper
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func register() {
        listTableView.register(ListTableViewCell.self, forCellReuseIdentifier: ListTableViewCell.identifier)
    }
    
    private func presentToDetailPopUpVC() {
        let vc = DetailPopUpVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension ListVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.identifier, for: indexPath) as? ListTableViewCell else {return UITableViewCell()}
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension ListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ListHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presentToDetailPopUpVC()
    }
}
