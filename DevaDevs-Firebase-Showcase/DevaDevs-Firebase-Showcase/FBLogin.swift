//
//  FBLogin.swift
//  DevaDevs-Firebase-Showcase
//
//  Created by Nas@Mac on 11/1/59.
//  Copyright © พ.ศ. 2559 Nas@Mac. All rights reserved.
//

import Foundation
import FBSDKCoreKit
import FBSDKLoginKit
import UIKit

// Thought, No need to use to hidden facebook's token
let facebookLogin = FBSDKLoginManager()

func facebookAuthorizedLogin(controller controller: UIViewController) {
  
    facebookLogin.logInWithReadPermissions(["email"], fromViewController: controller) { (facebookResult: FBSDKLoginManagerLoginResult!, facebookError: NSError!) -> Void in
        
        if facebookError != nil {
            print("Facebook Login failed. Error \(facebookError)")
        } else {
            // FIX: - found nil and crached when click 'Done' button
            let accessToken = FBSDKAccessToken.currentAccessToken().tokenString
            print("Successfully logged in with facebook. \(accessToken)")
            
            DataService.ds.REF_BASE.authWithOAuthProvider("facebook", token: accessToken, withCompletionBlock: { err, authData  in
                
                if err != nil {
                    print("Login Failed \(err)")
                } else {
                    print("Logged in \(authData)")
                    
                    let user = ["provider": authData.provider!, "blah": "test"]
                    DataService.ds.createFirebaseUsers(authData.uid, user: user)
                    
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: KEY_UID)
                    controller.performSegueWithIdentifier(SEGUE_LOGGED_IN, sender: nil)
                }
                
            })
        }
    }
}