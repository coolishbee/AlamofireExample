//
//  RespLogin.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/30.
//

import Foundation

struct RespLogin: Codable {
    let code: UInt
    let msg: String
    let data: RespLoginInfo
}

struct RespLoginInfo: Codable {
    let userID: String
    let username: String
//    enum CodingKeys: String, CodingKey {
//        case userID
//        case username
//    }
}

//extension RespLoginInfo {
//    enum CodingKeys: String, CodingKey {
//        case userID
//        case username
//    }
//}
