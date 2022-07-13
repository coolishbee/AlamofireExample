//
//  APIClient.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/02.
//

import Foundation
import Alamofire

class APIClient {
    static let session: Session = {
        let configuration = URLSessionConfiguration.af.default
        let apiLogger = APIEventLogger()
        return Session(configuration: configuration, eventMonitors: [apiLogger])
    }()
    
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter,
                                                    decoder: JSONDecoder = JSONDecoder(),
                                                    completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return session.request(route).responseDecodable(decoder: decoder) {
            (response: DataResponse<T, AFError>) in completion(response.result)
        }
//        return AF.request(route).responseDecodable(decoder: decoder) {
//            (response: DataResponse<T, AFError>) in completion(response.result)
//        }
    }
        
    static func login(_ reqLogin: ReqLogin,
                      completion:@escaping (Result<RespLogin, AFError>)->Void) {
        performRequest(route: APIRouter.login(reqLogin), completion: completion)
    }
    
    static func autoLogin(sessionKey: String,
                          completion:@escaping (Result<RespLogin, AFError>)->Void) {
        performRequest(route: APIRouter.autoLogin(sessionKey: sessionKey), completion: completion)
    }
    
}
