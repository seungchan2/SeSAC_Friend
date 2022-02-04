//
//  MessageView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/04.
//

import UIKit

import SnapKit
import Then

class MessageView: UIView, Representable {
    
    let explainLabel = UILabel().then {
        $0.text = "인증문자가 문자로 전송되었어요"
        $0.font = .systemFont(ofSize: 20)
        $0.textColor = Color.sesacBlack
        $0.textAlignment = .center
    }
    
    let timeMaxLabel = UILabel().then {
        $0.text = "(최대 20초 소모)"
        $0.textColor = Color.sesacGray7
        $0.textAlignment = .center
    }
    
    let timerLabel = UILabel().then {
        $0.text = "05:00"
        $0.font = .systemFont(ofSize: 14)
        $0.textColor = Color.sesacGreen
    }
    
    let phoneNumberTextField = TextFieldStyle(frame: CGRect(), mode: .inactive).then {
        $0.textField.placeholder = "인증번호 입력"
        $0.textField.font = .systemFont(ofSize: 14)
    }
    
    let timerButton = ButtonStyle(frame: CGRect(), mode: .active, text: "재전송")
    
    let confirmButton = ButtonStyle(frame: CGRect(), mode: .inactive, text: "인증하고 시작하기")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        [explainLabel, timeMaxLabel, phoneNumberTextField, timerLabel, timerButton, confirmButton].forEach {
            self.addSubview($0)
        }
    }
    
    func setupConstraints() {
        explainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(168)
            $0.centerX.equalToSuperview()
        }
        
        timeMaxLabel.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        timerButton.snp.makeConstraints {
            $0.top.equalTo(timeMaxLabel.snp.bottom).inset(-69)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(72)
            $0.height.equalTo(40)
        }
        
        timerLabel.snp.makeConstraints {
            $0.centerY.equalTo(timerButton)
            $0.trailing.equalTo(phoneNumberTextField.snp.trailing).inset(10)
        }
        
        phoneNumberTextField.snp.makeConstraints {
            $0.centerY.equalTo(timerButton)
            $0.leading.equalToSuperview().offset(28)
            $0.trailing.equalTo(timerButton.snp.leading).inset(-12)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(phoneNumberTextField.snp.bottom).inset(-72)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
}

