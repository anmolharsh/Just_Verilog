//
//  Caching.swift
//  SearchResult
//
//  Created by Mayank Pawar on 26/09/20.
//  Copyright © 2020 MoneyTap. All rights reserved.
//

import Foundation
import UIKit

let imageCache = ImageCache()

/// Utility class for caching image
class ImageCache: NSCache<AnyObject, AnyObject> {
    
    ///Add new downloaded image
    func addImage(_ image: UIImage, key: String) {
        setObject(image, forKey: key as AnyObject)
    }
    
    ///Get image if already present
    func getImage(forKey key: String) -> UIImage? {
        guard let image = object(forKey: key as AnyObject) as? UIImage else {
            return nil
        }
        return image
    }
}
