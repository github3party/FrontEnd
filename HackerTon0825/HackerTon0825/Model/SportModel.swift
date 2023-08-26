//
//  SportModel.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import Foundation

enum SportsType: CaseIterable, Identifiable {
    
    case basketBall, cabadi, esports, weight, chess, fire, climbing, soccer
    

    var id: UUID { UUID() }
    
    var type: SelectItem {
        
        switch self {
        case .basketBall:
            return .ball
        case .cabadi:
            return .run
        case .esports:
            return .etc
        case .weight:
            return .etc
        case .chess:
            return .etc
        case .fire:
            return .etc
        case .climbing:
            return .etc
        case .soccer:
            return .ball
        }
    }
    
    var description: String {
        switch self {
        case .basketBall:
            return "basketBall"
        case .cabadi:
            return "cabadi"
        case .esports:
            return "esports"
        case .weight:
            return "weight"
        case .chess:
            return "chess"
        case .fire:
            return "fire"
        case .climbing:
            return "climbing"
        case .soccer:
            return "soccer"
        }
    }
    
    var korName: String {
        switch self {
        case .basketBall:
            return "농구"
        case .cabadi:
            return "카바디"
        case .esports:
            return "e스포츠"
        case .weight:
            return "역도"
        case .chess:
            return "체스"
        case .fire:
            return "사격"
        case .climbing:
            return "클라이밍"
        case .soccer:
            return "축구"
        }
    }
    
    var imageName: String {
        "cup_\(self.description)"
    }
    
}
