//
//  MyHobbyCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/16.
//

import UIKit

import SnapKit
import Then

class MyHobbyCollectionViewCell: UICollectionViewCell {
    
    let hobbyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
    }
    
    let xImage = UIImageView().then {
        $0.image = Image.sesacX
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
        super.preferredLayoutAttributesFitting(layoutAttributes)
        layoutIfNeeded()
        let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
        var frame = layoutAttributes.frame
        frame.size.width = ceil(size.width)
        layoutAttributes.frame = frame
        return layoutAttributes
    }
    
    private func setUI() {
        [hobbyLabel, xImage].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraints() {
        hobbyLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(12)
        }
        
        xImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(10.5)
            $0.leading.equalTo(hobbyLabel.snp.trailing).inset(-7)
            $0.trailing.equalToSuperview().inset(12)
        }
        
        
    }
}

