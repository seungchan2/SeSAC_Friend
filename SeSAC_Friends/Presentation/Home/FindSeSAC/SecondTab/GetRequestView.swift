//
//  GetRequestView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/18.
//

import UIKit

import SnapKit
import Then

final class GetRequestView: UIView {
    
    let tableView = UITableView().then {
        $0.register(GetRequestTableViewCell.self)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setView() {
        addSubview(tableView)
    }
    
    private func setConstraints() {
        tableView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(safeAreaInsets)
        }
    }
}


