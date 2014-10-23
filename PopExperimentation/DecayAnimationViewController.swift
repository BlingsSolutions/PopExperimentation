//
//  DecayAnimationViewController.swift
//  PopExperimentation
//
//  Created by William Archimede on 23/10/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit

class DecayAnimationViewController: UIViewController, POPAnimationDelegate {

    @IBOutlet weak var viewToAnimate: UIControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setupViewToAnimate()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.viewToAnimate.layer.pop_removeAllAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupViewToAnimate() {
        let panRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
        
        self.viewToAnimate.layer.cornerRadius = self.viewToAnimate.frame.size.width / 2
        self.viewToAnimate.addGestureRecognizer(panRecognizer)
    }
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation: CGPoint = recognizer.translationInView(self.view)
        recognizer.view?.center = CGPointMake(recognizer.view!.center.x + translation.x,
            recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPointMake(0, 0), inView: self.view)
        
        if (recognizer.state == UIGestureRecognizerState.Ended) {
            let velocity: CGPoint = recognizer.velocityInView(self.view)
            
            let positionDecayAnimation: POPDecayAnimation = POPDecayAnimation(propertyNamed: kPOPLayerPosition)
            positionDecayAnimation.velocity = NSValue(CGPoint: velocity)
            positionDecayAnimation.delegate = self
            recognizer.view?.layer.pop_addAnimation(positionDecayAnimation, forKey: "positionDecayAnimation")
        }
    }
    
    @IBAction func removeAnimationsWhenTouchDown(sender: AnyObject) {
        sender.layer?.pop_removeAllAnimations()
    }
    
    // MARK: - POPAnimationDelegate
    
    func pop_animationDidApply(anim: POPAnimation!) {
        let isViewToAnimateOutsideOfSuperView: Bool = !CGRectContainsRect(self.view.frame, self.viewToAnimate.frame)
        
        if (isViewToAnimateOutsideOfSuperView) {
            self.viewToAnimate.layer.pop_removeAllAnimations()
            let decayAnim: POPDecayAnimation = anim as POPDecayAnimation
            let currentVelocity: CGPoint = decayAnim.velocity!.CGPointValue()
            let velocity: CGPoint = CGPointMake(-currentVelocity.x, -currentVelocity.y)
            decayAnim.velocity = NSValue(CGPoint: velocity)
            self.viewToAnimate.layer.pop_addAnimation(decayAnim, forKey: "backToCenterPositionAnimation")
        }
    }
    
}
