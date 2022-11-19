//
//  ListHeaderView.swift
//  31-SOPKATHON-iOS
//
//  Created by 김민 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

// MARK: - ListHeaderView

class ListHeaderView: UIView {
    
    // MARK: - UI Components
    
    private let dateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = "12.12"
    }
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension

extension ListHeaderView {
    
    // MARK: - Layout Helper
    
    private func layout() {
        
        self.addSubviews(dateLabel)
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
    }
}
