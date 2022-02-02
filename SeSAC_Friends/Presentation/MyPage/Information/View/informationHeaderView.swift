//
//  MyPageView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

import SnapKit
import Then
import EasyKit

final class informationHeaderView: UIView {
    
    let profileImage = UIImageView().then {
        $0.image = Image.sesacProfile
    }
    
    let nicknameLabel = UILabel().then {
        $0.text = "김새싹"
    }
    
    let nextButton = UIButton().then {
        $0.setImage(Image.sesacArrow, for: .normal)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setView() {
        [profileImage, nicknameLabel, nextButton].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        profileImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.height.width.equalTo(50)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(profileImage.snp.trailing).offset(13)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(22)
            $0.height.width.equalTo(24)
        }
    }
    
}
