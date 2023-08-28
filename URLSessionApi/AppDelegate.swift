//
//  AppDelegate.swift
//  URLSessionApi
//
//  Created by User on 30.07.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let viewController = ViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        
        return true
    }
}
