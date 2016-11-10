//
//  ViewController.swift
//  swift-scroll-pages-with-transition
//
//  Created by Yong Su on 11/9/16.
//
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
    var pageCount: Int = 3
    var pageColors = [0x54ACD2, 0xFBA026, 0x61BD6D]
    var pageControl = UIPageControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configScrollView()
        configPageControl()
    }
    
    func configScrollView() {
        let pageWidth = view.frame.width
        let pageHeight = view.frame.height
        
        for i in 0 ..< pageCount {
            let pageView: UIView = UIView(frame: CGRect(x: pageWidth * CGFloat(i), y: 0, width: pageWidth, height: pageHeight))
            
            pageView.backgroundColor = UIColor.init(hex: pageColors[i])
            scrollView.addSubview(pageView)
        }
        
        scrollView.frame = view.frame
        scrollView.contentSize.width = view.frame.width * CGFloat(pageCount)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
    }
    
    func configPageControl() {
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.red
        pageControl.pageIndicatorTintColor = UIColor.black
        pageControl.currentPageIndicatorTintColor = UIColor.green
        pageControl.frame = CGRect(x: 50, y: 300, width: 200, height: 50)
        pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
        
        view.addSubview(pageControl)
    }
    
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }

}

