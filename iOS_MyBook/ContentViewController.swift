//
//  ContentViewController.swift
//  iOS_MyBook
//
//  Created by 王麒翔 on 2023/8/4.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    var nowPageNumber = 0 // 目前頁數

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        mainImageView.image = UIImage(named: "\(nowPageNumber)") // int to string
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
