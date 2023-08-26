//
//  NotiBellView.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

struct NotiBellView: View {
    @Binding var isNotify: Bool
    
    var body: some View {
        Image("noti_\(!isNotify ? "default" : "clicked")")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .onTapGesture {
                isNotify.toggle()
            }
    }
}

struct NotiBellView_Previews: PreviewProvider {
    static var previews: some View {
        NotiBellView(isNotify: .constant(false))
    }
}
