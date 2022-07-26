//
//  AppDelegate.swift
//  AlamofireExample
//
//  Created by coolishbee on 2022/02/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        self.window = UIWindow(frame: UIScreen.main.bounds)

        let listViewController = ListViewController()
        self.window!.rootViewController = UINavigationController(rootViewController: listViewController);
        //self.window!.backgroundColor = UIColor.white
        self.window!.makeKeyAndVisible()
        
        return true
    }

}

