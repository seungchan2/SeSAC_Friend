//
//  UserTableViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

import SnapKit

class UserTableViewCell: UITableViewCell {

    let userView = UserView()
    let sesacTitleView = SeSacTitleView()
    let sesacReviewView = SeSacReviewView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
        sesacTitleView.isHidden = true
        sesacReviewView.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [userView, sesacTitleView, sesacReviewView].forEach {
            addSubview($0)
        }
    }
    
    private func setConstraints() {
        userView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(58)
        }
        
        sesacTitleView.snp.makeConstraints {
            $0.top.equalTo(userView.snp.bottom).inset(-8)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        sesacReviewView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.bottom).inset(130)
        
        }
    }
}
