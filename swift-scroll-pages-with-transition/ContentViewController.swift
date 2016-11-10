//
//  ContentViewController.swift
//  swift-scroll-pages-with-transition
//
//  Created by Yong Su on 11/10/16.
//
//

import UIKit

class ContentViewController: UIViewController {
    
    var pageIndex: Int!
    var pageColor: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: pageColor)
    }
    
}
