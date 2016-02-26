//
//  ViewController.swift
//  DevengersIRG
//
//  Created by Teodora Georgieva on 2/26/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import UIKit

class GameViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate, RequestManagerDelegate {

    // MARK:
    // MARK: Private Properties
    
    private var GIFsPageViewController: UICollectionView! {
        didSet {
            GIFsPageViewController.dataSource = self
            GIFsPageViewController.delegate = self
            
            GIFsPageViewController.registerClass(GIFCollectionViewCell.self, forCellWithReuseIdentifier: "CELL_ID")
            GIFsPageViewController.backgroundColor = MainColor.MainOrangeColor()
            
            view.addSubview(GIFsPageViewController)
        }
    }
    
    private var playerProfileView: PlayerProfileView! {
        didSet {
            playerProfileView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height/3.5)
            view.addSubview(playerProfileView)
        }
    }
    
    private var wordTextField: UITextField! {
        didSet {
            wordTextField.frame = CGRect(x: 0, y: playerProfileView.frame.maxY, width: view.frame.width*2/3, height: BASIC_HEIGHT)
            wordTextField.textAlignment = .Center
            wordTextField.backgroundColor = UIColor.darkGrayColor()
            wordTextField.alpha = 0.5
            wordTextField.layer.cornerRadius = 10
            wordTextField.clipsToBounds = true
            wordTextField.placeholder = "Please enter an association!"
            view.addSubview(wordTextField)
        }
    }
    
    // MARK: 
    // MARK: Override
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        
        manager = RequestManager()
        manager.delegate = self
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "canStartGame:", userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

    private func setUpUI() {
        
        playerProfileView = PlayerProfileView()
        wordTextField = UITextField()
        wordTextField.center.x = view.center.x
        
        lineLabeFrame = CGRect(x: 0, y: wordTextField.frame.maxY + BASIC_OFFSET*2, width: view.frame.width, height: BASIC_HEIGHT)
        lineLabelText = "Choose a giphy"
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = MINIMUM_LINE_SPACING
        layout.minimumLineSpacing = MINIMUM_LINE_SPACING
        layout.sectionInset = UIEdgeInsets(top: BASIC_LEFT_OFFSET/2, left: 0, bottom: BASIC_LEFT_OFFSET, right: 0)
        layout.itemSize = CGSize(width: BASIC_GIF_WIDTH_HEIGHT, height: BASIC_GIF_WIDTH_HEIGHT)
        
        GIFsPageViewController = UICollectionView(frame: CGRect(x: 0, y: lineLabeFrame.maxY, width: view.frame.width, height: view.frame.height - view.frame.height/3), collectionViewLayout: layout)
    }
    
    func canStartGame(sender: NSTimer) {
        manager.askIfGameIsStarting()
    }
    
    func RequestDidStartGame(canStart: Int) {
        if canStart == 0 {
            manager.askForPlayers()
        }
    }
    
    func RequestDidFinishWithPlayers(players: [Player]) {
        for player in players {
            if player.isStoryteller == true {
                 playerProfileView.storyTellerImage = UIImage(named: player.profilePicture)
            }
        }
       
        playerProfileView.player1Image = UIImage(named:players[1].profilePicture)
        playerProfileView.player2Image = UIImage(named:players[2].profilePicture)
        self.players = players
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CELL_ID", forIndexPath: indexPath) as! GIFCollectionViewCell
        
        cell.gifURL = NSURL(string: gifArray[indexPath.row])
        
        players[0].isStoryteller = true
        
        for player in players {
            if player.isStoryteller == true {
                
            } else {
                
            }
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("VoteVC", sender: "")
    }
}

