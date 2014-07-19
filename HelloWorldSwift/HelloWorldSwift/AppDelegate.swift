//
//  AppDelegate.swift
//  HelloWorldSwift
//
//  Created by Alvin A ONeal Jr on 7/3/14.
//  Copyright (c) 2014 AJ ONeal Tech LLC. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?

    // https://gist.github.com/sawapi/a7cee65e4ad95578044d
    // iOS Simulator -> Reset Content and Settings

    func HTTPsendRequest(request: NSMutableURLRequest, callback: (String, String?) -> Void) {
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                (data, response, error) -> Void in
                    if error {
                        callback("", error.localizedDescription)
                    } else {
                        callback(NSString(data: data,
                            encoding: NSUTF8StringEncoding), nil)
                    }
            }
            
        task.resume()
    }
    
    func JSONStringify(jsonObj: AnyObject) -> String {
        var e: NSError?
        let jsonData = NSJSONSerialization.dataWithJSONObject(
              jsonObj
            , options: NSJSONWritingOptions(0)
            , error: &e
            )
        
        if e {
            return ""
        } else {
            return NSString(data: jsonData, encoding: NSUTF8StringEncoding)
        }
    }
    
    func HTTPPostJSON(url: String, jsonObj: AnyObject, callback: (String, String?) -> Void) {
        var request = NSMutableURLRequest(URL: NSURL(string: url))
            
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
        let jsonString = JSONStringify(jsonObj)
        let data: NSData = jsonString.dataUsingEncoding(NSUTF8StringEncoding)
            
        request.HTTPBody = data
            
        HTTPsendRequest(request, callback)
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: NSDictionary?) -> Bool {
        println(application.isRegisteredForRemoteNotifications().description)
        
        var types: UIUserNotificationType = UIUserNotificationType.Badge |
            UIUserNotificationType.Alert |
            UIUserNotificationType.Sound
        
        var settings: UIUserNotificationSettings = UIUserNotificationSettings(
            forTypes: types, categories: nil
        )
        
        application.registerUserNotificationSettings( settings )
        application.registerForRemoteNotifications()
        
        return true
    }
    
    func application(application: UIApplication!
        , didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData!
        ) {
        
        var characterSet: NSCharacterSet = NSCharacterSet( charactersInString: "<>" )
        
        var deviceTokenString: String = ( deviceToken.description as NSString )
            .stringByTrimmingCharactersInSet( characterSet )
            .stringByReplacingOccurrencesOfString( " ", withString: "" ) as String
        
        println(deviceTokenString)
            
        let jsonObject: AnyObject = [ "deviceTokenString": deviceTokenString.utf8 ]
            
        HTTPPostJSON(
              "http://development.coolaj86.com:3030/api/push-demo"
            , jsonObj: jsonObject
            , callback: { (data, error) -> Void in
                if (error) {
                    NSNotificationCenter
                        .defaultCenter()
                        .postNotificationName("deviceRegistrationFailed", object: nil)
                } else {
                    NSNotificationCenter
                        .defaultCenter()
                        .postNotificationName("deviceRegistrationSucceeded", object: nil)
                }
            }
        )
    }
    
    func application( application: UIApplication!, didFailToRegisterForRemoteNotificationsWithError error: NSError! ) {
        println(error.localizedDescription)
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        println("I'm getting sleepy... very sleepy")
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        println("I'm sleeping...")
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        println("I'm waking...")
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        println("I became active!")
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        println("I'm melting! What a world! What a world!")
    }


}

