//
//  AuthAPI.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/02/06.
//

import Foundation
import Moya

public class AuthAPI {
    
    static let shared = AuthAPI()
    var authProvider = MoyaProvider<AuthService>()
    
    private init() {}
    
    func signUp(phoneNumber: String, FCMtoken: String, nick: String, birth: String, email: String, gender: Int, completion: @escaping (NetworkResult<Any>) -> Void) {
        authProvider.request(.signUp(phoneNumber: phoneNumber, FCMtoken: FCMtoken, nick: nick, birth: birth, email: email, gender: gender)) { (result) in
            switch result {
            case .success(let response):
                let statusCode = response.statusCode
                let data = response.data
                let networkResult = self.judgeStatus(by: statusCode, data, SignUp.self)
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
     
    private func judgeStatus<T: Codable>(by statusCode: Int, _ data: Data, _ object: T.Type) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<T>.self, from: data)
        else {
            return .pathErr
        }
        switch statusCode {
        case 200:
            return .success(decodedData.data as Any)
        case 201:
            return .alreadyUser(decodedData.message as Any)
        case 202:
            return .unableNickname(decodedData.message as Any)
        case 401:
            return .firebaseTokenErr(decodedData.message as Any)
        case 500:
            return .serverErr
        case 501:
            return .clientErr
        default:
            return .pathErr
        }
    }
}
