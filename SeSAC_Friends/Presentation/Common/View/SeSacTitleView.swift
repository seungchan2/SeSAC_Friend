//
//  UserDetailView.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/02.
//

import UIKit

import SnapKit
import Then

final class SeSacTitleView: UIView {
    
    let sesacTitleLabel = UILabel().then {
        $0.text = "새싹 타이틀"
        $0.font = UIFont.systemFont(ofSize: 12)
    }
    
    let mannerButton = UIButton().then {
        $0.setTitle("좋은 매너", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    let promiseButton = UIButton().then {
        $0.setTitle("정확한 시간약속", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    let answerButton = UIButton().then {
        $0.setTitle("빠른 응답", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    let personalityButton = UIButton().then {
        $0.setTitle("친절한 성격", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    let hobbyButton = UIButton().then {
        $0.setTitle("능숙한 취미 실력", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    let timeButton = UIButton().then {
        $0.setTitle("유익한 시간", for: .normal)
        $0.setTitleColor(Color.sesacBlack, for: .normal)
        $0.makeRoundedWithBorder(radius: 8, color: Color.sesacGray2.cgColor)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    
    let lineOneStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 11
        $0.alignment = .center
    }
    
    let lineTwoStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 11
        $0.alignment = .center
    }
    
    let lineThreeStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 11
        $0.alignment = .center
    }
    
    let allStackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 8
        $0.alignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUI() {
        [sesacTitleLabel, timeButton, hobbyButton, answerButton, mannerButton, promiseButton, personalityButton, lineOneStackView, lineTwoStackView, lineThreeStackView, allStackView].forEach {
            addSubview($0)
        }
        lineOneStackView.addArrangedSubviews(mannerButton, promiseButton)
        lineTwoStackView.addArrangedSubviews(answerButton, personalityButton)
        lineThreeStackView.addArrangedSubviews(hobbyButton, timeButton)
        allStackView.addArrangedSubviews(lineOneStackView, lineTwoStackView, lineThreeStackView)
    }
    
    private func setConstraints() {
        sesacTitleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        mannerButton.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(lineOneStackView)
            $0.height.equalTo(32)
        }
        
        promiseButton.snp.makeConstraints {
            $0.top.trailing.bottom.equalTo(lineOneStackView)
            $0.height.equalTo(32)
        }
        
        answerButton.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(lineTwoStackView)
            $0.height.equalTo(32)
        }
        
        personalityButton.snp.makeConstraints {
            $0.top.trailing.bottom.equalTo(lineTwoStackView)
            $0.height.equalTo(32)
        }
        
        hobbyButton.snp.makeConstraints {
            $0.top.leading.bottom.equalTo(lineThreeStackView)
            $0.height.equalTo(32)
        }
        
        timeButton.snp.makeConstraints {
            $0.top.trailing.bottom.equalTo(lineThreeStackView)
            $0.height.equalTo(32)
        }
        
        lineOneStackView.snp.makeConstraints {
            $0.top.equalTo(allStackView.snp.top)
            $0.leading.equalTo(allStackView.snp.leading)
        }
        
        lineTwoStackView.snp.makeConstraints {
            $0.top.equalTo(lineOneStackView.snp.bottom).inset(-8)
            $0.leading.equalTo(allStackView.snp.leading)
        }
        
        lineThreeStackView.snp.makeConstraints {
            $0.top.equalTo(lineTwoStackView.snp.bottom).inset(-8)
            $0.leading.equalTo(allStackView.snp.leading)
        }
        
        allStackView.snp.makeConstraints {
            $0.top.equalTo(sesacTitleLabel.snp.bottom).inset(-16)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(112)
        }
    }
}
