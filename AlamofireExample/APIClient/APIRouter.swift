//
//  APIRouter.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/02.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case dbTime
    
    private var method: HTTPMethod {
        switch self {
        case .dbTime:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .dbTime:
            return "/Db/Time/200301"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .dbTime:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.DevServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
}
