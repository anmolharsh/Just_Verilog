//
//  UIFontExtension.swift
//  BlibliMobile-iOS
//
//  Created by Nathaniel Putera on 18/12/19.
//  Copyright © 2019 Global Digital Niaga, PT. All rights reserved.
//

import Foundation

extension UIFont {
    
    func calculateHeight(text: String, width: CGFloat) -> CGFloat {
        let constraintRect = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let boundingBox = text.boundingRect(with: constraintRect,
                                        options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                        attributes: [NSAttributedString.Key.font: self],
                                        context: nil)
        return boundingBox.height
    }
}
