//
//  ImageCVC.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import UIKit

import SnapKit

final class HomeImageCVC: UICollectionViewCell, UICollectionViewRegisterable {
    
    // MARK: - Properties
    
    static var isFromNib: Bool = false
    
    // MARK: - UI Components
    
    private let itemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(named: "img_face")
        return iv
    }()
    
    // MARK: - View Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Methods

extension HomeImageCVC {
    
    private func setLayout() {
        addSubview(itemImageView)
        
        itemImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.center.equalToSuperview()
            make.height.equalTo(itemImageView.snp.width)
        }
    }
}
