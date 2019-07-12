//
//  StarFilling.swift
//  CustomDialogApp
//
//  Created by fkahraman on 12.07.2019.
//  Copyright © 2019 fkahraman. All rights reserved.
//

import UIKit

class StarFilling: UIView {

    override init (frame : CGRect)
    {
        super.init(frame : frame)
        initStar()
    }
    
    convenience init ()
    {
        self.init(frame:CGRect.zero)
        
    }
    
    required init?(coder aDecoder: NSCoder){
        
        super.init(coder: aDecoder)
        initStar()
    }
    
    func initStar()
    {
        let filledStarImage = UIImage(named: "star_filled")
        let emptyStarImage = UIImage(named: "star_empty")
        
        let button = UIButton(frame: CGRect(x: 300, y: 100, width: 100, height: 60))
        
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(fillingStar), for: UIControl.Event.touchUpInside)
        //button.addTarget(self, action: #selector(fillingStar(_:)), for: UIControl.Event.TouchUpInside)
        button.setImage(emptyStarImage, for: .normal)
        button.setImage(filledStarImage, for: .selected)
        
        addSubview(button)
    }
    // MARK: Button Action
    @objc func fillingStar(sender : UIButton)
    {
        sender.isSelected = !sender.isSelected
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for view in subviews
        {
            view.touchesBegan(touches, with: event)
        }
    }
   
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool
    {
        return true
    }

}
