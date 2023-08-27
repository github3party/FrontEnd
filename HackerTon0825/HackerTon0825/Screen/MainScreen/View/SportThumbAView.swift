//
//  SportThumbAView.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

struct SportThumbAView: View {
    
    var sportType: SportsType
    
    //Noti State
    @State private var isNotify = false
    
    var body: some View {
        ZStack {
            Image(sportType.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 200)
            
            
            VStack {
                HStack {
                    Spacer()
                    NotiBellView(isNotify: $isNotify)
                        .frame(width: 20, height: 20)
                }
                Spacer()
            }
            .padding(12)
            
            
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text(sportType.korName)
                            .font(.pretendard(12, weight: .bold))
                        HStack(spacing: 5) {
                            Image("calendar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10)
                            Text("다음경기 4일 후")
                                .font(.pretendard(10, weight: .medium))
                                .foregroundColor(.grey01)
                            Spacer()
                        }
                        
                        HStack(spacing: 5) {
                            Image("notification")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10)
                            Text("78개 | 대기알림")
                                .font(.pretendard(10, weight: .medium))
                                .foregroundColor(.grey03)
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .padding(12)
                .background(
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundColor(.white)
                )
                .padding(.horizontal, 12)
                .padding(.bottom, 15)
            }
        }
        .frame(width: 160, height: 200)
        .clipShape(
            RoundedRectangle(cornerRadius: 30)
        )
    }
}

struct SportThumbAView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            SportThumbAView(sportType: .basketBall)
        }
    }
}
