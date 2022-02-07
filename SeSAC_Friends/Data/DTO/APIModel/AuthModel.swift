//
//  AuthModel.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/06.
//

import Foundation

// MARK: SignUp
struct SignUp: Codable {
    var phoneNumber, fcMtoken, nick: String
    var birth: String
    var email: String
    var gender: Int

    enum CodingKeys: String, CodingKey {
        case phoneNumber
        case fcMtoken = "FCMtoken"
        case nick, birth, email, gender
    }
}
