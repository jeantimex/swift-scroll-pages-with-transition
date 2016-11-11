//
//  CustomPageViewController.swift
//  swift-scroll-pages-with-transition
//
//  Created by Yong Su on 11/10/16.
//
//

import UIKit

protocol CustomPageViewControllerDelegate: UIPageViewControllerDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView)
}

class CustomPageViewController: UIPageViewController {
    
    override init(transitionStyle style: UIPageViewControllerTransitionStyle, navigationOrientation: UIPageViewControllerNavigationOrientation, options: [String : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: options)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let scrollView = view.subviews.filter { $0 is UIScrollView }.first as? UIScrollView
        scrollView?.frame = view.bounds
        scrollView?.delegate = self
        
        let pageControl = view.subviews.filter { $0 is UIPageControl }.first as? UIPageControl
        if (pageControl != nil) {
            view.bringSubview(toFront: pageControl!)
        }
    }
    
}

extension CustomPageViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let delegate: CustomPageViewControllerDelegate = self.delegate as? CustomPageViewControllerDelegate {
            delegate.scrollViewDidScroll(scrollView)
        }
    }
    
}
