//
//  SportTumbCView.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI


struct SportTumbCView: View {
    
    var sportType: SportsType
    
    @State private var isNotify = false
    
    var body: some View {
        ZStack {
            Image(sportType.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 155, height: 138)
            GeometryReader { geo in
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                    
                    VStack(spacing: 3) {
                        HStack {
                            Text(sportType.korName)
                                .font(.pretendard(14, weight: .bold))
                            
                            Spacer()
                            
                            NotiBellView(isNotify: $isNotify)
                                .frame(width: 20, height: 20)
                        }
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

                        HStack {
                            Image("notification")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10)
                            Text("78개 | 대기알림")
                                .font(.pretendard(10, weight: .medium))
                                .foregroundColor(.grey01)
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .padding(10)
                }
                .frame(width: geo.size.width, height: geo.size.height/2)
                .position(x: geo.size.width/2, y: geo.size.height*3/4)
            }
            
        }
        .frame(width: 155, height: 138)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 1.0, x: 0, y: 0)
    }
}

struct SportTumbCView_Previews: PreviewProvider {
    static var previews: some View {
        SportTumbCView(sportType: .cabadi)
    }
}
