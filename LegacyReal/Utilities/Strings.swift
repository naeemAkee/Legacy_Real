//
//  AppDelegate.swift
//  LegacyReal
//
//  Created by Abdul Qadar on 9/5/23.
//

import Foundation

struct Strings {

    struct Button {
        static let okay = "OK"
        static let cancel = "Cancel"
        static let delete = "Delete"

    }

    struct Common {
        
        static let bundleName = "Legacy Real"
        static let success = "Success"
        static let info = "Info"
        static let dataSuccessfullyUpdated = "Saved successfully."
        static let jobManagement = "Job Management"
        static let print = "Print"
    }

    struct Errors {
        static let error = "Error"
        static let warning = "Warning"
        static let tryAgain = "Please try again"
        static let somethingWentWrong = "Something went wrong. Please try again."
        static let checkInternet = "Please check the Internet connection and try again."
        static let noControllerWithIdentifier = "No view controller found with that identifier"
        static let navigationControllerNil = "navigation controller is nil"
        static let configFileNotFound = " file NOT FOUND - Please check your project configuration"
        static let errorLoadingData = "Error loading data"
    }

    struct DateFormats {
        static let mmddyyyy = "MM/dd/yyyy"
        static let mmddyyyyTime12Hours = "MM/dd/yyyy hh:mm a"
        static let mmddyyyyTime12HourswithMilliSeconds = "MM/dd/yyyy hh:mm:ss.SS a"
        static let hhmm = "HH:mm"
        static let hhmma = "hh:mm a"
        static let monthYYYY = "MMMM yyyy"
        static let time24HourswithMilliSeconds = "HH:mm:ss.SSS"
    }

    struct Alerts {
        static let areYouSure = "Are you sure?"
        static let undoCheckInOutTitle = "Are you sure you want to clear the %@ for %@?"
        static let succeedToDeactivateOffline = "Offline mode deactivated successfully. You are back to online mode now, however you may not see the data that you added/updated while you were in offline mode. It may take some time to view the updated data."
        static let undoCheckInOutMessage = "This action cannot be undone."
        static let irreversable = "This action is irreversible."
        static let logoutConfirmation = "After logging out you can login via USIS ALM only."
        static let logoutInOfflineModeConfirmation = "If you logout in offline, you will lose the data you have updated or created in offline. After logging out you can login via USIS ALM only."
        static let deactivateOfflineConfirmation = "This action will take the app to online mode. Your local changes will be synced with server. This can take some time"
        static let deleteBundleTask = "This action will delete Roughin/Finishing Bundle"
        static let spliceTerminateTaskCreatedSuccessfully = "Splice/Terminate task created successfully."
        static let removeAllTools = "This action will delete all items from list and redirect you to previous screen"
        static let notSupportedInOffline = "This action is not supported while you are in Offline Mode"
        static let eodNotSupportedForOfflineAssignments = "EOD not supported for assignments created in offline mode."
        static var failedToDeactivateOffline = "Failed to deactivate the offline mode. Following data is not synced. However you can choose to discard this data and go back to online mode \n "
        static let ticketWillBeCancelled = "Are you sure you want to cancel Field Work Ticket: %@?\nThis action cannot be undone."
        static let requestWillBeDeleted = "Request will be deleted."
        static let signShouldMatchAuthorizedBy = "Signature should match the Authorized By name."
        static let signShouldMatchAcceptedBy = "Signature should match the Accepted By name."
        static let fileSuccessfullyExported = "File has successfully been exported."
        static let toolboxTalkCreated = "Toolbox Talk created successfully."
        static let toolboxTalkUpdated = "Toolbox Talk updated successfully."
        static let materialRequestCreated = "Materials request successfully placed."
        static let bundleDeletedSuccessfully = "Roughin/Finishing Bundle deleted successfully."
        static let oshaSheetWillBeDeleted = "OSHA Tracking Sheet will be deleted."
        static let confirmUnassignTasks = "Are you sure you want to delete the selected Task Assignment? This will remove the entire Task Assignment, including all Crew."
        static let toolNotAllowedToCheckOut = "Tool cannot be checked out because Tool Condition = "
        static let attachmentsLimit = "Maximum 10 attachments are allowed."
        static let successfullyUpdatedQuestionnaire = "Successfully updated COVID-19 questionnaire."
        static let notAllowedToSign = "Not Allowed to Sign"
        static let mandatoryQuestionnaireNotFilled = "Safety Precaution Questions must be completed to Check In or Check Out."
        static let areYouSureToUpdateRfi = "Are you sure you want to update the RFI?"
        static let rfiFieldsToBeCleared = "The following field(s) will be cleared: \n Resolution, Resolution Date"
        static let exceedHourslimit = "Hours cannot be greater than %@."
        static let loaderPrimaryMessage = "Please wait"
        static let loaderSecondaryMessage = "This might take a while."
    }

    struct TabBar {
        static let dashBoard = "Dashboard"
        static let notifications = "Notifications"
        static let settings = "Settings"
    }
}
