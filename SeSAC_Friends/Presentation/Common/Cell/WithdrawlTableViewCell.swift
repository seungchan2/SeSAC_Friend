//
//  WithdrawalTableViewCell.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

import SnapKit
import Then

class WithdrawalTableViewCell: UITableViewCell {

    let withdrawalLabel = UILabel().then {
        $0.text = "회원탈퇴"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
      addSubview(withdrawalLabel)
    }
    
    private func setConstraints() {
        withdrawalLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
    }
}
