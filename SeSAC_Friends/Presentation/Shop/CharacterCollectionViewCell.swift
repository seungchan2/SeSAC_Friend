//
//  CharacterCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/03.
//

import UIKit

import SnapKit
import Then

class CharacterCollectionViewCell: UICollectionViewCell {
    
    let characterImageView = UIImageView().then {
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
    }
    
    let priceButton = UIButton().then {
        $0.makeRounded(radius: 8)
        $0.backgroundColor = Color.sesacGray4
        $0.setTitle("보유", for: .normal)
        $0.setTitleColor(Color.sesacGray2, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 12)
    }
    
    let explainLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 13)
        $0.numberOfLines = 3
    }
    
    override init(frame: CGRect) {
           super.init(frame: frame)
        setUI()
        setConstraints()
       }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [characterImageView, nameLabel, priceButton, explainLabel].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraints() {
        characterImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.width.equalTo(160)
        }
        
        nameLabel.snp.makeConstraints {
            $0.centerY.equalTo(priceButton)
            $0.leading.equalToSuperview()
        }
        
        priceButton.snp.makeConstraints {
            $0.top.equalTo(characterImageView.snp.bottom).inset(-11)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalTo(52)
        }
        
        explainLabel.snp.makeConstraints {
            $0.top.equalTo(priceButton.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
}
