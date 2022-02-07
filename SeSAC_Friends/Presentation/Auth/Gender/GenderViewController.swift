//
//  GenderViewController.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/24.
//

import UIKit

enum GenderType: Int, CaseIterable {
    case man = 0
    case woman
}

final class GenderViewController: BaseViewController {
    
    @IBOutlet var genderButton: [UIButton]!
    @IBOutlet var confirmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func style() {
        super.style()
        setButtonUI()
    }
    
    private func setButtonUI() {
        confirmButton.makeRounded(radius: 8)
        genderButton.forEach {
            $0.makeRoundedWithBorder(radius: 12, color: Color.sesacGray3.cgColor, borderWith: 1)
        }
    }
    
    private func setSelectedGenderButton(gender: Int) {
        genderButton[gender].layer.borderColor = UIColor.white.cgColor
        genderButton[gender].backgroundColor = Color.sesacWhiteGreen
    }
    
    private func setUnselectedGenderButton(gender: Int) {
        genderButton[gender].isSelected = false
        genderButton[gender].layer.borderColor = Color.sesacGray3.cgColor
        genderButton[gender].backgroundColor = UIColor.white
    }
    
    @IBAction func genderButtonClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        switch sender.tag {
        case GenderType.man.rawValue:
            if sender.isSelected {
                setUnselectedGenderButton(gender: 1)
                setSelectedGenderButton(gender: 0)
            } else {
                setUnselectedGenderButton(gender: 0)
            }
        case GenderType.woman.rawValue:
            if sender.isSelected {
                setUnselectedGenderButton(gender: 0)
                setSelectedGenderButton(gender: 1)
            } else {
                setUnselectedGenderButton(gender: 1)
            }
        default:
            break
        }
    }
    
    @IBAction func touchConfirmButton(_ sender: UIButton) {
        AuthViewModel.shared.postSignUp { response in
            switch response {
            case .success(_):
                print("success")
            case .alreadyUser(_):
                print("")
            case .unableNickname(_):
                print("1")
            case .firebaseTokenErr(_):
                print("1")
            case .serverErr:
                print("1")
            case .clientErr:
                print("1")
            case .pathErr:
                print("path")
            }
        }
    }
}
