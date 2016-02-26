//
//  WinnerViewController.swift
//  DevengersIRG
//
//  Created by Teodora Georgieva on 2/26/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import UIKit

class WinnerViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    private var wordLabel: UILabel! {
        didSet {
            wordLabel.frame = CGRect(x: 0, y: navigationController!.navigationBar.frame.maxY + BASIC_OFFSET, width: BASIC_WIDTH*4, height: BASIC_HEIGHT)
            wordLabel.textAlignment = .Center
            wordLabel.text = "Fluffy"
            wordLabel.layer.cornerRadius = 10
            wordLabel.textColor = UIColor.whiteColor()
            wordLabel.clipsToBounds = true
            wordLabel.backgroundColor = UIColor.darkGrayColor()
            wordLabel.alpha = 0.7
            view.addSubview(wordLabel)
        }
    }

    private var gifWebView: UIWebView! {
        didSet {
            gifWebView.frame = CGRect(x: 0, y: wordLabel.frame.maxY + BASIC_OFFSET, width: BASIC_GIF_WIDTH_HEIGHT, height: BASIC_GIF_WIDTH_HEIGHT)
            gifWebView.layer.cornerRadius = 10
            gifWebView.clipsToBounds = true
            let gifRequest = NSURLRequest(URL: NSURL(string: "https://media.giphy.com/media/qFxlqjtA3m44U/giphy.gif")!)
            gifWebView.loadRequest(gifRequest)
            gifWebView.userInteractionEnabled = false
            view.addSubview(gifWebView)
        }
    }
    
    private var button: UIButton! {
        didSet {
            button.setTitle("Next Round", forState: .Normal)
            button.frame = CGRect(x: 0, y: view.frame.maxY - BASIC_HEIGHT - BASIC_LEFT_OFFSET, width: view.frame.width/2, height: BASIC_HEIGHT)
            button.backgroundColor = UIColor.darkGrayColor()
            button.alpha = 0.7
            button.layer.cornerRadius = 12
            button.clipsToBounds = true
            view.addSubview(button)
        }
    }
    
    private var scoreBoardTV: UITableView! {
        didSet {
            scoreBoardTV.frame = CGRect(x: BASIC_OFFSET, y: lineLabeFrame.maxY + BASIC_OFFSET, width: view.frame.width - BASIC_OFFSET*2, height: BASIC_GIF_WIDTH_HEIGHT)
            scoreBoardTV.backgroundColor = UIColor.clearColor()
            scoreBoardTV.delegate = self
            scoreBoardTV.dataSource = self
            scoreBoardTV.registerClass(WinnerTableViewCell.self, forCellReuseIdentifier: "CELL_ID")
            view.addSubview(scoreBoardTV)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpUI() {
        wordLabel = UILabel()
        gifWebView = UIWebView()
        button = UIButton()
        
        lineLabeFrame = CGRect(x: 0, y: gifWebView.frame.maxY + BASIC_HEIGHT, width: view.frame.width, height: BASIC_HEIGHT)
        lineLabelText = "Vote for a giphy"
        
        scoreBoardTV = UITableView()
        
        wordLabel.center.x = view.center.x
        gifWebView.center.x = view.center.x
        button.center.x = view.center.x
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CELL_ID", forIndexPath: indexPath) as! WinnerTableViewCell
        
        cell.name = "Peter"
        cell.points = "4"
        
        return cell
    }
}
