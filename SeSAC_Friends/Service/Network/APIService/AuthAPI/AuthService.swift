//
//  AuthService.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/06.
//

import Foundation
import Moya

enum AuthService {
    case signUp(phoneNumber: String, FCMtoken: String, nick: String, birth: String, email: String, gender: Int)
}

extension AuthService: TargetType {
    var baseURL: URL {
        return URL(string: URLs.baseURL)!
    }
    
    var path: String {
        switch self {
        case .signUp:
            return URLs.signUpURL
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .signUp:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .signUp(let phoneNumber, let FCMtoken, let nick, let birth, let email, let gender):
            return .requestParameters(parameters: [
                "phoneNumber": phoneNumber,
                "email": email,
                "nick": nick,
                "birth": birth,
                "gender": gender,
                "FCMtoken": FCMtoken
            ], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json", "idtoken": "61d9b05be83f1515ee3ce64e"]
        }
}
