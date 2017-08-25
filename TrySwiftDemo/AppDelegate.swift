//
//  AppDelegate.swift
//  TrySwiftDemo
//
//  Created by Hongfei Zhang on 8/24/17.
//  Copyright © 2017 Deja View Concepts, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.rootViewController = UINavigationController(rootViewController: HandVC())
		window?.makeKeyAndVisible()
		
		return true
	}

}
