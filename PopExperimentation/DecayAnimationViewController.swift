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
        viewToAnimate.layer.cornerRadius = viewToAnimate.frame.size.width / 2
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setupViewToAnimate()
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        viewToAnimate.layer.pop_removeAllAnimations()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupViewToAnimate() {
        let panRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
        
        
        viewToAnimate.addGestureRecognizer(panRecognizer)
    }
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation: CGPoint = recognizer.translationInView(view)
        recognizer.view?.center = CGPointMake(recognizer.view!.center.x + translation.x,
            recognizer.view!.center.y + translation.y)
        recognizer.setTranslation(CGPointMake(0, 0), inView: view)
        
        if (recognizer.state == UIGestureRecognizerState.Ended) {
            let velocity: CGPoint = recognizer.velocityInView(view)
            
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
        let isViewToAnimateOutsideOfSuperView: Bool = !CGRectContainsRect(view.frame, viewToAnimate.frame)
        
        if (isViewToAnimateOutsideOfSuperView) {
            viewToAnimate.layer.pop_removeAllAnimations()
            let decayAnim = anim as! POPDecayAnimation
            let currentVelocity = decayAnim.velocity!.CGPointValue
            let velocity = CGPoint(x: -currentVelocity.x, y: -currentVelocity.y)
            decayAnim.velocity = NSValue(CGPoint: velocity)
            viewToAnimate.layer.pop_addAnimation(decayAnim, forKey: "backToCenterPositionAnimation")
        }
    }
    
}
