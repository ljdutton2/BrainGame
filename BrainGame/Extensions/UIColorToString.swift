//
//  UIColorToString.swift
//  BrainGame
//
//  Created by Lauren Dutton on 3/3/20.
//  Copyright © 2020 Lauren Dutton. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    var name: String? {
        switch self {
        case UIColor.black: return "black"
        case UIColor.brown: return "brown"
        case UIColor.blue: return "blue"
        case UIColor.green: return "green"
        case UIColor.yellow: return "yellow"
        case UIColor.orange: return "orange"
        case UIColor.red: return "red"
        default: return nil
        }
    }
}

extension ViewController.Color {
    var name: String? {
        switch self {
        case .black: return "black"
        case .brown: return "brown"
        case .blue: return "blue"
        case .green: return "green"
        case .yellow: return "yellow"
        case .orange: return "orange"
        case .red: return "red"
        case .purple: return "purple"
        default: return nil
        }
    }
}
