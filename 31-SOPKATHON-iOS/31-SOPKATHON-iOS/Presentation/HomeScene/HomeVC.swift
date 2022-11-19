//
//  HomeVC.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import SnapKit
import UIKit

class HomeVC: UIViewController {
    
    // MARK: - Properties
    
    var datas = [UIImage]()
    
    private var currentPage: Int = 0 {
        didSet {
            print(currentPage)
        }
    }
    
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
        let service = DefaultAlertService()
        
        service.fetchHomeList { result in
            result.success { entity in
                if let model = entity {
                    self.datas = model.monthList.map { $0.toImage() }
                    self.carousel.reloadData()
                }
            }
        }
        
//        service.fetchProductList(year: 2022, month: 8) { result in
//            result.success { entity in
//                print(entity)
//            }
//        }
        
//        service.fetchListDetail(productId: 1) { result in
//            result.success { entity in
//                print(entity)
//            }
//        }
//
//        service.addProduct(productName: "선풍기", price: 50000, contents: "선풍기 사려다가 말았다") { result in
//            result.success { entity in
//                print(entity)
//            }
//        }
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
    
    private func fetchData() {
        
    }
}

// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print(carousel.indexPathsForVisibleItems)
    }
}


// MARK: - UICollectionViewDataSource

extension HomeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        datas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeImageCVC.className, for: indexPath) as? HomeImageCVC else { return UICollectionViewCell() }
//        cell.setImage(image: datas[indexPath.row])
        
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let page = Int(targetContentOffset.pointee.x / self.view.frame.width)
        self.currentPage = page
    }
}
