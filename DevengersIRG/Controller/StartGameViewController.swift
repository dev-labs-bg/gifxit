//
//  StartGameViewController.swift
//  DevengersIRG
//
//  Created by Teodora Georgieva on 2/26/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class StartGameViewController: BaseViewController, RequestManagerDelegate, FBSDKLoginButtonDelegate {

    private var logoImageView: UIImageView! {
        didSet {
            logoImageView.frame = CGRect(x: BASIC_OFFSET, y: 0, width: view.frame.width - BASIC_OFFSET*2, height: BASIC_HEIGHT*3)
            logoImageView.center.y = view.center.y - BASIC_OFFSET*2
            logoImageView.image = UIImage(named: "logo")
            view.addSubview(logoImageView)
        }
    }
    
    private var logInButton: FBSDKLoginButton! {
        didSet {
            logInButton.frame = CGRect(x: BASIC_OFFSET, y: view.frame.maxY - BASIC_HEIGHT*4, width: view.frame.size.width - BASIC_OFFSET*2, height: BASIC_HEIGHT*1.5)
            view.addSubview(logInButton)
        }
    }
    
    override func viewDidLoad() {
        gifArray = [String]()
    
        super.viewDidLoad()
        players = [Player]()
        
        setUpUI()
        
        logInButton.readPermissions = ["public_profile", "email"]
        logInButton.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUpUI() {
        logInButton = FBSDKLoginButton()
        logoImageView = UIImageView()
    }
    
    override func makeAPIRequest() {
        manager = RequestManager()
        manager.delegate = self
        for _ in 0...5 {
            manager.getRandomGIF()
        }
    }
    
    func RequestDidFinishWithGIF(gifURL: String) {
        gifArray.append(gifURL)
    }
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        if ((error) != nil)
        {
            print("Error: \(error)")
        }
        else if result.isCancelled {
           print(result)
        }
        else {
        let graphRequest: FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me?fields=id,name,picture", parameters: nil)
            
            graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
                
                if ((error) != nil)
                {
                    print("Error: \(error)")
                }
                else
                {
                    guard let userData = result as? NSDictionary else {
                        return
                    }
                    
                    let player = Player(data: userData)
                    self.players.append(player)
                    
                    self.manager = RequestManager()
                    self.manager.delegate = self
                    self.manager.sendPlayerInfo(player)
                    
                    self.performSegueWithIdentifier("StartGame", sender: self.gifArray)
                }
            })
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let identifier = segue.identifier
        
        switch identifier! {
        case "StartGame":
            let destinationVC = segue.destinationViewController as? GameViewController
            destinationVC?.gifArray = gifArray
            destinationVC?.players = players
        default: print("")
        }
    }
}
