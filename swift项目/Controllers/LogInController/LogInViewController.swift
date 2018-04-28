//
//  LogInViewController.swift
//  swift项目
//
//  Created by xunli on 2018/4/13.
//  Copyright © 2018年 caoji. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = "登录"
        let imageview = UIImageView(image:UIImage(named:"back"))
        imageview.frame = CGRect(x:10,y:20,width:30,height:30)
        self.view.addSubview(imageview)
        // 添加手势
        let tapRecognizer = UITapGestureRecognizer(target: self, action:#selector(tapClick))
        tapRecognizer.numberOfTapsRequired = 1
        tapRecognizer.numberOfTouchesRequired = 1
        imageview.isUserInteractionEnabled = true
        imageview.addGestureRecognizer(tapRecognizer)
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellow
        let button:UIButton = UIButton.init(type: .system)
        button.frame = CGRect(x:150,y:180,width:100,height:30)
        button.setTitle("登录", for: .normal)
        button.backgroundColor = UIColor.green
        button.addTarget(self, action:#selector(logInClick), for: .touchUpInside)
        self.view.addSubview(button)
    }
    // 手势响应方法
    @objc func tapClick(recognizer:UITapGestureRecognizer)
    {
        print("123")
//        self.dismiss(animated: true) {
//
//        }
        let window:UIWindow = UIApplication.shared.keyWindow!
        window.rootViewController = MainTabBarController()
        NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: ["post":"NewTest"])
    }
    @objc func logInClick() {
        MBProgressHUD .showMessage("登录中...")
        UserDefaults.standard.set("token", forKey: "token")
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            MBProgressHUD .hide()
           //self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
           // self.dismiss(animated: true, completion: nil)
            let window:UIWindow = UIApplication.shared.keyWindow!
            window.rootViewController = MainTabBarController()
            NotificationCenter.default.post(name: NSNotification.Name("isTest"), object: self, userInfo: ["post":"NewTest"])
            print("登录成功")
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
