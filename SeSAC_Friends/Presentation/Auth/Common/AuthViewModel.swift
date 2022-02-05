//
//  AuthViewModel.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/05.
//

import Foundation

class AuthViewModel {
    
    static let shared = Auth()
    
    let verificationID = Observable("")
    let phoneNumber = Observable("")
    let token = Observable("")
    let nickname = Observable("")
    let birth = Observable("")
    let email = Observable("")
    let gender = Observable(-1)

}
