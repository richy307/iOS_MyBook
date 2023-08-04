//
//  ViewController.swift
//  iOS_MyBook
//
//  Created by 王麒翔 on 2023/8/4.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
    func viewControllerAtIndex (index:Int) -> ContentViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let contentViewController = storyboard.instantiateViewController(withIdentifier: "MainContentViewController") as? ContentViewController
        contentViewController?.nowPageNumber = index
        return contentViewController
    }


}

