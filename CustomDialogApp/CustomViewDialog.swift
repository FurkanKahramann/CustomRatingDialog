//
//  CustomViewDialog.swift
//  CustomDialogApp
//
//  Created by fkahraman on 12.07.2019.
//  Copyright © 2019 fkahraman. All rights reserved.
//

import UIKit

class CustomViewDialog: UIView {
    
    @IBOutlet weak var customDialog: UIView!
    @IBOutlet weak var appIconImage: UIImageView!
    @IBOutlet weak var backGroundImageView: UIImageView!
    
    
    @IBOutlet weak var star1: UIButton!
    @IBOutlet weak var star2: UIButton!
    @IBOutlet weak var star3: UIButton!
    @IBOutlet weak var star4: UIButton!
    @IBOutlet weak var star5: UIButton!
    
    var isShown : Bool = false
    
    
    // MARK: - AwakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bindGUI()
        let icon = UIApplication.shared.icon
        appIconImage.image = icon
    }
    
    
    // MARK: - LayoutGUI
    
    func layoutGUI() {
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.closeAction(_:)))
        backGroundImageView.addGestureRecognizer(tapGesture)
        backGroundImageView.isUserInteractionEnabled = true
    }
    
    @IBAction func okButtonAction(_ sender: Any) {
        
        hideWithAnimation(animation: true) { (status) in
            
        }
    }
    
    
    // MARK: - BindGUI
    
    func bindGUI() {
        
        layoutGUI()
        loadStyles()
    }

    
    func loadStyles() {
       
        customDialog.layer.cornerRadius = 17
    }
    
    // MARK: - Show popup with animation
    
    func showWithAnimation(animation : Bool, completionHandler:@escaping (_ completed : Bool) -> Void) {
        
        if (isShown) {
            return
        }
        
        isShown = true
        
        if(animation) {
            
            UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {() -> Void in
                self.alpha = 1
            }, completion: {(finished: Bool) -> Void in
                self.superview!.isUserInteractionEnabled = true
                completionHandler(true)
            })
        }
            
        else {
            self.alpha = 1.0
            completionHandler(true)
        }
    }
    
    
    // MARK: - Hide popup with animation
    
    func hideWithAnimation(animation : Bool, completionHandler:@escaping (_ completed : Bool) -> Void) {
        
        if (!isShown) {
            return
        }
        
        isShown = false
        
        if(animation) {
            
            UIView.animate(withDuration: 0.25, delay: 0, options: .beginFromCurrentState, animations: {() -> Void in
                self.alpha = 0
            }, completion: {(finished: Bool) -> Void in
                self.superview!.isUserInteractionEnabled = true
                completionHandler(true)
            })
        }
            
        else {
            self.alpha = 0
            completionHandler(true)
        }
    }
    
    
    // MARK: - Gesture recognizer
    
    @objc func closeAction(_ sender: UITapGestureRecognizer) {
        
        hideWithAnimation(animation: true) { (status) in
            
        }
    }
    
    @IBAction func star1Action(_ sender: UIButton) {
        star1.isSelected = !star1.isSelected
        if (star1.isSelected == true){
            star1.isSelected = true
        }
        else if (star1.isSelected == false)
        {
            star2.isSelected = false
            star3.isSelected = false
            star4.isSelected = false
            star5.isSelected = false
        }
        //star1.setImage(UIImage(named: "star_filled"), for: .normal)
    }
    @IBAction func star2Action(_ sender: UIButton) {
        star2.isSelected = !star2.isSelected
        if (star2.isSelected == true){
            star1.isSelected = true
            star3.isSelected = false
            star4.isSelected = false
            star5.isSelected = false
        }
        else if (star2.isSelected == false)
        {
            star3.isSelected = false
            star4.isSelected = false
            star5.isSelected = false
        }
        //star2.setImage(UIImage(named: "star_filled"), for: .normal)
    }
    @IBAction func star3Action(_ sender: UIButton) {
        star3.isSelected = !star3.isSelected
        if (star3.isSelected == true){
            star1.isSelected = true
            star2.isSelected = true
            star4.isSelected = false
            star5.isSelected = false
        }
        else if (star3.isSelected == false)
        {
            star4.isSelected = false
            star5.isSelected = false
        }
        //star3.setImage(UIImage(named: "star_filled"), for: .normal)
    }
    @IBAction func star4Action(_ sender: UIButton) {
        star4.isSelected = !star4.isSelected
        if (star4.isSelected == true){
            star1.isSelected = true
            star2.isSelected = true
            star3.isSelected = true
            star5.isSelected = false
        }
        else if (star4.isSelected == false && star5.isSelected == true)
        {
            star1.isSelected = true
            star2.isSelected = true
            star3.isSelected = true
            star5.isSelected = false
        }
        //star4.setImage(UIImage(named: "star_filled"), for: .normal)
    }
    @IBAction func star5Action(_ sender: UIButton) {
        
        star5.isSelected = !star5.isSelected
        if (star5.isSelected == true){
            star1.isSelected = true
            star2.isSelected = true
            star3.isSelected = true
            star4.isSelected = true
        }
//star5.setImage(UIImage(named: "star_filled"), for: .normal)
    }
}

extension UIApplication {
    var icon: UIImage? {
        guard let iconsDictionary = Bundle.main.infoDictionary?["CFBundleIcons"] as? NSDictionary,
            let primaryIconsDictionary = iconsDictionary["CFBundlePrimaryIcon"] as? NSDictionary,
            let iconFiles = primaryIconsDictionary["CFBundleIconFiles"] as? NSArray,
            // First will be smallest for the device class, last will be the largest for device class
            let lastIcon = iconFiles.lastObject as? String,
            let icon = UIImage(named: lastIcon) else {
                return nil
        }
        
        return icon
    }
}



    

