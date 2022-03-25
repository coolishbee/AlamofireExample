//
//  APIClient.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/03/02.
//

import Foundation
import Alamofire

class APIClient {
    @discardableResult
    private static func performRequest<T:Decodable>(route:APIRouter,
                                                    decoder: JSONDecoder = JSONDecoder(),
                                                    completion:@escaping (Result<T, AFError>)->Void) -> DataRequest {
        return AF.request(route).responseDecodable(decoder: decoder) {
            (response: DataResponse<T, AFError>) in completion(response.result)
        }
    }
    
    static func dbTime(completion:@escaping (Result<DBTime, AFError>)->Void) {
        performRequest(route: APIRouter.dbTime, completion: completion)
    }
    
}
