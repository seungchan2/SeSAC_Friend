//
//  NearHobbyCollectionViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/10.
//

import UIKit

import SnapKit
import Then

class NearHobbyCollectionViewCell: UICollectionViewCell {
    
    let hobbyLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
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
        addSubview(hobbyLabel)
    }
    
    private func setConstraints() {
        hobbyLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}

