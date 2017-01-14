//
//  ImageViewController.swift
//  Cassini
//
//  Created by Younoussa Ousmane Abdou on 1/13/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView! {
        
        didSet {
            
            scrollView.contentSize = imageView.frame.size
        }
    }
    
    private var imageURL: URL? {
        didSet {
            
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage() {
        
        if let url = imageURL {
            if let imageData = NSData(contentsOf: url) {
                
                image = UIImage(data: imageData as Data)
            }
        }
    }
    
    private var imageView = UIImageView()

    private var image: UIImage? {
        get {
        
            return imageView.image
        }
        set {
            
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.addSubview(imageView)
        imageURL = NSURL(string: DemoURL.stanfordURL) as URL?
    }

}
