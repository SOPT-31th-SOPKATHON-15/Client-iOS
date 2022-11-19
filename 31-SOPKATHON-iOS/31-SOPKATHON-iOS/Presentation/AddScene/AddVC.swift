//
//  AddVC.swift
//  31-SOPKATHON-iOS
//
//  Created by Junho Lee on 2022/11/20.
//

import UIKit
import SnapKit

class AddVC: UIViewController, UITextFieldDelegate {
    
    let questionLabel1:UILabel = {
        let label = UILabel()
        label.text = "무엇을 참았나요?"
        label.textColor = .black
        label.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
        return label
    }()
    
    let textField1:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    let underLineView1: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let questionLabel2:UILabel = {
        let label = UILabel()
        label.text = "얼마나 참았나요?"
        label.textColor = .black
        label.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
        return label
    }()
    
    let textField2:UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.textColor = .black
        return textField
    }()
    
    let underLineView2: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
                          
    let wonLabel:UILabel = {
        let label = UILabel()
        label.text = "원"
        label.textColor = .black
        label.font = UIFont(name: "NotoSansCJKKR-Bold", size: 20)
        return label
    }()
    
    
    lazy var questionLabel3:UILabel = {
        let label = UILabel()
        label.text = "한마디 (0/30)"
        label.textColor = .black
        label.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
        return label
    }()
    
    let textView:UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .myGrey
        textView.font = UIFont(name: "NotoSansCJKKR-Bold", size: 16)
        return textView
    }()
    
    let registerButton:UIButton = {
        let button = UIButton()
        button.setTitle("등록하기", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = .myGrey
        button.tintColor = .white
        button.addTarget(self, action: #selector(presentToAddPopUpVC), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        self.view.backgroundColor = .white
        textView.delegate = self
        self.completionButton(isOn: false)
        textField1.delegate = self
        textField2.delegate = self
        setLayout()
        super.viewDidLoad()
    }

}

extension AddVC {
    private func setLayout(){
        [questionLabel1, textField1, questionLabel2, textField2, wonLabel, underLineView1, underLineView2, questionLabel3, textView, registerButton].forEach {
            view.addSubview($0)
        }
        
        questionLabel1.snp.makeConstraints {
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(84)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide).offset(16)
        }
        
        textField1.snp.makeConstraints {
            $0.top.equalTo(self.questionLabel1.snp.bottom).offset(8)
            $0.leading.equalTo(self.questionLabel1)
            $0.width.equalTo(343)
            $0.height.equalTo(48)
        }
        
        underLineView1.snp.makeConstraints {
            $0.top.equalTo(self.questionLabel1.snp.bottom).offset(56)
            $0.leading.equalTo(self.questionLabel1)
            $0.width.equalTo(343)
            $0.height.equalTo(1)
        }
        
        questionLabel2.snp.makeConstraints {
            $0.top.equalTo(self.underLineView1.snp.bottom).offset(40)
            $0.leading.equalTo(self.questionLabel1)
        }

        textField2.snp.makeConstraints {
            $0.top.equalTo(self.questionLabel2.snp.bottom).offset(8)
            $0.leading.equalTo(self.questionLabel1)
            $0.width.equalTo(343)
            $0.height.equalTo(48)
        }
        
        underLineView2.snp.makeConstraints {
            $0.top.equalTo(self.questionLabel2.snp.bottom).offset(56)
            $0.leading.equalTo(self.questionLabel1)
            $0.width.equalTo(343)
            $0.height.equalTo(1)
        }
        
        wonLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.underLineView2.snp.top).offset(-3)
            $0.leading.equalTo(self.view.safeAreaLayoutGuide.snp.leading).offset(340)
        }
        
        questionLabel3.snp.makeConstraints {
            $0.top.equalTo(self.underLineView2.snp.bottom).offset(40)
            $0.leading.equalTo(self.questionLabel1)
        }
        
        textView.snp.makeConstraints {
            $0.top.equalTo(self.questionLabel3.snp.bottom).offset(8)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide).inset(16)
            $0.width.equalTo(343)
            $0.height.equalTo(140)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(self.view.snp.bottom).offset(-80)
            $0.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
            $0.width.equalTo(375)
            $00.height.equalTo(80)
        }
    }
}

extension AddVC : UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        questionLabel3.text = "한마디 (\(changedText.count)/30)"
        return changedText.count < 30
    }
}

extension AddVC {
    func completionButton(isOn: Bool){
        switch isOn{
        case true:
            registerButton.isEnabled = true
            registerButton.backgroundColor = .myBlue
        case false:
            registerButton.isEnabled = false
            registerButton.backgroundColor = .systemGray
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        let test = !(textField1.text?.isEmpty ?? true) && !(textField2.text?.isEmpty ?? true)
        completionButton(isOn: test)
    }
    
    @objc private func presentToAddPopUpVC(){
        let popupVC = AddPopUpVC()
        popupVC.modalPresentationStyle = .fullScreen
        self.present(popupVC, animated: true)
    }
}
