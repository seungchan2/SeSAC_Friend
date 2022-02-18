//
//  ManagementView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

import SnapKit
import Then

final class ManagementView: UIView {
    
    let backButton = UIButton().then {
        $0.setImage(Image.sesacBack, for: .normal)
    }
    
    let titleLabel = UILabel().then {
        $0.text = "정보 관리"
    }
    
    let saveButton = UIButton().then {
        $0.setTitle("저장", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
    }
    
    let bottomView = UIView().then {
        $0.backgroundColor = Color.sesacGray2
    }
    
    let tableView = UITableView().then {
        $0.register(ProfileImageTableViewCell.self)
        $0.register(UserTableViewCell.self)
        $0.register(UserInfoTableViewCell.self)
        $0.register(WithdrawalTableViewCell.self)
        $0.estimatedRowHeight = UIScreen.main.bounds.height * 1.3
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
        [backButton, titleLabel, saveButton, bottomView, tableView].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(54)
            $0.leading.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(backButton)
        }
        
        saveButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalTo(backButton)
        }
        
        bottomView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).inset(-11)
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(bottomView.snp.bottom).inset(-16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(safeAreaInsets)
        }
    }
}
