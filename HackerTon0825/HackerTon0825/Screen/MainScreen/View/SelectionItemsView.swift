//
//  SelectionItemsView.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import SwiftUI

enum SelectItem: String, CaseIterable, Identifiable {
    var id: UUID { UUID() }
    case all, ball = "구기", run = "육상", water = "수상", etc = "기타", none
}

struct SelectionItemsView: View {
    
    @Binding var selectionState: SelectItem
    
    var containAll: Bool = true
    
    let sportFilterList = ["구기", "육상", "수상", "기타"]
    
    let bgIdleColor: Color = .white
    let bgAccentColor: Color = .black
    let contentIdleColor: Color = .black
    let contentAccentColor: Color = .mainBlue

    var body: some View {
        HStack(spacing: 8) {
            if containAll {
                HStack(spacing: 0) {
                    Image("category-2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(selectionState == .all ? contentAccentColor : contentIdleColor)
                        .frame(width: 12)
                    Text("ALL")
                        .font(.caption2)
                        .foregroundColor(selectionState == .all ? contentAccentColor : contentIdleColor)
                        .padding(.leading, 3)
                }
                .frame(height: 28)
                .padding(.horizontal, 12)
                .background (
                    ZStack {
                        RoundedRectangle(cornerRadius: 14)
                            .foregroundColor(selectionState == .all ? bgAccentColor : bgIdleColor)
                        RoundedRectangle(cornerRadius: 14)
                            .stroke(lineWidth: 0.5)
                    }
                )
                .onTapGesture { selectionState = .all }
                
            }
            
            
            ForEach(SelectItem.allCases, id: \.self) { item in
                if item != .all && item != .none {
                    Text(item.rawValue)
                        .font(.caption2)
                        .foregroundColor(selectionState == item ? contentAccentColor : contentIdleColor)
                        .padding(.horizontal, 12)
                        .background(
                            ZStack {
                                RoundedRectangle(cornerRadius: 14)
                                    .foregroundColor(selectionState == item ? bgAccentColor : bgIdleColor)
                                RoundedRectangle(cornerRadius: 14)
                                    .stroke(lineWidth: 0.5)
                                    .frame(width: 45, height: 28)
                            }
                        )
                        .frame(height: 28)
                        .onTapGesture {
                            selectionState = item
                        }
                }
            }
        }
    }
}

struct SelectionItemsView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionItemsView(selectionState: .constant(.none))
    }
}
