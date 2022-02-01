//
//  MyPageTableViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/01.
//

import UIKit

import SnapKit
import Then

final class MyPageTableViewCell: UITableViewCell {

    let profileImage = UIImageView()
    let infoLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [profileImage, infoLabel].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraints() {
        profileImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(15)
            $0.height.width.equalTo(20)
        }
        
        infoLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(profileImage.snp.trailing).offset(13)
        }
    }
    
}
