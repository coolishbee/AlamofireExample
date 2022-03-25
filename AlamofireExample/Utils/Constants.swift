//
//  Constants.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/02.
//

import Foundation

struct Constants {
    struct DevServer {
        static let baseURL = "https://apidev.igame.co.kr"
    }
    struct LiveServer {
        static let baseURL = ""
    }
    
    struct APIParameterKey {
        static let password = ""
        static let email = ""
    }
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
    case json = "application/json"
}
