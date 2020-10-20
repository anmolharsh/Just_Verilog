//
//  UIImageview+Extension.swift
//  SearchResult
//
//  Created by Mayank Pawar on 26/09/20.
//  Copyright © 2020 MoneyTap. All rights reserved.
//

import Foundation
import UIKit

///Extension to directly downlaod image and show in imageView
extension UIImageView {
    func setImage(fromUrl url: String?, contentMode mode: UIView.ContentMode = .scaleToFill) {
        contentMode = mode
        self.image = UIImage(named: "")
        if let url = url {
            ImageDownloader.sharedInstance.getImage(fromUrl: url) { (image) in
                DispatchQueue.main.async {
                    self.image = image
                }
            }
        }
    }
}
