//
//  ProfileImageView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

import SnapKit
import Then

final class ProfileImageView: UIView {
    
    let profileImage = UIImageView().then {
        $0.image = Image.sesacCard
        $0.contentMode = .scaleToFill
    }
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setUI() {
        addSubview(profileImage)
    }
    
    func setConstraints() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview()
        }
    }
}
