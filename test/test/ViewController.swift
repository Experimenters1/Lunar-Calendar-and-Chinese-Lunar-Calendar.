//
//  ViewController.swift
//  test
//
//  Created by Huy Vu on 1/31/24.
//

import UIKit

class ViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Thực hiện tính toán lịch âm và lịch dương khi ViewController được load
                let gregorianDate = Date()
                let lunarDate = convertToLunarDate(gregorianDate: gregorianDate)

                print("Gregorian Date: \(gregorianDate)")
                print("Lunar Date: Year \(lunarDate.year), Month \(lunarDate.month), Day \(lunarDate.day)")

                // Convert back to Gregorian date
                if let convertedGregorianDate = convertToGregorianDate(lunarDate: lunarDate) {
                    print("Converted back to Gregorian Date: \(convertedGregorianDate)")
                } else {
                    print("Failed to convert back to Gregorian Date.")
                }
    }

    func convertToLunarDate(gregorianDate: Date) -> LunarDate {
        let lunarCalendar = Calendar(identifier: .chinese)
        let components = lunarCalendar.dateComponents([.year, .month, .day], from: gregorianDate)
        
        return LunarDate(year: components.year!, month: components.month!, day: components.day!)
    }

    func convertToGregorianDate(lunarDate: LunarDate) -> Date? {
        var components = DateComponents()
        components.year = lunarDate.year
        components.month = lunarDate.month
        components.day = lunarDate.day
        
        let lunarCalendar = Calendar(identifier: .chinese)
        return lunarCalendar.date(from: components)
    }
}

