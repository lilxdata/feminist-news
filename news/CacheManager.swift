//
//  CacheManager.swift
//  news
//
//  Created by madi on 4/28/20.
//  Copyright © 2020 madi. All rights reserved.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String : Data]()
    static func saveData(_ url: String, _ imageData: Data) {
        
        //save image data along with URL
        
        imageDictionary[url] = imageData
        
    }
    
    static func retrieveData( _ url: String) -> Data? {
        // return saved image data or nil
          return imageDictionary[url]
    }
}
