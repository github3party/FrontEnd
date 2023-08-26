//
//  SportThumbBView.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

struct SportThumbBView: View {
    
    var sportType: SportsType
    
    var body: some View {
        HStack(spacing: 20) {
            Image(sportType.imageName)
                .resizable()
                .frame(width: 75, height: 75)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 0) {
                
                Text(sportType.korName + " " + sportType.description)
                    .font(.pretendard(14, weight: .bold))
                HStack(spacing: 5) {
                    Image("calendar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12)
                    Text("다음경기 4일 후")
                        .font(.pretendard(12, weight: .medium))
                        .foregroundColor(.grey01)
                    Spacer()
                }
                .padding(.top, 10)
                
                HStack(spacing: 5) {
                    Image("notification")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12)
                    Text("78개 | 대기알림")
                        .font(.pretendard(12, weight: .medium))
                        .foregroundColor(.grey01)
                    Spacer()
                    
                    HStack(spacing: 3) {
                        Image("dollar-circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 16)
                        Text("82명")
                            .font(.pretendard(16, weight: .semiBold))
                            .foregroundColor(.mainBlue)
                    }
                }
                .padding(.top, 2)
            }
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(radius: 1.0, x: 0, y: 0)
        )
    }
}

struct SportThumbBView_Previews: PreviewProvider {
    static var previews: some View {
        SportThumbBView(sportType: .basketBall)
            .padding(25)
    }
}
