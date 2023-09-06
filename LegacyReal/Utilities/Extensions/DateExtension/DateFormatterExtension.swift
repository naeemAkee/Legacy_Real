//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

extension DateFormatter {

    //WF2, API-1, startDate and endDate
    static let MMDDYYYY = formatter(format: "MM/dd/yyyy")

    static let MMddyy = formatter(format: "MM/dd/yy")

    static let yyyyMMdd = formatter(format: "yyyy MM dd")

    //Start date and End date format, WF-2 API-1
    static let yyyyMMddWithDash = formatter(format: "yyyy-MM-dd")
    //used in JSA Document's URL
    static let MMddyyyyWithDash = formatter(format: "MM-dd-yyyy")

    //API-1, WF-2
    //checkin date, checkout date
    static let mmddyyTime12Hours = formatter(format: "MM/dd/yy hh:mm a")

    //API-2, WF-2
    //checkin date, checkout date
    static let mmddyyyyTime12Hours = formatter(format: "MM/dd/yyyy hh:mm a")

    //API-2, WF-2
    //checkin time, checkout time
    static let hmma = formatter(format: "hh:mm a")

    //for napkinHours, WF2
    static let hhmm = formatter(format: "HH:mm")

    //Month and Year format - Calendar Popover
    static let MMMM = formatter(format: "MMMM")
    static let monthYYYY = formatter(format: "MMMM yyyy")

    // Date format without time. shown with job task assignment
    static let monthddyyyy = formatter(format: "MMMM dd, yyyy")

    static let dayOnly = formatter(format: "EEEE")

    //WF-1, Date column of View & Assign Task
    static let MMMddyyyy = formatter(format: "MMM dd, yyyy")
    //date range label, View & Assign Task
    static let MMMdd = formatter(format: "MMM dd")

    //WF-10, Date range for Delivery Schedule's file name
    static let MMDDYYYYWithoutSlash = formatter(format: "MMddyyyy")

    //WF-16
    //RFI History
    static let mmddyyyyTime12HourswithSeconds = formatter(format: "MM/dd/yyyy hh:mm:ss a")
    static let mmddyyyyTime12HourswithMilliSeconds = formatter(format: "MM/dd/yyyy hh:mm:ss.SS a")

    private static func formatter(format: String) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format

        // Setting locale, so that when user changes date/time format in the device, it does not effect our formatting
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }
}
