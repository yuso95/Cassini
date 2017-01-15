//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Younoussa Ousmane Abdou on 1/14/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {
        
    @IBAction func showImage(sender: UIButton) {
        
        // Comeback here later
        if let imageVC = splitViewController?.viewControllers.last as? ImageViewController {
            
            let imageName = sender.currentTitle
            imageVC.imageURL = DemoURL.GettingTheURL(imageName: imageName) as? URL
            imageVC.title = imageName
        } else {
            
            performSegue(withIdentifier: StoryBoard.storyBoardSegueIdentifier, sender: sender)
        }
    }
    
    private struct StoryBoard {
    
        static let storyBoardSegueIdentifier = "Show Image"
    }

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == StoryBoard.storyBoardSegueIdentifier {
            if let ImageVC = segue.destination.contentViewController as? ImageViewController {
                
                    let imageName = (sender as? UIButton)?.currentTitle
                    ImageVC.imageURL = DemoURL.GettingTheURL(imageName: imageName) as? URL
                    ImageVC.title = imageName
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        splitViewController?.delegate = self
    }
    
    // Here too
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        if primaryViewController.contentViewController == self {
            if let imageVC = secondaryViewController.contentViewController as? ImageViewController, imageVC.imageURL == nil {
                
                return true
            }
        }
        
        return false
    }
}

extension UIViewController {
    
    var contentViewController: UIViewController {
        if let navCon = self as? UINavigationController {
            
            return navCon.visibleViewController ?? self
        } else {
            
            return self
        }
    }
}
