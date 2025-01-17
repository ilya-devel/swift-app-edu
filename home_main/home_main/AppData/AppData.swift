//
//  AppData.swift
//  home_main
//
//  Created by Ильяс Альфатович on 11.01.2025.
//

import UIKit

final class AppData {
    static var appID = "52910572"
    
    static var currentTheme: ColorTheme = SepiaTheme()
    
    static func setCurrentTheme(color: ColorsForTheme) {
        switch color {
        case .light: self.currentTheme = LightTheme()
        case .dark: self.currentTheme = DarkTheme()
        case .sepia: self.currentTheme = SepiaTheme()
        }
    }
}
