//
//  UIColorAsRawValue.swift
//  BrainGame
//
//  Created by Lauren Dutton on 3/3/20.
//  Copyright © 2020 Lauren Dutton. All rights reserved.
//

import Foundation
import UIKit

extension ViewController.Color: RawRepresentable {
    
    typealias RawValue = UIColor

    init?(rawValue:UIColor) {
        switch rawValue {
        case UIColor.red: self = .red
        case UIColor.green: self = .green
        case UIColor.blue:self = .blue
        default: return nil
        }
    }
 
    var rawValue: UIColor {
        switch self {
        case .red: return UIColor.red
        case .orange: return UIColor.orange
        case .yellow: return UIColor.yellow
        case .green: return UIColor.green
        case .blue: return UIColor.blue
        case .purple: return UIColor.purple
        case .brown: return UIColor.brown
        case .black: return UIColor.black
        }
    }
    
}

