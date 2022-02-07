//
//  NetworkService.swift
//  SeSAC_Friends
//
//  Created by 김승찬 on 2022/01/26.
//

import Foundation

enum NetworkResult<T> {
  case success(T)           // 서버 통신 성공했을 때,
  case alreadyUser(T)       // 이미 가입한 유저,
  case unableNickname(T)    // 사용할 수 없는 닉네임,
  case firebaseTokenErr(T)  // Firebase Token 에러,
  case serverErr            // 서버 에러,
  case clientErr            // 클라 에러,
  case pathErr              // 경로에 문제가 있을 때,
}
