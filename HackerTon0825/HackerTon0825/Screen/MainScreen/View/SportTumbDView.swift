//
//  SportTumbDView.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI


struct SportTumbDView: View {
    
    @Binding var selectionList: [SportsType]
    
    var sportType: SportsType
    
    @State private var isClicked = false

    
    var body: some View {
        ZStack {
            Image(sportType.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 220, height: 280)
            
            VStack {
                Spacer()
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text(sportType.korName)
                            .font(.pretendard(19, weight: .bold))
                        HStack(spacing: 5) {
                            Image("calendar")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10)
                            Text("다음경기 4일 후")
                                .font(.pretendard(14, weight: .medium))
                                .foregroundColor(.grey01)
                            Spacer()
                        }
                        
                        HStack(spacing: 5) {
                            Image("notification")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 10)
                            Text("78개 | 대기알림")
                                .font(.pretendard(14, weight: .medium))
                                .foregroundColor(.grey03)
                            Spacer()
                        }
                    }
                    Spacer()
                }
                .padding(15)
                .background(
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .foregroundColor(.white)
                    }
                )
                .padding(.horizontal, 12)
                .padding(.bottom, 30)
            }
            
            if isClicked {
                RoundedRectangle(cornerRadius: 40)
                    .stroke(lineWidth: 10.0)
                    .foregroundColor(.blue.opacity(0.7))
            }
            
        }
        .frame(width: 220, height: 280)
        .clipShape(
            RoundedRectangle(cornerRadius: 40)
        )
        .contentShape(RoundedRectangle(cornerRadius: 40))
        .onTapGesture {
            isClicked.toggle()
            
            if isClicked {
                selectionList.append(sportType)
            } else {
                if let index = selectionList.firstIndex(of: sportType) {
                    selectionList.remove(at: index)
                }
            }
        }
    }
}


