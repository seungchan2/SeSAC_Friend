//
//  GetRequestTableViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/18.
//

import UIKit

import SnapKit

class GetRequestTableViewCell: UITableViewCell {

    let profileImage = ProfileImageView()
    let userView = UserView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [profileImage, userView].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraints() {
        profileImage.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(UIScreen.main.bounds.width - 32)
            $0.height.equalTo(150)
        }
        
        userView.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).inset(-20)
            $0.width.equalTo(profileImage.snp.width)
            $0.height.equalTo(58)
        }
    }
}
