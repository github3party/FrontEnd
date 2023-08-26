//
//  CupScreen.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

struct CupScreen: View {
    
    @State private var selectionState: SelectItem = .none
    
    var items: [SportsType] {
        SportsType.allCases.filter { element in
            if selectionState == .all || selectionState == .none {
                return true
            }
            
            return element.type == selectionState
        }
    }
    
    var body: some View {
        VStack {
            Text("스포츠")
                .font(.pretendard(20, weight: .semiBold))
                .padding(.top, 20)
            
            HStack(spacing: 0) {
                
                SelectionItemsView(selectionState: $selectionState)
                
                Spacer()
            }
            .padding(.top, 15)
            
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(0..<items.count / 2, id: \.self) { rowIndex in
                        HStack(spacing: 16) {
                            ForEach(0..<2) { columnIndex in
                                let index = rowIndex * 2 + columnIndex
                                if index < items.count {
                                    SportTumbCView(sportType: items[index])
                                }
                            }
                        }
                    }
                }
                .padding()
            }
            
            
            Spacer()
        }
        .padding(.horizontal, 25)
        .padding(.top, 15)
    }
    
}

struct CupScreen_Previews: PreviewProvider {
    static var previews: some View {
        CupScreen()
    }
}
