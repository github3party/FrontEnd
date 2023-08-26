//
//  KakaoLoginService.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/25.
//

import Foundation
import KakaoSDKUser

struct NoReponseBody: Decodable { }

struct KakaoService {
    static let nativeAppKey = "3786cca2b8d5b64fbecdbba99b743e22"
    
    
    //카카오톡 어플로 로그인
    static func loginWithKakaoTalkApp(completion: @escaping () -> ()) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    
                    guard let accessToken = oauthToken?.accessToken else { fatalError() }
                    
                    HTTPRequest.shared.firstRegister(accessToken) { result in
                        switch result {
                        case .success(let success):
                            let data = success as RegisterResponseModel
                            FileController.shared.saveData(.accessToken, data.data.accessToken)
                        case .failure(let failure):
                            print(failure.rawValue)
                        }
                    }
                }
            }
        } else {
            //어카운트로 로그인 연결
            Self.loginWithKakaoAccount(completion: completion)
        }
    }
    
    //카카오톡 어카운트로 로그인
    static func loginWithKakaoAccount(completion: @escaping () -> ()) {
        UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    
                    guard let accessToken = oauthToken?.accessToken else { fatalError() }
                    
                    completion()
                    
                    HTTPRequest.shared.firstRegister(accessToken) { result in
                        switch result {
                        case .success(let success):
                            let data = success as RegisterResponseModel
                            FileController.shared.saveData(.accessToken, data.data.accessToken)
                        case .failure(let failure):
                            print(failure.rawValue)
                        }
                    }
                    
                    
                }
            }
    }
}
