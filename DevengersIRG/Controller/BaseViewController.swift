//
//  BaseViewController.swift
//  DevengersIRG
//
//  Created by Teodora Georgieva on 2/26/16.
//  Copyright © 2016 Teodora Georgieva. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    internal var players: [Player]!
    
    internal var gifArray: [String]!
    
    internal var manager: RequestManager!
    
    internal var lineLabeFrame: CGRect! {
        didSet {
            lineLabel.frame = lineLabeFrame
        }
    }
    
    internal var lineLabelText: String! {
        didSet {
            lineLabel.text = lineLabelText
        }
    }
    
    private var lineLabel: UILabel! {
        didSet {
            lineLabel.backgroundColor = UIColor.darkGrayColor()
            lineLabel.alpha = 0.7
            lineLabel.textColor = UIColor.whiteColor()
            lineLabel.textAlignment = .Center
            view.addSubview(lineLabel)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = MainColor.MainOrangeColor()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barStyle = .Black
        navigationController?.navigationBar.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        
        makeAPIRequest()
        lineLabel = UILabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func /*abstract*/ makeAPIRequest() { /*Empty implementation*/ }
}
