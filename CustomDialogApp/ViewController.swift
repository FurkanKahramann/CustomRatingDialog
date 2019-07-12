//
//  ViewController.swift
//  CustomDialogApp
//
//  Created by fkahraman on 12.07.2019.
//  Copyright © 2019 fkahraman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let Application = (UIApplication.shared.delegate as! AppDelegate)
    var messageBoxView: CustomViewDialog?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        alertMessageBox()
    }

    func alertMessageBox() {
        
        messageBoxView = Bundle.main.loadNibNamed("CustomViewDialog", owner: self, options: nil)?[0] as! CustomViewDialog?
        Application.window?.addSubview(messageBoxView!)
        messageBoxView?.frame = (Application.window?.frame)!
        messageBoxView?.alpha = 0
        messageBoxView?.showWithAnimation(animation: true, completionHandler: { (type) in})
        self.view.addSubview(messageBoxView!)
    }
    

}




