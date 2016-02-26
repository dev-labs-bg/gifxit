//
//  MoviesCollectionViewCell.swift
//  ShowtimesDemo
//
//  Created by Teodora Georgieva on 2/20/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import UIKit

class GIFCollectionViewCell: UICollectionViewCell {

    // MARK:
    // MARK: Internal Properties
    
    var gifURL: NSURL! {
        didSet {
            let gifRequest = NSURLRequest(URL: gifURL)
            gifWebView.loadRequest(gifRequest)
        }
    }
    
    
    // MARK:
    // MARK: Private Properties

    private var gifWebView: UIWebView! {
        didSet {
            gifWebView.userInteractionEnabled = false
        }
    }

    // MARK: - Override
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        layer.borderColor = UIColor.whiteColor().CGColor
        layer.borderWidth = 2
        layer.cornerRadius = 10
        clipsToBounds = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gifWebView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    // MARK: - Private Methods
    
    // Initialize the UI elements of the view
    private func setupUI() {
        gifWebView = UIWebView()
        addSubview(gifWebView)
    }
}
