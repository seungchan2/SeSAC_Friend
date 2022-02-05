//
//  AuthModel.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/04.
//

import Foundation

class Auth {
    static let shared = Auth()
    var email: String?
    var phoneNumber: String?
    var password: String?
    var nickname: String?
    var birth: String?
    var gender: Int?
}
