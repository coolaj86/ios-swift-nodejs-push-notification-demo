//
//  ViewController.swift
//  HelloWorldSwift
//
//  Created by Alvin A ONeal Jr on 7/3/14.
//  Copyright (c) 2014 AJ ONeal Tech LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector:"showAnAlert:", name: "deviceRegistrationFailed", object: nil)
        NSNotificationCenter
            .defaultCenter()
            .addObserver(self, selector:"showAnAlert:", name: "deviceRegistrationSucceeded", object: nil)
    }
    
    func showAnAlert(notification:NSNotification){
        var message:UIAlertController
        
        if ("deviceRegistrationFailed" == notification.name) {
            message = UIAlertController(
                  title: "Registration Failure"
                , message: "Push Notifications NOT Enabled"
                , preferredStyle: UIAlertControllerStyle.Alert
            )
        } else {
            message = UIAlertController(
                  title: "Registration Success"
                , message: "Push Notifications Enabled"
                , preferredStyle: UIAlertControllerStyle.Alert
            )

        }
        
        message.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        self.presentViewController(message, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func helloWorldAction(nameTextField: UITextField) {
        nameLabel.text = "Hello, \(nameTextField.text)"
    }
}

