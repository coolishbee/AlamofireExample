//
//  APIRouter.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/02.
//

import Foundation
import Alamofire

enum APIRouter: URLRequestConvertible {
    case login(_ reqLogin: ReqLogin)    
    case autoLogin(sessionKey:String)
    
    private var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .autoLogin:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .login:
            return "/api/login"
        case .autoLogin(let sessionKey):
            return "/api/autologin?sessionkey=\(sessionKey)"
        }
    }
    
    private var parameters: Parameters? {
        switch self {
        case .login(let reqLogin):
            do{
                return try reqLogin.encode()
            }catch{
                return nil
            }
            //return ["login_type":type, "login_token":token]
        case .autoLogin:
            return nil
        }
    }
    
    // MARK: - URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        let strUrl = String(format: "%@%@", Constants.DevServer.baseURL, path)
        let url = try strUrl.asURL()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        urlRequest.setValue(ContentType.json.rawValue,
                            forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
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
