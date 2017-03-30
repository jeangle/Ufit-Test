//
//  DesignView.swift
//  Ufit-Test01
//
//  Created by Yuri on 3/27/17.
//  Copyright © 2017 JSD. All rights reserved.
//

import UIKit

@IBDesignable class DesignView: UIView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
