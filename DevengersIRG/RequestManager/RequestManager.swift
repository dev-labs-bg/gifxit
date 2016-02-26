//
//  RequestManager.swift
//  TreasureTrail
//
//  Created by Teodora Georgieva on 10/7/15.
//  Copyright © 2015 Teodora Georgieva. All rights reserved.
//

import UIKit

@objc protocol RequestManagerDelegate {
    optional func RequestDidFinishWithGIF(gifURL: String)
    optional func RequestDidStartGame(canStart: Int)
    optional func RequestDidFinishWithPlayers(players: [Player])
    optional func RequestFailed()
}

class RequestManager: NSObject {
    
    internal var delegate: RequestManagerDelegate!
    
    private var manager: AFHTTPSessionManager!
    
    override init() {
        super.init()
        
        self.manager = AFHTTPSessionManager()
    }
    
    internal func getRandomGIF() {
        
        manager.GET(GIF_API_URL, parameters: nil, progress: { (progress: NSProgress) -> Void in
        
            }, success: { (session: NSURLSessionDataTask, result: AnyObject?) -> Void in
                
                let data = result?.valueForKey("data") as! NSDictionary
                let gif_URL = data.valueForKey("fixed_width_downsampled_url") as! String
                
                self.delegate.RequestDidFinishWithGIF!(gif_URL);
                
            }) { (session :NSURLSessionDataTask?, error: NSError) -> Void in
                print("\(error.description)")
        }
    }
    
    internal func sendPlayerInfo(player: Player) {
        let params = [
            "id": player.id,
            "profilePicture": player.profilePicture
        ]
        
        manager.requestSerializer = AFJSONRequestSerializer()
        manager.POST(GAME_URL, parameters: params, progress: { (progress: NSProgress) -> Void in
            print(progress)
            
            }, success: { (session: NSURLSessionDataTask, response: AnyObject?) -> Void in
                
                let responseObject = response as? NSDictionary
                print(responseObject)
                
            }) { (session: NSURLSessionDataTask?, error: NSError) -> Void in
                print(error.description)
        }
    }
    
    internal func askIfGameIsStarting() {
        manager.GET(IS_GAME_STARTED, parameters: nil, progress: { (progress: NSProgress) -> Void in
            
            }, success: { (session: NSURLSessionDataTask, result: AnyObject?) -> Void in
                
                let gameStarted = (result as! NSDictionary).valueForKey("gameStarted") as? Int
                
                self.delegate.RequestDidStartGame!(gameStarted!)
                
            }) { (session :NSURLSessionDataTask?, error: NSError) -> Void in
                print("\(error.description)")
        }

    }
    
    internal func askForPlayers() {
        
//        var requestPlayers = [Player]()
        
        manager.GET(IS_GAME_STARTED, parameters: nil, progress: { (progress: NSProgress) -> Void in
            
            }, success: { (session: NSURLSessionDataTask, result: AnyObject?) -> Void in
                
//                    let gameData = (result as! NSDictionary).valueForKey("gameData") as? NSArray
//                    
//                    let players = gameData!.valueForKey("player") as? NSDictionary
//                    
//                    for _ in players! {
//                        let player = Player()
//                        player.setStroytellerInfo(players!.valueForKey("id") as! String, association: players!.valueForKey("profilePicture") as! String)
//                        print(players!.valueForKey("profilePicture") as! String)
//                        requestPlayers.append(player)
//                        
//                        self.delegate.RequestDidFinishWithPlayers!(requestPlayers)
//                }
                
            }) { (session :NSURLSessionDataTask?, error: NSError) -> Void in
                print("\(error.description)")
        }
        
    }
}