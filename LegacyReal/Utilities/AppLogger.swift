//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation
import UIKit

class AppLogger {

    class func log(_ data: Any?) {
        DispatchQueue.global(qos: .background).async {
            writeLog(data: data)
        }
    }

    private class func writeLog(data: Any?) {
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let uuid = UIDevice.current.identifierForVendor?.uuidString
            let fileName = "\(Strings.Common.bundleName)-App-Logs(\(uuid.orDash)).txt"
            let fileURL = dir.appendingPathComponent(fileName)

            if FileManager.default.fileExists(atPath: fileURL.path) {
                var logValue = " \n \n==================================\n"
                logValue += "**** \(Date().formatAsMMddyyyyTime12HourswithSeconds()) **** \n"
                if data != nil {
                    logValue += String(describing: data!)
                }
                print(logValue)
            } else {
                // file does not exist, create a new file and write to file
                do {
                    try String(describing: data).write(to: fileURL, atomically: true, encoding: .utf8)
                } catch {
                    print("Unable to write content to file")
                }
            }
        }
    }
}
