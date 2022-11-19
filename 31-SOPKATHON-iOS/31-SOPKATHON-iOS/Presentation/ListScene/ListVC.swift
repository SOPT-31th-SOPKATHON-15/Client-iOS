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
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = "22.11"
        $0.textColor = .white
    }
    
    private lazy var nextButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        $0.tintColor = .white
    }
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        layout()
        config()
    }
}

// MARK: - Extension

extension ListVC {
    
    // MARK: - Layout Helper
    
    private func config() {
        view.backgroundColor = .white
    }
    
    private func layout() {
        
        view.addSubviews(titleView)
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
        
    }
}
