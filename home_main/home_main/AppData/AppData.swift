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

protocol ColorTheme {
    var background: UIColor {get}
    var fontColor: UIColor {get}
    var btnBackground: UIColor {get}
    var title: String {get}
}

struct LightTheme: ColorTheme {
    var background = UIColor(ciColor: .white)
    var fontColor = UIColor(ciColor: .black)
    var btnBackground = UIColor(ciColor: .cyan)
    var title = "light"
}

struct DarkTheme: ColorTheme {
    var background = UIColor(ciColor: .black)
    var fontColor = UIColor(ciColor: .white)
    var btnBackground = UIColor(ciColor: .gray)
    var title = "dark"
}

struct SepiaTheme: ColorTheme {
    var background = UIColor(ciColor: .init(red: 255/255, green: 153/255, blue: 51/255))
    var fontColor = UIColor(ciColor: .black)
    var btnBackground = UIColor(ciColor: .init(red: 255/255, green: 204/255, blue: 153/255))
    var title = "sepia"
}

enum ColorsForTheme {
    case light
    case dark
    case sepia
}
