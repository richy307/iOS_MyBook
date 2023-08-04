//
//  ViewController.swift
//  iOS_MyBook
//
//  Created by 王麒翔 on 2023/8/4.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource {
    
    // 前一頁
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? ContentViewController
        guard var index = vc?.nowPageNumber else { return nil }
        if index == 0 || index == NSNotFound {
            return nil
        } else {
            index -= 1
            return viewControllerAtIndex(index: index)
        }
    }
    
    // 下一頁
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = viewController as? ContentViewController
        guard var index = vc?.nowPageNumber else { return nil }
        if index == NSNotFound {
            return nil
        } else {
            index += 1
            if index >= 3 {
                return nil
            } else {
                return viewControllerAtIndex(index: index)
            }
        }
    }
    
    
    var pageViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // UIPageViewController
        let pageViewController = storyboard.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        pageViewController?.dataSource = self // dataSource
        pageViewController?.view.frame = self.view.frame // 設定 pageViewController畫面跟 ViewController一樣大
        if let okPageViewController = pageViewController {
            addChild(pageViewController!) // 加入到 view controller當中
            view.addSubview(pageViewController!.view) // show到 ViewController畫面上
        }
        pageViewController?.didMove(toParent: self) //
        
        guard let startPage = viewControllerAtIndex(index: 0) else { return }
        // 設定初始頁面
        pageViewController?.setViewControllers([startPage], direction: .forward, animated: true, completion: nil)
    }
    
    func viewControllerAtIndex (index:Int) -> ContentViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // ContentViewController
        let contentViewController = storyboard.instantiateViewController(withIdentifier: "MainContentViewController") as? ContentViewController
        contentViewController?.nowPageNumber = index
        return contentViewController
    }


}

