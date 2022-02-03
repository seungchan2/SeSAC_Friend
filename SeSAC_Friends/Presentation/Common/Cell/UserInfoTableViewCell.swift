//
//  UserInfoTableViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

import SnapKit
import Then

class UserInfoTableViewCell: UITableViewCell {

    let myGenderLabel = UILabel().then {
        $0.text = "내 성별"
    }
    
    let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 8
        $0.alignment = .center
    }
    
    let manButton = UIButton().then {
        $0.setTitle("남자", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
    }
    
    let womanButton = UIButton().then {
        $0.setTitle("여자", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
    }
    
    let hobbyLabel = UILabel().then {
        $0.text = "자주 하는 취미"
    }
    
    let hobbyTextField = UITextField().then {
        $0.textAlignment = .left
        $0.borderStyle = .none
        $0.placeholder = "취미를 입력해주세요"
    }
    
    let textFieldBottomView = UIView().then {
        $0.backgroundColor = Color.sesacGray2
    }
    
    let phoneSearchLabel = UILabel().then {
        $0.text = "내 번호 검색 허용"
    }
    
    let searchSwitch = UISwitch().then {
        $0.isOn = false
    }
    
    let ageLabel = UILabel().then {
        $0.text = "상대방 연령대"
    }
    
    let agePeriodLabel = UILabel().then {
        $0.text = "18 - 35"
    }
    
    let ageSlider = UISlider()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [myGenderLabel, buttonStackView, manButton, womanButton, hobbyLabel, hobbyTextField, textFieldBottomView, phoneSearchLabel, searchSwitch, ageLabel, agePeriodLabel, ageSlider].forEach {
            addSubview($0)
        }
        buttonStackView.addArrangedSubviews(manButton, womanButton)
    }
    
    private func setConstraints() {
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(48)
        }
        
        manButton.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.top)
            $0.leading.equalTo(buttonStackView.snp.leading)
            $0.width.equalTo(56)
        }
        
        womanButton.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.top)
            $0.trailing.equalTo(buttonStackView.snp.trailing)
            $0.width.equalTo(56)
        }
        
        myGenderLabel.snp.makeConstraints {
            $0.centerY.equalTo(buttonStackView)
            $0.leading.equalToSuperview().inset(16)
        }
        
        hobbyTextField.snp.makeConstraints {
            $0.top.equalTo(buttonStackView.snp.bottom).inset(-29)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
            $0.width.equalToSuperview().multipliedBy(0.5)
        }
        
        textFieldBottomView.snp.makeConstraints {
            $0.top.equalTo(hobbyTextField.snp.bottom)
            $0.width.equalToSuperview().multipliedBy(0.5)
            $0.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(1)
        }
            
        hobbyLabel.snp.makeConstraints {
            $0.centerY.equalTo(hobbyTextField)
            $0.leading.equalToSuperview().inset(16)
        }
        
        searchSwitch.snp.makeConstraints {
            $0.top.equalTo(textFieldBottomView.snp.bottom).inset(-26)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        phoneSearchLabel.snp.makeConstraints {
            $0.centerY.equalTo(searchSwitch)
            $0.leading.equalToSuperview().inset(16)
        }
        
        agePeriodLabel.snp.makeConstraints {
            $0.top.equalTo(searchSwitch.snp.bottom).inset(-30)
            $0.trailing.equalToSuperview().inset(16)
        }
        
        ageLabel.snp.makeConstraints {
            $0.centerY.equalTo(agePeriodLabel)
            $0.leading.equalToSuperview().inset(16)
        }
        
        ageSlider.snp.makeConstraints {
            $0.top.equalTo(ageLabel.snp.bottom).inset(-14)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
}
