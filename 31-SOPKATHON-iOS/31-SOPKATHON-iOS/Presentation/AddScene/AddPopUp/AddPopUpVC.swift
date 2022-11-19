//
//  AddPopUpVC.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import UIKit

class AddPopUpVC: UIViewController {
    
    private let firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        return view
    }()
    
    var price = 750000
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "img_clap")
        
        return view
    }()
    
    lazy var priceLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 32, weight: .bold)
        $0.text = "\(price)won"
    }
    
    private let noticeLabel = UILabel().then {
        $0.text = "겨울 스웨터 만큼 모았어요!"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 20, weight: .regular)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

extension AddPopUpVC {
    
    private func layout() {
        [firstView, imageView, priceLabel, noticeLabel].forEach {
            view.addSubview($0)
        }
        
        firstView.snp.makeConstraints { make in
            make.top.equalTo(196)
            make.bottom.equalTo(-196)
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self.firstView.snp.top).offset(57)
            
            make.leading.equalTo(self.firstView.snp.leading).offset(71.5)
            make.height.equalTo(200)
            make.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
        
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.firstView.snp.bottom).offset(-130)
            make.centerX.equalToSuperview()
            
            
        }
        
        noticeLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.firstView.snp.bottom).offset(-85)
            make.centerX.equalToSuperview()
            
        }
    }
        
        
    private func setprice() {
        
        if price < 15000 {
            noticeLabel.text = "열심히 참는 중!"
            
        }
        
        else if price < 50000 {
            noticeLabel.text = "피자 한 판을 참았어요!"
            
        }
        
        else if price < 150000 {
            noticeLabel.text = "샤넬 립스틱을 참았어요!"
            
        }
        
        else if price < 300000 {
            noticeLabel.text = "에어팟 프로를 참았어요!"
            
        }
        
        else if price < 500000 {
            noticeLabel.text = "티파니 반지를 참았어요!"
            
        }
        
        else {
            noticeLabel.text = "소니 헤드셋을 참았어요!"
            
            
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
