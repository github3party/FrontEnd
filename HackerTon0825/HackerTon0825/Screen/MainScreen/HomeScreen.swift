//
//  HomeScreen.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

struct HomeScreen: View {
    
    
    var items: [SportsType] { SportsType.allCases }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("Lv. 21")
                            .font(.title2)
                            .foregroundColor(.mainBlue)
                            .frame(height: 25)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("이지훈 님,")
                                .font(.pretendard(25, weight: .semiBold))
                                .foregroundColor(.white)
                            Text("서포트 할 준비 되셨나요?")
                                .font(.pretendard(25, weight: .semiBold))
                                .foregroundColor(.white)
                        }
                        .frame(height: 70)
                        
                        SearchView()
                            .padding(.top, 25)
                            .padding(.bottom, 5)
                    }
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                .padding(.top, 85)
                .padding(.bottom, 25)
                .background(
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                        
                        VStack {
                            HStack {
                                Spacer()
                                Image("mainScreenPaper")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 146)
                            }
                            Spacer()
                        }
                        .ignoresSafeArea()
                        
                    }
                )
                //--------검정색 영역 종료--------
                
                HStack {
                    
                    Text("관심 종목의 경기일정을 확인해 보세요.")
                        .font(.pretendard(16, weight: .semiBold))
                    
                    Spacer()
                    
                    Button {
                        
                        ///더보기!!!!!
                        
                    } label: {
                        HStack {
                            Text("더보기")
                                .font(.pretendard(14, weight: .medium))
                            Image("Vector1-re")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 6)
                        }
                    }
                    .foregroundColor(.gray)
                    
                }
                .padding(25)
                
                //------------------------------
        
                
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(items, id: \.self) { SportThumbAView(sportType: $0) }
                    }
                }
                
                //------------------------------
                
                VStack(alignment: .leading, spacing: 3) {
                    Text("서포터즈가 추천하는")
                        .font(.pretendard(16, weight: .semiBold))
                    HStack {
                        Text("숨겨진 종목을 둘러보세요.")
                            .font(.pretendard(16, weight: .semiBold))
                        Spacer()
                        
                        Button {
                            
                            ///더보기!!!!!
                            
                        } label: {
                            HStack {
                                Text("더보기")
                                    .font(.pretendard(14, weight: .medium))
                                Image("Vector1-re")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 6)
                            }
                        }
                        .foregroundColor(.gray)
                        
                    }
                }
                .frame(height: 50)
                .padding(.horizontal, 25)
                .padding(.top, 25)
                
                VStack(spacing: 10) {
                    ForEach(items, id: \.self) { SportThumbBView(sportType: $0) }
                }
                .padding(.horizontal, 25)
                .padding(.top, 25)
                .padding(.bottom, 200)
                
                
                Spacer()
            }
            
            
            
        }
        .ignoresSafeArea()
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}

