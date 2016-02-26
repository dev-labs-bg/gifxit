//
//  Player.swift
//  DevengersIRG
//
//  Created by Teodora Georgieva on 2/26/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import Foundation

class Player: NSObject {
    
    var id: String!
    var userName: String!
    var profilePicture: String!
    var isStoryteller: Bool!
    var myGifURL: String!
    var association: String!
    
    override init() {
        super.init()
    }
    
    init (data: NSDictionary) {
       super.init()
    
        id = data.valueForKey("id") as? String
        
        let pictureDict = data.valueForKey("picture")! as! NSDictionary
        getUserPhotoImage(pictureDict)
    }
    
    internal func getUserPhotoImage(pictureDict: NSDictionary) {
        let userID = self.id!
        let facebookProfileUrl = "https://graph.facebook.com/\(userID)/picture?type=large"
        profilePicture = facebookProfileUrl
    }
    
    internal func setStroytellerInfo(gifURL: String, association: String) {
        myGifURL = gifURL
        self.association = association
    }
}