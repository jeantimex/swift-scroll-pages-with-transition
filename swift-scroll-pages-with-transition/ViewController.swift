//
//  ViewController.swift
//  swift-scroll-pages-with-transition
//
//  Created by Yong Su on 11/9/16.
//
//

import UIKit

class ViewController: UIViewController {
    
    var pageViewController = CustomPageViewController()
    var pageColors = [0x54ACD2, 0xFBA026, 0x61BD6D]
    var pageCount: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        configPageViewController()
    }
    
    func configPageViewController() {
        pageViewController.dataSource = self
        
        let startViewController: ContentViewController = viewControllerAtIndex(index: 0)
        let viewControllers = [startViewController]
        
        pageViewController.setViewControllers(viewControllers, direction: .forward, animated: true, completion: nil)
        pageViewController.view.frame = view.frame
        pageViewController.delegate = self
     
        addChildViewController(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParentViewController: self)
    }
    
    func viewControllerAtIndex(index: Int) -> ContentViewController {
        if (pageCount == 0 || index >= pageCount) {
            return ContentViewController()
        }
        
        let vc: ContentViewController = ContentViewController()
        vc.pageIndex = index
        vc.pageColor = pageColors[index]
        
        return vc
    }

}

extension ViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc: ContentViewController = viewController as! ContentViewController
        let index: Int = vc.pageIndex
        
        if (index == 0 || index == NSNotFound) {
            return nil
        }
        
        return viewControllerAtIndex(index: index - 1)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc: ContentViewController = viewController as! ContentViewController
        let index: Int = vc.pageIndex
        
        if (index == NSNotFound || index == pageCount - 1) {
            return nil
        }
        
        return self.viewControllerAtIndex(index: index + 1)
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageCount
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
}

extension ViewController: CustomPageViewControllerDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
    }
    
}

