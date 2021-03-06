//
//  AppDelegate.swift
//  iOSAppTemplate
//
//  Created by king on 15/10/1.
//  Copyright © 2015年 king. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // 得到当前应用的版本号
        let infoDictionary = NSBundle.mainBundle().infoDictionary
        let currentAppVersion = infoDictionary!["CFBundleShortVersionString"] as! String
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        let appVersion = userDefaults.stringForKey("appVersion")
        
        
        // 如果appVersion为nil说明是第一次启动；如果appVersion不等于currentAppVersion说明是更新了
        if appVersion == nil || appVersion != currentAppVersion {
            
            userDefaults.setValue(currentAppVersion, forKey: "appVersion")
            let storyboard = UIStoryboard(name: "KSGuidanceViewController", bundle: nil)
            
            let guidanceViewController =  KSGuidanceViewController
            self.window!.rootViewController = guidanceViewController
        }else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            self.window!.rootViewController = storyboard.instantiateInitialViewController()
        }
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

