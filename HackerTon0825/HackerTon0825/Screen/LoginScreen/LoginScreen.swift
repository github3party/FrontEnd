//
//  LoginScreen.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/25.
//

import SwiftUI

struct LoginScreen: View {
    @EnvironmentObject var controller: FirstScreennController
    
    var body: some View {
        
        GeometryReader { geo in
            VStack(spacing: 30) {
                Image("onBoardingText2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 162, height: 70)
                Button {
                    KakaoService.loginWithKakaoTalkApp {
                        print("!!!")
                        self.controller.addToStack(destination: .selectSport)
                    }
                } label: {
                    Image("kakaoLoginIcon1")
                }
            }
            .position(x: geo.size.width/2, y: geo.size.height/2 - 30)
        }
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen()
            .environmentObject(FirstScreennController())
    }
}
