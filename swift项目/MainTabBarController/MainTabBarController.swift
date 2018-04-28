//
//  MainTabBarController.swift
//  swift项目
//
//  Created by xunli on 2018/4/13.
//  Copyright © 2018年 caoji. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(test), name: NSNotification.Name(rawValue:"isTest"), object: nil)
        addchildVCandRootVC(navtitle: "首页", tabtitle: "首页", rootVC: MainViewController(), img: #imageLiteral(resourceName: "主页-灰"), img_selected: #imageLiteral(resourceName: "主页"))
        addchildVCandRootVC(navtitle: "设备", tabtitle: "设备", rootVC: MainTwoViewController(), img: #imageLiteral(resourceName: "设备-灰"), img_selected: #imageLiteral(resourceName: "设备"))
        addchildVCandRootVC(navtitle: "计划", tabtitle: "计划", rootVC: MainThreeViewController(), img:#imageLiteral(resourceName: "计划-灰"), img_selected:#imageLiteral(resourceName: "计划"))
        addchildVCandRootVC(navtitle: "我的", tabtitle: "我的", rootVC: MainFourViewController(), img:#imageLiteral(resourceName: "我的-灰"), img_selected:#imageLiteral(resourceName: "我的"))
    }
    /*
     *向MainTabBarController中添加子控制器
     */
    func addchildVCandRootVC(navtitle:String,tabtitle:String,rootVC:UIViewController,img:UIImage,img_selected:UIImage) {
        let cnav = UINavigationController.init(rootViewController: rootVC)
        rootVC.title = navtitle
        rootVC.tabBarItem.image = img.withRenderingMode(.alwaysOriginal)
        rootVC.tabBarItem.selectedImage = img_selected.withRenderingMode(.alwaysOriginal)
        rootVC.tabBarItem.title = tabtitle
        rootVC.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: UIColor.init(red: 255/255.0, green: 172/255.0, blue: 56/255.0, alpha: 1.0)],for: .selected)
        self.addChildViewController(cnav)
    }
    /*
     *点击tabarcontroller的Item触发的点击事件
     */
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let window:UIWindow = UIApplication.shared.keyWindow!
        
        let token = UserDefaults.standard.string(forKey: "token")
        let title = item.title!
        print(title);
        //设备，计划，我的三个界面需要登录才能查看
        if title.elementsEqual("设备") {
            if(token?.isEmpty)!{
                //let vc = LogInViewController()
                //self.present(vc, animated: true, completion: nil)
                window.rootViewController = LogInViewController()
            }
        }else if title.elementsEqual("计划") {
            if(token?.isEmpty)!{
//                let vc = LogInViewController()
//                self.present(vc, animated: true, completion: nil)
                window.rootViewController = LogInViewController()
            }
        }else if title.elementsEqual("我的") {
            if(token?.isEmpty)!{
//                let vc = LogInViewController()
//                self.present(vc, animated: true, completion: nil)
//                //self.navigationController?.pushViewController(vc, animated: true)
                window.rootViewController = LogInViewController()
            }
        }
    }
    //实现通知监听方法
    @objc func test(nofi : Notification){
        let token = UserDefaults.standard.string(forKey: "token")
        let str = nofi.userInfo!["post"]
        print(String(describing: str!) + "this notifi")
        if(token?.isEmpty)!{
            self.selectedIndex = 0
        }else{
            self.selectedIndex = 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
