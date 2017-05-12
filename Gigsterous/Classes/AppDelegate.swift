//
//  AppDelegate.swift
//  Gigsterous
//
//  Created by Svacha, Michal on 29/06/16.
//  Copyright © 2016 Svacha, Michal. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import OHHTTPStubs

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func applicationDidFinishLaunching(_ application: UIApplication) {
        // Initialize Fabric
        Fabric.with([Crashlytics.self])
        
        _ = stub(condition: isScheme("https") && isHost("api.gigsterous.com") && isPath("/events")) { request in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile(
                    "events.json",
                    type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type":"application/json"])
        }
        
        _ = stub(condition: isScheme("https") && isHost("api.gigsterous.com") && isPath("/people")) { request in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile(
                    "people.json",
                    type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type":"application/json"])
        }
        
        _ = stub(condition: isScheme("https") && isHost("api.gigsterous.com") && isPath("/ensembles")) { request in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile(
                    "ensembles.json",
                    type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type" : "application/json"])
        }
        
        _ = stub(condition: isScheme("https") && isHost("api.gigsterous.com") && isPath("/venues")) { request in
            return OHHTTPStubsResponse(
                fileAtPath: OHPathForFile(
                    "venues.json",
                    type(of: self))!,
                statusCode: 200,
                headers: ["Content-Type" : "application/json"])
        }
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
