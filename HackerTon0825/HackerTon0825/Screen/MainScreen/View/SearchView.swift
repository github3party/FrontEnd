//
//  SearchView.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

struct SearchView: View {
    
    @State private var inputStr = ""
    
    var body: some View {
        HStack {
            TextField("승마'를 검색해보세요.", text: $inputStr)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .font(Font.system(size: 20))
                .frame(height: 20)
            Spacer()
            Button {
                
            } label: {
                Image("search-normal")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36)
                    
            }
        }
        .frame(height: 50)
        .padding(.leading, 25)
        .padding(.trailing, 20)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .foregroundColor(.white)
        )
        
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue
            SearchView()
                .padding(.horizontal, 25)
        }
    }
}
