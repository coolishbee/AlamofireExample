//
//  Constants.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/02.
//

import Foundation

struct Constants {
    struct DevServer {        
        static let baseURL = "http://192.168.12.59:8000"
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
    case contentType = "Content-Type"
    case acceptType = "Accept"
}

enum ContentType: String {
    case json = "application/json"
}
