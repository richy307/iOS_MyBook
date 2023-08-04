//
//  ViewController.swift
//  iOS_MyBook
//
//  Created by 王麒翔 on 2023/8/4.
//

import UIKit

class ViewController: UIViewController {
    
    var pageViewController: UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pageViewController = storyboard.instantiateViewController(withIdentifier: "PageViewController") as? UIPageViewController
        pageViewController?.view.frame = self.view.frame // 設定 pageViewController畫面跟 ViewController一樣大
        if let okPageViewController = pageViewController {
            addChild(pageViewController!) // 加入到 view controller當中
            view.addSubview(pageViewController!.view)
        }
        pageViewController?.didMove(toParent: self) //
        
        guard let startPage = viewControllerAtIndex(index: 0) else { return }
        pageViewController?.setViewControllers([startPage], direction: .forward, animated: true, completion: nil)
    }
    
    func viewControllerAtIndex (index:Int) -> ContentViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contentViewController = storyboard.instantiateViewController(withIdentifier: "MainContentViewController") as? ContentViewController
        contentViewController?.nowPageNumber = index
        return contentViewController
    }


}

