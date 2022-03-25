//
//  DBTime.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/02.
//

import Foundation

struct DBTime: Codable {
    let now: String
    let unix: UInt
    let ServerAppID: String
    let ServerAppName: String
    let MachineName: String
}
