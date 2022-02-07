//
//  BirthViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/24.
//

import UIKit

final class BirthViewController: BaseViewController {
    
    let birthView = BirthView()
    var auth = AuthViewModel.shared
    var userBirth = String()
    
    override func loadView() {
        self.view = birthView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePickerView()
        birthView.confirmButton.isEnabled = true
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
    
    private func setDatePickerView() {
        birthView.datePicker.datePickerMode = .date
        birthView.datePicker.locale = Locale(identifier: "ko_KO")
        birthView.datePicker.preferredDatePickerStyle = .wheels
        birthView.datePicker.addTarget(self, action: #selector(touchDatePickerView(_:)), for: .valueChanged)
    }
    
    private func setAddTarget() {
        birthView.backButton.addTarget(self, action: #selector(touchBackButton), for: .touchUpInside)
        birthView.confirmButton.addTarget(self, action: #selector(touchConfirmButton), for: .touchUpInside)
    }
    
    private func changeLabel(koDate: String) {
        // 년
        let indexStart = koDate.startIndex
        let indexEnd = koDate.endIndex
        let yearIndex = koDate.index(indexStart, offsetBy: 4)
        let yearText = koDate[indexStart ..< yearIndex]
        birthView.yearView.dayLabel.text = "\(yearText)"
        
        // 월
        let start = koDate.index(indexStart, offsetBy: 7)
        let end = koDate.index(indexEnd, offsetBy: -5)
        let range = end..<start
        let monthText = koDate.substring(with: range)
        birthView.monthView.dayLabel.text = "\(monthText)"
        
        // 월
        let dayIndex = koDate.index(indexStart, offsetBy: 8)
        let dayText = koDate.substring(from: dayIndex)
        birthView.dayView.dayLabel.text = "\(dayText)"
    }
    
    @objc func touchBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func touchConfirmButton() {
        auth.birth.value = userBirth
        navigationController?.pushViewController(EmailViewController.instanceFromNib(), animated: true)
    }
    
    @objc func touchDatePickerView(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko")
        formatter.dateFormat = "yyyy-MM-dd"
        let userDate = formatter.string(from: birthView.datePicker.date)
        changeLabel(koDate: userDate)
        // 서버 통신 형식에 맞게 저장
        userBirth = userDate
    }
    
}
