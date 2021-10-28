//
//  ImageDownloader.swift
//  SearchResult
//
//  Created by Akanksha Kumari on 26/09/20.
//  Copyright © 2020. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader: NSObject {
    
    static let sharedInstance = ImageDownloader()
    
    ///Download image from server and save as cache
    func getImage(fromUrl urlStringurl: String, completion: @escaping (UIImage) -> ()) {
        if let image = imageCache.getImage(forKey: urlStringurl) {
            completion(image)
        }
        else {
            if let url = URL(string: urlStringurl) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if error != nil {
                        return
                    }
                    if let data = data, let image = UIImage(data: data) {
                        imageCache.addImage(image, key: urlStringurl)
                        completion(image)
                    }
                }.resume()
            }
        }
    }
}
