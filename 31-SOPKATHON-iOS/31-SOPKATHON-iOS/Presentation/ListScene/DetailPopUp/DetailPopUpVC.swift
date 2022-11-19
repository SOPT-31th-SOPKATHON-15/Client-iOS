//
//  DetailPopUpVC.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import SnapKit
import UIKit
import Then

class DetailPopUpVC: UIViewController {
    
    
    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    private let priceLabel = UILabel().then {
        $0.text = "7,500won"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 32, weight: .bold)
    }

    private let noticeLabel = UILabel().then {
        $0.text = "스타벅스 케이크를 참았어요"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .regular)
    }

    private let middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .black


        return view
    }()

    private let noteLabel = UILabel().then {
        $0.text = "진짜 너무너무 마시고 싶었는데.. \n \n 그래도 참는다"
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.numberOfLines = 0
        $0.textAlignment = .center
    }

    private var closeButton: UIButton = {
        let button = UIButton()
        button.setTitle("닫기", for: .normal)
        button.setTitleColor(.blue, for: .normal)

        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.8)
        
        layout()
        config()
        
    }
    
}

        
    
        

extension DetailPopUpVC {
    
    private func layout() {
        
        view.addSubviews(firstView, priceLabel, noticeLabel, middleView, closeButton)
        middleView.addSubview(noteLabel)
        
        firstView.snp.makeConstraints { make in
            make.top.equalTo(196)
            make.bottom.equalTo(-196)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(self.firstView.snp.top).offset(39)
            make.leading.equalTo(self.firstView.snp.leading).offset(110)
            
        }
        
        noticeLabel.snp.makeConstraints { make in
            make.top.equalTo(self.firstView.snp.top).offset(91)
            make.centerX.equalToSuperview()
            
    
            
        }
        
        middleView.snp.makeConstraints { make in
            make.top.equalTo(self.firstView.snp.top).offset(175)
            make.leading.equalTo(self.firstView.snp.leading).offset(31)
            make.trailing.equalTo(self.firstView.snp.trailing).offset(-31)
            make.bottom.equalTo(self.firstView.snp.bottom).offset(-115)
            
        }
        
        noteLabel.snp.makeConstraints { make in
            //make.top.equalTo(self.middleView.snp.top).offset(16)
            //make.leading.equalTo(self.middleView.snp.leading).offset(18)
            make.centerX.equalTo(middleView)
            make.centerY.equalToSuperview()
            
        }
        
        closeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.firstView.snp.bottom).offset(-31)
            
        }
    }
    
    private func config() {
        
        middleView.clipsToBounds = true
        middleView.layer.cornerRadius = 20
        middleView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMaxXMinYCorner,.layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        
//        middleView.layer.cornerRadius = 5
//        middleView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner)
    }
}

    
 
    

