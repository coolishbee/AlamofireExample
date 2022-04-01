//
//  APIRouter.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/02.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    
    case login(type:String, token:String)
    case dbTime
    
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .dbTime:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .login:
            return "/auth"
        case .dbTime:
            return "/Db/Time"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .login(let type, let token):
            return ["login_type":type, "login_token":token]
        case .dbTime:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let url = try Constants.DevServer.baseURL.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        //urlRequest.httpMethod = method.rawValue
        urlRequest.method = method

        //urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
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
