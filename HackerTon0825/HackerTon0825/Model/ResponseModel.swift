//
//  ResponseModel.swift
//  HackerTon0825
//
//  Created by 최준영 on 2023/08/26.
//

import Foundation


struct RegisterResponseModel: Codable {
    let code: String
    let timeStamp: String
    let message: String
    let data: DataInfo
}

struct DataInfo: Codable {
    let accessToken: String
    let refreshToken: String
    let grantType: String
    let expiresIn: Int
}
