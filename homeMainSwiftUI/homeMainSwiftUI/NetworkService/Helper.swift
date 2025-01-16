//
//  Helper.swift
//  homeMainSwiftUI
//
//  Created by Ильяс Альфатович on 16.01.2025.
//
import Foundation

final class Helper {
    static func getDate(date: Double) -> String {
        let currentDate = Date(timeIntervalSince1970: date)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY MMMM dd"
        dateFormatter.locale = Locale(identifier: "ru-ru")
        return dateFormatter.string(from: currentDate)
    }
}
