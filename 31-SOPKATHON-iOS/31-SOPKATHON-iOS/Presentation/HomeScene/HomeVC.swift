//
//  HomeVC.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import SnapKit
import UIKit

class HomeVC: UIViewController {

    // MARK: - UI Components
    
    private let monthLabel: UILabel = {
        let label = UILabel()
        label.text = "22.11"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.backgroundColor = .black
        label.layer.cornerRadius = 22.adjustedH
        label.textAlignment = .center
        label.clipsToBounds = true
        return label
    }()
    
    lazy var carousel: UICollectionView = {
        let layout = CarouselLayout()
        layout.itemSize = CGSize(width: 300, height: 300)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .gray.withAlphaComponent(0.1)
        return cv
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "3,330won"
        label.font = UIFont.systemFont(ofSize: 34)
        label.textColor = .black
        return label
    }()
    
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.text = "열심히 참는 중"
        label.font = UIFont.systemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private let todayLabel: UILabel = {
        let label = UILabel()
        label.text = "👟 오늘은 버스 대신 산책 어때요?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setLayout()
        self.setDelegate()
        self.registerCell()
    }
}

// MARK: - UI & Layout

extension HomeVC {
    private func setLayout() {
        self.view.addSubviews(monthLabel, carousel, priceLabel,
                              statusLabel, todayLabel)
        
        monthLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(79.adjustedH)
            make.centerX.equalToSuperview()
            make.width.equalTo(74.adjusted)
            make.height.equalTo(44.adjustedH)
        }
        
        carousel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(monthLabel.snp.bottom).offset(54)
            make.height.equalTo(300)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(carousel.snp.bottom).offset(28.adjustedH)
            make.centerX.equalToSuperview()
        }
        
        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(20.adjustedH)
            make.centerX.equalToSuperview()
        }
        
        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(60)
            make.centerX.equalToSuperview()
        }
    }
}

// MARK: - Methods

extension HomeVC {
    private func setDelegate() {
        carousel.delegate = self
        carousel.dataSource = self
    }
    
    private func registerCell() {
        HomeImageCVC.register(target: carousel)
    }
}

// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDelegate {

}


// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeImageCVC.className, for: indexPath) as? HomeImageCVC else { return UICollectionViewCell() }
        
        return cell
    }
}
