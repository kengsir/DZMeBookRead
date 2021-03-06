//
//  HJMainViewController.swift
//  DZMeBookRead
//
//  Created by 邓泽淼 on 16/8/31.
//  Copyright © 2016年 DZM. All rights reserved.
//

import UIKit

class HJMainViewController: UIViewController {

    var readVC:HJReadPageController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        
        let button = UIButton(type:UIButtonType.custom)
        button.setTitle("点击阅读", for: UIControlState())
        button.backgroundColor = UIColor.green
        button.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        view.addSubview(button)
        button.addTarget(self, action: #selector(HJMainViewController.read), for: UIControlEvents.touchDown)
        
    }
    
    func read() {
        
        // 方法一
        
        MBProgressHUD.showMessage("本地文件第一次解析慢,以后就会秒进了")
        
        let fileURL = Bundle.main.url(forResource: "求魔", withExtension: "txt")
        
        readVC = HJReadPageController()
        
        HJReadParser.separateLocalURL(fileURL!) { [weak self] (isOK) in
            
             MBProgressHUD.hide()
            
            if self != nil {
                
                self!.readVC!.readModel = HJReadModel.readModelWithFileName("求魔")
                
                self!.navigationController?.pushViewController(self!.readVC!, animated: true)
                
            }
        }
        
        // 方法一
        
//        MBProgressHUD.showMessage()
//        
//        let fileURL = NSBundle.mainBundle().URLForResource("求魔", withExtension: "txt")
//
//        let readVC = HJReadPageController()
//        
//        dispatch_async(dispatch_get_global_queue(0, 0)) {
//            
//            readVC.readModel = HJReadModel.readModelWithLocalBook(fileURL!)
//            
//            dispatch_async(dispatch_get_main_queue(), { [weak self] ()->() in
//                
//                MBProgressHUD.hideHUD()
//                
//                self?.navigationController?.pushViewController(readVC, animated: true)
//                })
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
