//
//  FirstScene.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

class NavigationController<NVDestination>: ObservableObject {
    @Published var viewState: [NVDestination] = []

    /// 루트뷰를 제외한 모든 뷰를 pop하고 해당 뷰를 삽입
    func presentScreen(destination: NVDestination) {
        viewState = [destination]
    }
    
    /// 해당뷰를 Stack에 추가
    func addToStack(destination: NVDestination) {
        viewState.append(destination)
    }
    
    /// 최상단 뷰를 제거
    func popTopView() {
        let _ = viewState.popLast()
    }
    
    func clearStack() {
        viewState = []
    }
}

enum FirstScreenDestination {
    case selectSport, tabView, loginScreen
}

class FirstScreennController: NavigationController<FirstScreenDestination> {
    func checkAccessTokenIsAvailable() -> Bool {
        let token = FileController.shared.getData(.accessToken, type: String.self)
        
        return token != nil
    }
}

struct OnBoardingScreen: View {
    @EnvironmentObject var controller: FirstScreennController
    
    var body: some View {
        ZStack {
            Color.mainBlue
            
            GeometryReader { geo in
                Image("onBoardingText")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 162, height: 70)
                    .position(x: geo.size.width/2, y: geo.size.height/2 - 10)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { _ in
                if !controller.checkAccessTokenIsAvailable() {
                    controller.addToStack(destination: .loginScreen)
                } else {
                    controller.addToStack(destination: .tabView)
                }
            }
            
            FileController.shared.deleteData(.accessToken)
        }
    }
}


struct FirstScene: View {
    @StateObject private var controller = FirstScreennController()
    
    var body: some View {
        NavigationStack(path: $controller.viewState) {
            OnBoardingScreen()
                .navigationDestination(for: FirstScreenDestination.self) { state in
                    switch state {
                    case.selectSport:
                        SelectSportScreen()
                            .navigationBarBackButtonHidden()
                    case .loginScreen:
                        LoginScreen()
                            .navigationBarBackButtonHidden()
                    case .tabView:
                        MainScene()
                            .navigationBarBackButtonHidden()
                    }
                }
        }
        .environmentObject(controller)
        
    }
}

struct FirstScene_Previews: PreviewProvider {
    static var previews: some View {
        FirstScene()
    }
}
