////
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

extension Date {

    func removeTimeStamp() -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day], from: self)) else {
            return self
        }
        return date
    }

    func byDroppingSeconds() -> Date {
        guard let date = Calendar.current.date(from: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: self)) else {
            return self
        }
        return date
    }

    func startOfDay() -> Date {
        return Calendar.current.startOfDay(for: self)
    }

    func isPastDate() -> Bool {
        return self.startOfDay() < Date().startOfDay()
    }

    func isFutureDate() -> Bool {
        return self.startOfDay() > Date().startOfDay()
    }

    func endOfDay() -> Date {
        let calendar = Calendar.current
        if let nextDay = calendar.date(byAdding: .day, value: 1, to: self) {
            let nextDayStartOfDay = calendar.startOfDay(for: nextDay)
            return calendar.date(byAdding: .second, value: -1, to: nextDayStartOfDay) ?? nextDayStartOfDay
        }
        return self
    }

    func weekDay() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }

    func isTodaysDate() -> Bool {
        return Calendar.current.isDateInToday(self)
    }

    func isYesterdaysDate() -> Bool {
        return Calendar.current.isDateInYesterday(self)
    }

    func minutesFrom(_ date: Date) -> Int {
        return Int(self.timeIntervalSince(date)/60)
    }

    func hoursFrom(_ date: Date) -> Float {
        return Float(self.timeIntervalSince(date)/3600)
    }
}
