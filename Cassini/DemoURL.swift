//
//  DemoURL.swift
//  Cassini
//
//  Created by Younoussa Ousmane Abdou on 1/13/17.
//  Copyright © 2017 Younoussa Ousmane Abdou. All rights reserved.
//

import Foundation

struct DemoURL {
    
    static let StanfordURL = "https://static1.squarespace.com/static/574bf85e3c44d8bd12ba29d6/t/57fd5aeae58c628485b8edea/1476221677355/stanford.jpg?format=1500w"
    
    static let NASAImages = [
        "Earth": "https://i.ytimg.com/vi/hp1V3BsBQHU/maxresdefault.jpg",
        "Juno": "http://www.jpl.nasa.gov/images/juno/20160113/PIA13746-16.jpg",
        "Cassini": "http://www.jpl.nasa.gov/missions/web/cassini.jpg",
        
        ]
    
    static func GettingTheURL(imageName: String?) -> NSURL? {
        
        if let urlString = NASAImages[imageName ?? ""] {
            
            return NSURL(string: urlString)
        } else {
            
            return nil
        }
    }
}
