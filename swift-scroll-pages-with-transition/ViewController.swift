//
//  ViewController.swift
//  swift-scroll-pages-with-transition
//
//  Created by Yong Su on 11/9/16.
//
//

import UIKit

class ViewController: UIViewController {
    
    var mainScrollView = UIScrollView()
    var pageCount: Int = 3
    var pageColors = [0x54ACD2, 0xFBA026, 0x61BD6D]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageWidth = view.frame.width
        let pageHeight = view.frame.height
        
        for i in 0 ..< pageCount {
            let pageView: UIView = UIView(frame: CGRect(x: pageWidth * CGFloat(i), y: 0, width: pageWidth, height: pageHeight))
            
            pageView.backgroundColor = UIColor.init(hex: pageColors[i])
            mainScrollView.addSubview(pageView)
        }
        
        mainScrollView.frame = view.frame
        mainScrollView.contentSize.width = view.frame.width * CGFloat(pageCount)
        mainScrollView.showsHorizontalScrollIndicator = false
        mainScrollView.isPagingEnabled = true
        
        view.backgroundColor = UIColor.white
        view.addSubview(mainScrollView)
    }

}

