//
//  ViewController.swift
//  mySwiftDrawer
//
//  Created by user15 on 2017/9/11.
//  Copyright © 2017年 user15. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBAction func clear(_ sender: Any) {
        //清除所有線條
        myview.clearMe();
    }

    @IBAction func undo(_ sender: Any) {
        //恢復上一動
        myview.undo();
    }
    
    @IBAction func redo(_ sender: Any) {
        myview.redo();
    }
    @IBOutlet weak var myview: MyView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        /*
        let frame = CGRect(x: 0, y: 0,
                           width: view.frame.width, height: view.frame.height)
        let myview = MyView(frame: frame)
        view.addSubview(myview)
        */
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

