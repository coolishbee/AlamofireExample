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
    let data: RespLoginInfo?
    
    struct RespLoginInfo: Codable {
        let sessionKey: String
        let team: [PlayerInfo]?
    }
    
    struct PlayerInfo: Codable {
        let playerID: UInt
        let playerName: String
        let squadNumber: String
        let teamNumber: String
        let teamID: UInt
        let nation: String
        let height: UInt
        let weight: UInt
        let age: UInt
        let foot: String
        let position: String
        let ballControl: UInt
        let dribbling: UInt
        let lowPass: UInt
        let loftedPass: UInt
        let speed: UInt
        let jump: UInt
        
        enum CodingKeys: String, CodingKey {
            case playerID = "id"
            case playerName = "player_name"
            case squadNumber = "squad_number"
            case teamNumber = "team_number"
            case teamID = "team_id"
            case nation
            case height
            case weight
            case age
            case foot
            case position
            case ballControl = "ball_control"
            case dribbling
            case lowPass = "low_pass"
            case loftedPass = "lofted_pass"
            case speed
            case jump
        }
    }
}
