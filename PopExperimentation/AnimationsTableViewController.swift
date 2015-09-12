//
//  AnimationsTableViewController.swift
//  PopExperimentation
//
//  Created by William Archimede on 22/10/2014.
//  Copyright (c) 2014 HoodBrains. All rights reserved.
//

import UIKit

class AnimationsTableViewController: UITableViewController {

    let animationNames: [String] = ["Button Animation", "Decay Animation", "Circle Animation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return animationNames.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("AnimationCell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = animationNames[indexPath.row]

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            performSegueWithIdentifier("ButtonAnimationSegue", sender: nil)
        case 1:
            performSegueWithIdentifier("DecayAnimationSegue", sender: nil)
        case 2:
            performSegueWithIdentifier("CircleAnimationSegue", sender: nil)
        default:
            break
        }
        
    }
    
}
