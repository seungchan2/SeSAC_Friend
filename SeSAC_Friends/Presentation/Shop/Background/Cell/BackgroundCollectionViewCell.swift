//
//  BackgroundCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/03.
//

import UIKit

import SnapKit
import Then

final class BackgroundCollectionViewCell: UICollectionViewCell {
    
    let backgroundImageView = UIImageView().then {
        $0.makeRounded(radius: 8)
    }
    
    let nameLabel = UILabel().then {
        $0.font = .boldSystemFont(ofSize: 14)
    }
    
    let explainLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 0
    }
    
    let priceButton = UIButton().then {
        $0.makeRounded(radius: 8)
        $0.titleLabel?.font = .systemFont(ofSize: 12)
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
        [backgroundImageView, nameLabel, explainLabel, priceButton].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraints() {
        backgroundImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.leading.equalTo(160)
        }
        
        nameLabel.snp.makeConstraints {
            $0.bottom.equalTo(explainLabel.snp.top).inset(-15)
            $0.leading.equalTo(backgroundImageView.snp.trailing).inset(-12)
        }
        
        priceButton.snp.makeConstraints {
            $0.centerY.equalTo(nameLabel)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(20)
            $0.width.equalTo(52)
        }
        
        explainLabel.snp.makeConstraints {
            $0.centerY.equalTo(backgroundImageView).multipliedBy(1.1)
            $0.leading.equalTo(backgroundImageView.snp.trailing).inset(-12)
            $0.trailing.equalToSuperview()
        }
        
        
    }
    
}
