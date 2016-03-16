//
//  ViewController.swift
//  LED
//
//  Created by 123 on 16/3/16.
//  Copyright © 2016年 123. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var LightSource: UIView!
    
    @IBOutlet weak var slider: UISlider!
    
    
    
    @IBOutlet weak var con: UISwitch!
    
    
    @IBAction func setLightSourceAlphaValue(sender: UISlider) {
        
        let userDefault = NSUserDefaults.standardUserDefaults()//返回NSUserDefaults对象
        userDefault.setBool(self.con.on, forKey: "onOff")
        userDefault.setFloat(self.slider.value, forKey: "brightness")
        userDefault.synchronize()//同步
        
        if self.con.on{
            self.LightSource.alpha = CGFloat(self.slider.value)
        }else{
            self.LightSource.alpha = 0.0
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //首选项
        let userDefault = NSUserDefaults.standardUserDefaults()//返回NSUserDefaults对象
        self.slider.value = userDefault.floatForKey("brightness")
        self.con.on = userDefault.boolForKey("onOff")
        
        if self.con.on{
            self.LightSource.alpha = CGFloat(self.slider.value)
        }else{
            self.LightSource.alpha = 0.0
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

