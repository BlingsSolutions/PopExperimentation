//
//  ButtonAnimationViewController.swift
//  PopExperimentation
//
//  Created by William Archimede on 22/10/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit

class ButtonAnimationViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func animateScaleToFatWhenTouchDown(sender: AnyObject) {
        let scaleAnimation: POPBasicAnimation = POPBasicAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.toValue = NSValue(CGSize: CGSizeMake(CGFloat(1.05), CGFloat(1.05)))
        
        sender.layer?.pop_addAnimation(scaleAnimation, forKey: "scaleToFatWhenTouchDownAnimation")
    }

    @IBAction func animateScaleWithSpringToDefaultWhenTouchUpInside(sender: AnyObject) {
        let scaleSpringAnimation: POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        
        let oneInCGFLoat: CGFloat = CGFloat(1.0)
        let threeInCGFloat: CGFloat = CGFloat(3.0)
        
        scaleSpringAnimation.toValue = NSValue(CGSize: CGSizeMake(oneInCGFLoat, oneInCGFLoat))
        scaleSpringAnimation.velocity = NSValue(CGSize: CGSizeMake(threeInCGFloat, threeInCGFloat))
        scaleSpringAnimation.springBounciness = CGFloat(18.0)
        
        sender.layer?.pop_addAnimation(scaleSpringAnimation, forKey: "scaleSpringToDefaultWhenTouchUpInsideAnimation")
    }
    
    
    @IBAction func animateShakeAfterDelayWhenTouchUpInside(sender: AnyObject) {
        
        let shakeAnimation: POPSpringAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionX)
        
        shakeAnimation.velocity = 2000
        shakeAnimation.springBounciness = CGFloat(20.0)
        shakeAnimation.beginTime = CACurrentMediaTime() + 1
        
        sender.layer?.pop_addAnimation(shakeAnimation, forKey: "shakeAfterDelayWhenTouchUpInsideAnimation")
    }
}
