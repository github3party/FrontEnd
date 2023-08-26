//
//  HackerTon0825App.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/25.
//

import SwiftUI
import KakaoSDKCommon
import KakaoSDKAuth


@main
struct HackerTon0825App: App {
    
    init() {
        // Kakao SDK 초기화
        KakaoSDK.initSDK(appKey: KakaoService.nativeAppKey)
    }

    
    var body: some Scene {
        WindowGroup {
            FirstScene()
                .onOpenURL { url in
                    if (AuthApi.isKakaoTalkLoginUrl(url)) {
                        AuthController.handleOpenUrl(url: url)
                    }
                    
                }
        }
    }
}
