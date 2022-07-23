//
//  AppDelegate.swift
//  MacPawProject
//
//  Created by user on 17.07.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let LossesPersonnelVC = Builder.createLossesVC()
        
        window?.rootViewController = UINavigationController(rootViewController: LossesPersonnelVC!)
        window?.makeKeyAndVisible()
        
        return true
    }
}
