//
//  BirthView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/04.
//

import UIKit

import SnapKit
import Then

class BirthView: UIView, Representable {
    
    let explainLabel = UILabel().then {
        $0.text = "생년월일을 알려주세요"
        $0.textColor = Color.sesacBlack
        $0.font = .systemFont(ofSize: 20)
    }
    
    let dateView = UIView()
    
    let backButton = UIButton().then {
        $0.setImage(Image.sesacBack, for: .normal)
    }
    
    let yearView = DayView().then {
        let today = Date()
        let year = Calendar.current.component(.year, from: today)
        $0.dateLabel.text = "년"
        $0.dayLabel.text = "\(year)"
    }
    
    let monthView = DayView().then {
        let today = Date()
        let month = Calendar.current.component(.month, from: today)
        $0.dateLabel.text = "월"
        $0.dayLabel.text = "\(month)"
    }
    
    let dayView = DayView().then {
        let today = Date()
        let day = Calendar.current.component(.day, from: today)
        $0.dateLabel.text = "일"
        $0.dayLabel.text = "\(day)"
    }
    
    let confirmButton = ButtonStyle(frame: CGRect(), mode: .inactive, text: "다음")
    
    let datePicker = UIDatePicker()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    internal func setUI() {
        [explainLabel, backButton, dateView, confirmButton, datePicker].forEach {
            self.addSubview($0)
        }
        [yearView, monthView, dayView].forEach {
            dateView.addSubview($0)
        }
    }
    
    internal func setupConstraints() {
        explainLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(169)
            $0.centerX.equalToSuperview()
        }
        
        backButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(57)
            $0.leading.equalToSuperview().inset(13)
            $0.width.height.equalTo(24)
        }
        
        dateView.snp.makeConstraints {
            $0.top.equalTo(explainLabel.snp.bottom).inset(-80)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        confirmButton.snp.makeConstraints {
            $0.top.equalTo(dateView.snp.bottom).inset(-72)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(48)
        }
        
        datePicker.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.33)
        }
        
        yearView.snp.makeConstraints {
            $0.top.leading.bottom.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        dayView.snp.makeConstraints {
            $0.top.bottom.trailing.equalToSuperview()
            $0.width.equalTo(100)
        }
        
        monthView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(yearView.snp.trailing).inset(-23)
            $0.trailing.equalTo(dayView.snp.leading).inset(-23)
        }
    }
}
