//
//  MainFourViewController.swift
//  swift项目
//
//  Created by xunli on 2018/4/13.
//  Copyright © 2018年 caoji. All rights reserved.
//

import UIKit

class MainFourViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.blue
        let button:UIButton = UIButton.init(type: .system)
        button.frame = CGRect(x:150,y:180,width:100,height:30)
        button.setTitle("退出登录", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action:#selector(logInClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    @objc func logInClick() {
        MBProgressHUD .showMessage("退出登录...")
        UserDefaults.standard.set("", forKey: "token")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            MBProgressHUD .hide()
            //self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            // self.dismiss(animated: true, completion: nil)
            let window:UIWindow = UIApplication.shared.keyWindow!
            window.rootViewController = MainTabBarController()
            NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: ["post":"NewTest"])
            print("退出登录成功")
        }
        //        let vc = CountryNumberController()
        //        self.present(vc, animated: true, completion: nil)
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
