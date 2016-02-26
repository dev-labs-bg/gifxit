//
//  WinnerTableViewCell.swift
//  DevengersIRG
//
//  Created by Teodora Georgieva on 2/26/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import UIKit

class WinnerTableViewCell: UITableViewCell {

    internal var name: String! {
        didSet {
            nameLabel.text = name
        }
    }
    
    internal var points: String! {
        didSet {
            pointsLabel.text = points
        }
    }
    
    private var nameLabel: UILabel! {
        didSet {
            nameLabel.textAlignment = .Left
            addSubview(nameLabel)
        }
    }
    
    private var pointsLabel: UILabel! {
        didSet {
            pointsLabel.textAlignment = .Right
            addSubview(pointsLabel)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpUI()
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        nameLabel.frame = CGRect(x: 0, y: 0, width: frame.width/2, height: frame.height)
        pointsLabel.frame = CGRect(x: nameLabel.frame.maxX, y: 0, width: frame.width/2, height: frame.height)
    }
    
    private func setUpUI() {
        backgroundColor = UIColor.clearColor()

        nameLabel = UILabel()
        pointsLabel = UILabel()
    }

}
