//
//  VoteViewController.swift
//  DevengersIRG
//
//  Created by Teodora Georgieva on 2/26/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import UIKit

class VoteViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    private var GIFsPageViewController: UICollectionView! {
        didSet {
            GIFsPageViewController.dataSource = self
            GIFsPageViewController.delegate = self
            
            GIFsPageViewController.registerClass(GIFCollectionViewCell.self, forCellWithReuseIdentifier: "CELL_ID")
            GIFsPageViewController.backgroundColor = UIColor(red: 194.0/255.0, green: 56.0/255.0, blue: 42.0/255.0, alpha: 1)
            
            view.addSubview(GIFsPageViewController)
        }
    }
    
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
    
    private var lineView: UILabel! {
        didSet {
            lineView.frame = CGRect(x: 0, y: wordLabel.frame.minY + BASIC_HEIGHT + navigationController!.navigationBar.frame.height, width: view.frame.width, height: BASIC_HEIGHT)
            lineView.backgroundColor = UIColor.darkGrayColor()
            lineView.alpha = 0.7
            lineView.textColor = UIColor.whiteColor()
            lineView.textAlignment = .Center
            lineView.text = "Vote for a giphy"
            view.addSubview(lineView)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        view.backgroundColor = UIColor(red: 194.0/255.0, green: 56.0/255.0, blue: 42.0/255.0, alpha: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func setUpUI() {
        wordLabel = UILabel()
        lineView = UILabel()
        wordLabel.center.x = view.center.x
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = MINIMUM_LINE_SPACING
        layout.minimumLineSpacing = MINIMUM_LINE_SPACING
        layout.sectionInset = UIEdgeInsets(top: BASIC_LEFT_OFFSET/2, left: 0, bottom: BASIC_LEFT_OFFSET, right: 0)
        layout.itemSize = CGSize(width: BASIC_GIF_WIDTH_HEIGHT, height: BASIC_GIF_WIDTH_HEIGHT)
        
        GIFsPageViewController = UICollectionView(frame: CGRect(x: 0, y: lineView.frame.maxY, width: view.frame.width, height: view.frame.height - lineView.frame.maxY), collectionViewLayout: layout)
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CELL_ID", forIndexPath: indexPath) as! GIFCollectionViewCell
        cell.gifURL = NSURL(string: "https://media.giphy.com/media/qFxlqjtA3m44U/giphy.gif")!
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("VoteVC", sender: "")
    }
}
