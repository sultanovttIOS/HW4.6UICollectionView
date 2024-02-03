//
//  MakerView.swift
//  HW4.6UICollectionView
//
//  Created by Alisher Sultanov on 31/1/24.
//

import UIKit
import SnapKit

class MakerView {
    
    static let shared = MakerView()
    
    func makerLabel(text: String? = nil,
                    font: UIFont,
                    textColor: UIColor,
                    textAlignment: NSTextAlignment = .left,
                    numberOfLines: Int) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = numberOfLines
        return label
    }
    
    func makerImageView(imageName: String? = nil,
                        cornerRadius: CGFloat,
                        clipsToBounds: Bool = true,
                        contentMode: UIView.ContentMode = .scaleAspectFill) -> UIImageView {
        let imageView = UIImageView()
        
        if let imageName = imageName {
            imageView.image = UIImage(named: imageName)
        }
        
        imageView.layer.cornerRadius = cornerRadius
        imageView.clipsToBounds = clipsToBounds
        imageView.contentMode = contentMode
        
        return imageView
    }
    
    func makerButton(title: String? = nil,
                     for state: UIControl.State = .normal,
                     imageName: String? = nil,
                     tintColor: UIColor,
                     backgroundColor: UIColor,
                     cornerRadius: CGFloat) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: state)
        button.setImage(imageName != nil ? UIImage(named: imageName!) : nil, for: .normal)
        button.tintColor = tintColor
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        return button
    }
}
