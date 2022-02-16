//
//  AuthViewModel.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/05.
//

import Foundation

class AuthViewModel {
    
    static let shared = AuthViewModel()
    
    let verificationID = Observable("")
    let phoneNumber = Observable("")
    let token = Observable("")
    let nickname = Observable("")
    let birth = Observable("")
    let email = Observable("")
    let fcmToken = Observable("")
    let gender = Observable(-1)
    
    var signUp: SignUp?
    
    
    // 회원가입
    // 구조적 고민 이 함수를 ViewController에 만들어서 바로 사용해도 되는데
    // MVVM 구조에 맞게 사용하려면 @escaping 부분 수정이 필요함
    // 남은 UI완료 후 수정 예정 결과값은 제대로 찍힘
    // 400번대 분기된 애들의 String 
    func postSignUp(completion: @escaping (NetworkResult<Any>) -> Void) {
        AuthAPI.shared.signUp(phoneNumber: phoneNumber.value, FCMtoken: fcmToken.value, nick: nickname.value, birth: birth.value, email: email.value, gender: gender.value) { response in
            switch response {
            case .success(let data):
                if let signUp = data as? SignUp {
                    print("success")
                }
            case .alreadyUser(_):
                print("alreadyUser")
            case .unableNickname(_):
                print("unableNickname")
            case .firebaseTokenErr(_):
                print("firebaseTokenErr")
            case .serverErr:
                print("serverErr")
            case .clientErr:
                print("clientErr")
            case .pathErr:
                print("pathErr")
            }
        }
    }
}
