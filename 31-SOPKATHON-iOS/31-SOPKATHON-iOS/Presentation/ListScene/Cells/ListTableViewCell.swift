//
//  ListTableViewCell.swift
//  31-SOPKATHON-iOS
//
//  Created by 김민 on 2022/11/20.
//

import UIKit

import SnapKit
import Then

// MARK: - ListTableViewCell

class ListTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ListTableViewCell"
    
    // MARK: - UI Components
    
    private let cellView = UIView()
    private let productNameLabel = UILabel().then {
        $0.text = "테스트"
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let timeLabel = UILabel().then {
        $0.text = "00:00"
        $0.font = .systemFont(ofSize: 12)
    }
    
    private let priceLabel = UILabel().then {
        $0.text = "2000"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    private let wonLabel = UILabel().then {
        $0.text = "원"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    
    // MARK: - View Life Cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layout()
        config()
    } 
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extension

extension ListTableViewCell {
    
    // MARK: - Layout Helper
    
    private func layout() {
        
        contentView.addSubviews(cellView)
        cellView.addSubviews(productNameLabel, timeLabel, priceLabel, wonLabel)
        
        cellView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-12)
        }
        
        productNameLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.trailing.equalToSuperview().offset(-12)
            $0.top.equalToSuperview().offset(10)
        }
        
        timeLabel.snp.makeConstraints {
            $0.leading.equalTo(productNameLabel)
            $0.top.equalTo(productNameLabel.snp.bottom).offset(4)
        }
        
        wonLabel.snp.makeConstraints {
            $0.trailing.equalTo(productNameLabel)
            $0.bottom.equalToSuperview().offset(-13)
        }
        
        priceLabel.snp.makeConstraints {
            $0.trailing.equalTo(wonLabel.snp.leading)
            $0.centerY.equalTo(wonLabel)
        }
    }
    
    // MARK: - General Helper
    
    private func config() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectionStyle = .none
    
        setCellBorder()
    }
    
    private func setCellBorder() {
        cellView.layer.borderWidth = 1
        cellView.layer.borderColor = UIColor(red: 224, green: 224, blue: 224).cgColor
    }
}
