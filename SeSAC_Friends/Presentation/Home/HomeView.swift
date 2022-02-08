//
//  HomeView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/08.
//

import UIKit

import SnapKit
import Then
import MapKit

final class HomeView: UIView {
    
    let mapView = MKMapView()
    let genderStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.alignment = .center
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacWhite.cgColor)
        // 그림자
        $0.dropShadow()
    }
    let allButton = GenderButtonStyle.init(frame: CGRect(), mode: .inactive, text: "전체").then {
        // StackView 상단 Round
        $0.makeRoundedSpecificCorner(firstCorner: .layerMinXMinYCorner, secondCorner: .layerMaxXMinYCorner)
    }
    let maleButton = GenderButtonStyle.init(frame: CGRect(), mode: .inactive, text: "남자")
    let femaleButton = GenderButtonStyle.init(frame: CGRect(), mode: .inactive, text: "여자").then {
        // StackView 하단 Round
        $0.makeRoundedSpecificCorner(firstCorner: .layerMinXMaxYCorner, secondCorner: .layerMaxXMaxYCorner)
    }
    let gpsButton = UIButton().then {
        $0.setImage(Image.sesacGPS, for: .normal)
        $0.backgroundColor = Color.sesacWhite
        $0.makeRounded(radius: 8)
        $0.dropShadow()
    }
    let statusButton = StatusButtonStyle(frame: CGRect(), mode: .search).then {
        $0.dropShadow()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUI() {
        [mapView, genderStackView, allButton, maleButton, femaleButton, gpsButton, statusButton].forEach {
            addSubview($0)
        }
        genderStackView.addArrangedSubviews(allButton, maleButton, femaleButton)
    }
    
    func setConstraints() {
        mapView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
        
        genderStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(52)
            $0.leading.equalToSuperview().inset(16)
            $0.height.equalTo(144)
        }
        
        allButton.snp.makeConstraints {
            $0.width.equalTo(48)
        }
        
        maleButton.snp.makeConstraints {
            $0.width.equalTo(48)
        }
        
        femaleButton.snp.makeConstraints {
            $0.width.equalTo(48)
        }
        
        gpsButton.snp.makeConstraints {
            $0.top.equalTo(genderStackView.snp.bottom).inset(-16)
            $0.leading.equalTo(genderStackView.snp.leading)
            $0.height.width.equalTo(48)
        }
        
        statusButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(64)
            $0.bottom.equalToSuperview().inset(106)
        }
    }
}
