//
//  Helpers.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/07/13.
//

import Foundation
import KeychainAccess

class Helpers {
    private static func getDeviceUUID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    
    static func getDeviceName() -> String {
        return UIDevice.modelName
    }
    
    static func getBundleIdentifier() -> String {
        return Bundle.main.bundleIdentifier ?? "nil"
    }
    
    static func createDeiviceId() -> Bool {
        let keychain = Keychain(service: getBundleIdentifier())
        do {
            try keychain.accessibility(.whenUnlocked)
                .set(getDeviceUUID(), key: "UUIDString")
            return true
        } catch let error {
            print("error: \(error)")
            return false
        }
    }
    
    static func getKeyChainData() -> String? {
        let keychain = Keychain(service: getBundleIdentifier())
        let uuid = try? keychain.get("UUIDString")
        return uuid
    }
    
    static func getDeviceId() -> String {
        
        if let deviceId = getKeyChainData() {
            return deviceId
        } else {
            if createDeiviceId() {
                return getKeyChainData()!
            } else{
                return "nil"
            }
        }
    }
}
