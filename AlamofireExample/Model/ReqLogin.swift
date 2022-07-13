//
//  ReqLogin.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/04/07.
//

import Foundation

public struct ReqLogin: Codable {
    let deviceID: String
    let loginToken: String
    let loginType: String
    
    enum CodingKeys: String, CodingKey {
        case deviceID = "device_id"
        case loginToken = "login_token"
        case loginType = "login_type"
    }
}
