//
//  HobbyView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/10.
//

import UIKit

import SnapKit
import Then

class HobbyView: UIView {
    
    let backButton = UIButton().then {
        $0.setImage(Image.sesacBack, for: .normal)
    }
    
    let searchBar = UISearchBar().then {
        $0.placeholder = "띄어쓰기로 복수입력이 가능해요"
        $0.searchBarStyle = .minimal
    }
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init()).then {
        let layout = LeftAlignedCollectionViewFlowLayout()
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 5, left: 2, bottom: 5, right: 2)
        
        $0.isScrollEnabled = false
        $0.collectionViewLayout = layout
        $0.register(NearHobbyCollectionViewCell.self)
        $0.register(MyHobbyCollectionViewCell.self)
        $0.register(HobbyHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HobbyHeaderView.self.reuseIdentifier)
    }
    
    let findButton = AuthButtonStyle.init(frame: CGRect(), mode: .active, text: "새싹 찾기")

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        [backButton, searchBar, collectionView, findButton].forEach {
            addSubview($0)
        }
    }
    
    func setConstraints() {
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(54)
            $0.leading.equalToSuperview().inset(16)
            $0.height.width.equalTo(24)
        }
        
        searchBar.snp.makeConstraints {
            $0.centerY.equalTo(backButton)
            $0.leading.equalTo(backButton.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).inset(-32)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalTo(findButton.snp.top).inset(32)
        }
        
        findButton.snp.makeConstraints {
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
    }
}
