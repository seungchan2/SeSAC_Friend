//
//  BirthViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/24.
//

import UIKit

final class BirthViewController: BaseViewController {
    
    let birthView = BirthView()
    
    override func loadView() {
        view = birthView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDatePickerView()
    }
    
    override func style() {
        super.style()
        view.backgroundColor = Color.sesacWhite
    }
    
    private func setDatePickerView() {
        birthView.datePicker.datePickerMode = .date
        birthView.datePicker.locale = Locale(identifier: "ko_KO")
        birthView.datePicker.preferredDatePickerStyle = .wheels
    }
}
