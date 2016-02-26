//
//  PlayerProfileView.swift
//  DevengersIRG
//
//  Created by Teodora Georgieva on 2/26/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import UIKit

class PlayerProfileView: UIView {

    // MARK: Internal Properties
    
    internal var storyTellerImage: UIImage! {
        didSet {
            
        }
    }
    
    internal var player1Image: UIImage! {
        didSet {
            
        }
    }
    
    internal var player2Image: UIImage! {
        didSet {
            
        }
    }
    
    // MARK: Private Properties
    
    private var storyTellerImageView: UIImageView! {
        didSet {
            storyTellerImageView.layer.cornerRadius = 35
            storyTellerImageView.clipsToBounds = true
            storyTellerImageView.layer.borderColor = UIColor.whiteColor().CGColor
            storyTellerImageView.layer.borderWidth = MINIMUM_LINE_SPACING
            storyTellerImageView.image = UIImage(named: "avatar2")
        }
    }
    
    private var label: UILabel! {
        didSet {
            label.textColor = UIColor.whiteColor()
            label.text = "Storyteller"
            label.textAlignment = .Center
        }
    }
    
    private var player1ImageView: UIImageView! {
        didSet {
            player1ImageView.layer.cornerRadius = 25
            player1ImageView.clipsToBounds = true
            player1ImageView.layer.borderColor = UIColor.whiteColor().CGColor
            player1ImageView.layer.borderWidth = MINIMUM_LINE_SPACING
            player1ImageView.image = UIImage(named: "avatar1")
        }
    }
    
    private var player2ImageView: UIImageView! {
        didSet {
            player2ImageView.layer.cornerRadius = 25
            player2ImageView.clipsToBounds = true
            player2ImageView.layer.borderColor = UIColor.whiteColor().CGColor
            player2ImageView.layer.borderWidth = MINIMUM_LINE_SPACING
            player2ImageView.image = UIImage(named: "avatar3")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = MainColor.MainOrangeColor()
        setUpUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        storyTellerImageView = UIImageView()
        label = UILabel()
        player1ImageView = UIImageView()
        player2ImageView = UIImageView()
        
        addSubview(storyTellerImageView)
        addSubview(label)
        addSubview(player1ImageView)
        addSubview(player2ImageView)
    }
    
    override func layoutSubviews() {
        storyTellerImageView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        storyTellerImageView.center = center
        
        label.frame = CGRect(x: 0, y: storyTellerImageView.frame.maxY + BASIC_LEFT_OFFSET/3, width: frame.width, height: BASIC_HEIGHT)
        
        player1ImageView.frame = CGRect(x: storyTellerImageView.frame.minX - BASIC_OFFSET*4 - 50, y: storyTellerImageView.frame.origin.y + BASIC_LEFT_OFFSET/2, width: 50, height: 50)
        player2ImageView.frame = CGRect(x: storyTellerImageView.frame.maxX + BASIC_OFFSET*4, y: storyTellerImageView.frame.origin.y + BASIC_LEFT_OFFSET/2, width: 50, height: 50)
    }

}
