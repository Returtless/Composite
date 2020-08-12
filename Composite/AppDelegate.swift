//
//  AppDelegate.swift
//  Composite
//
//  Created by Владислав Лихачев on 10.08.2020.
//  Copyright © 2020 Vladislav Likhachev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let data1 = FilesData.data(from: "1")
        let data2 = FilesData.data(from: "2")
        let data3 = FilesData.data(from: "3")
        
        let firstJsonDecoderHandler = FirstJsonDecoderHandler()
        let secondJsonDecoderHandler = SecondJsonDecoderHandler()
        let thirdJsonDecoderHandler = ThirdJsonDecoderHandler()
        firstJsonDecoderHandler.next = secondJsonDecoderHandler
        secondJsonDecoderHandler.next = thirdJsonDecoderHandler
        thirdJsonDecoderHandler.next = nil

        print(firstJsonDecoderHandler.handleData(data1))
        print(firstJsonDecoderHandler.handleData(data2))
        print(firstJsonDecoderHandler.handleData(data3))
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

