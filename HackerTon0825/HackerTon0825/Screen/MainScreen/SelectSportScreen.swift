//
//  SelectSportScreen.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/25.
//

import SwiftUI

struct SelectSportScreen: View {
    
    var items: [SportsType] {
        SportsType.allCases.filter { element in
            if selectionState == .all || selectionState == .none {
                return true
            }
            
            return element.type == selectionState
        }
    }
    
    @State private var favoriteList: [SportsType] = []
    
    @State private var selectionState: SelectItem = .none
    
    @EnvironmentObject var controller: FirstScreennController
    
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    Button {
                        controller.popTopView()
                    } label: {
                        Image("Vector1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 8)
                    }
                    
                    Spacer()
                }
                .padding(.top, 25)
                Spacer()
            }
            .padding(.horizontal, 25)
            
            
            VStack {
                //-------텍스트 상자-----------
                HStack {
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("관심있는 종목을 골라주세요.")
                            .font(Font.pretendard(25, weight: .semiBold))
                            .frame(height: 35)
                        
                        Text("관심있는 종목의 경기 스케줄과 현황을 알려드립니다.")
                            .font(Font.pretendard(14, weight: .regular))
                            .foregroundColor(.grey01)
                            .frame(height: 20)
                            .padding(.top, 14)
                    }
                    Spacer()
                }
                //--------------------------
                
                
                //---------종목리스트----------
                
                HStack {
                    SelectionItemsView(selectionState: $selectionState)
                    Spacer()
                }
                .padding(.top, 35)
                
                
                //--------------------------
                
                ScrollView(.horizontal) {
                    
                    HStack {
                        ForEach(items, id: \.self) { item in
                            SportTumbDView(selectionList: $favoriteList, sportType: item)
                        }
                    }
                }
                .padding(.top, 20)
                
                Button {
                    let data = UserCategoryRequestModel(category: favoriteList.map { $0.description })
                    
                    Task {
                        await HTTPRequest.shared.requestWithAccessToken(url: .category, method: .post, reponseType: NoReponseBody.self, sendData: data) { result in
                            switch result {
                            case .success(let success):
                                print("category success")
                            case .failure(let failure):
                                print("category failure")
                            }
                        }
                        
                        self.controller.presentScreen(destination: .tabView)
                    }
                    
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .frame(height: 54)
                            .foregroundColor(.darkBlue)
                        Text("완료")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }
                .padding(.top, 30)
                
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 100)
        }
    }
}

struct SelectSportScreen_Previews: PreviewProvider {
    static var previews: some View {
        SelectSportScreen()
            .environmentObject(FirstScreennController())
    }
}
