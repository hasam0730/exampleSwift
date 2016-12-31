//
//  ViewController.swift
//  coreGraphic
//
//  Created by Developer on 12/29/16.
//  Copyright © 2016 Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterView: CounterView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let leftBtn = PushButtonView(frame: CGRect(x:0, y:0, width: 25, height: 25))
        leftBtn.addTarget(self, action: #selector(doSomething), for: .touchUpInside)
        let item = UIBarButtonItem(customView: leftBtn)
        self.navigationItem.leftBarButtonItem = item
    }
    
    func doSomething() {
        counterView.counter += 1
    }

    @IBAction func btnTouched(_ sender: PushButtonView) {
        doSomething()
        print("12312")
    }
    @IBAction func subBtnTouched(_ sender: UIButton) {
        if counterView.counter > 1 {
            counterView.counter -= 1
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

