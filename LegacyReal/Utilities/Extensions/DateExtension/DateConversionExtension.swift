//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

extension Date {

    func formatAsyyyyMMdd() -> String {
        return DateFormatter.yyyyMMdd.string(from: self)
    }

    //Calendar popover
    func formatAsMMMM() -> String {
        return DateFormatter.MMMM.string(from: self)
    }

    func formatAsMonthYYYY() -> String {
        return DateFormatter.monthYYYY.string(from: self)
    }

    func formatAsyyyyMMddWithDash() -> String {
        return DateFormatter.yyyyMMddWithDash.string(from: self)
    }

    func formatAsMMddyyyyWithDash() -> String {
        return DateFormatter.MMddyyyyWithDash.string(from: self)
    }

    //WF2, API1, startDate and endDate
    func formatAsMMddyyyy() -> String {
        return DateFormatter.MMDDYYYY.string(from: self)
    }

    func formatAsMMddyyTime12Hours() -> String {
        return DateFormatter.mmddyyTime12Hours.string(from: self)
    }

    //API2, WF2
    //Checkin date, checkout date
    func formatAsMMddyyyyTime12Hours() -> String {
        return DateFormatter.mmddyyyyTime12Hours.string(from: self)
    }

    func formatAsMMddyyyyTime12HourswithSeconds() -> String {
        return DateFormatter.mmddyyyyTime12HourswithSeconds.string(from: self)
    }

    func formatAshmma() -> String {
        return DateFormatter.hmma.string(from: self)
    }

    func formatAsMonthddyyyy() -> String {
        return DateFormatter.monthddyyyy.string(from: self)
    }

    func formatAsFullDayName() -> String {
        return DateFormatter.dayOnly.string(from: self)
    }

    //WF-1, Date column of View & Assign Task
    func formatAsMMMddyyyy() -> String {
        return DateFormatter.MMMddyyyy.string(from: self)
    }

    func formatAsMMddyy() -> String {
        return DateFormatter.MMddyy.string(from: self)
    }

    //WF-1, Date range label of View & Assign Task
    func formatAsMMMdd() -> String {
        return DateFormatter.MMMdd.string(from: self)
    }

    //WF-10, Date range for Delivery Schedule's file name
    func formatAsMMDDYYYYWithoutSlash() -> String {
        return DateFormatter.MMDDYYYYWithoutSlash.string(from: self)
    }

    static func dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate

        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }

    // WF-19, For DaysToExpiration
    // Get difference between 2 dates
    func interval(of component: Calendar.Component, from date: Date) -> Int {
        let calendar = Calendar.current
        guard let start = calendar.ordinality(of: component, in: .era, for: date) else { return 0 }
        guard let end = calendar.ordinality(of: component, in: .era, for: self) else { return 0 }

        return end - start
    }

    func days(from date: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
    }

    // Add some hours to a date with given formate and return final date
    func calculateEndDateTime(dateFormate: String = Strings.DateFormats.mmddyyyyTime12Hours, startDate: Date, scheduleHours: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormate

        var dateComponents = DateComponents()
        if let napkinHours = Double(scheduleHours) {
            //get the decimal first part
            let hours = Int(napkinHours.rounded(.towardZero))
            dateComponents.hour = hours
        }
        //get the decimal part just.
        if let napkinMinutes = Double(scheduleHours)?.truncatingRemainder(dividingBy: 1) {
            dateComponents.minute = Int(napkinMinutes * 60)
        }

        let calendar = Calendar.current
        let endDate = calendar.date(byAdding: dateComponents, to: startDate)
        return dateFormatter.string(from: endDate!)
    }
}
