//
//  ViewController.swift
//  Notification
//
//  Created by 박준영 on 2021/11/11.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request()
//        registCategories()
    }
    
    func request(){
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.requestAuthorization(options: [.alert,.sound,.badge]) { (gratned, Error) in
            if let error = Error {
                print(error)
            }else{
                if gratned {
//                    let content = UNMutableNotificationContent()
//                    content.title = "This is title"
//                    content.subtitle = "This is subtitle"
//                    content.body = "This is body"
//                    content.badge = 1
//
//                    let trigger =  UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
//                    let request = UNNotificationRequest(identifier: "Sample", content: content, trigger: trigger)
//
//                    notificationCenter.add(request, withCompletionHandler: nil)

                }else{
                    print("Not granted")
                }
                    
            }
        }
    }
//
//    func registCategories(){
//        let acceptAction = UNNotificationAction(identifier: "ACCEPT_ACTION",
//              title: "Accept",
//              options: UNNotificationActionOptions(rawValue: 0))
//        let declineAction = UNNotificationAction(identifier: "DECLINE_ACTION",
//              title: "Decline",
//              options: UNNotificationActionOptions(rawValue: 0))
//        // Define the notification type
//        let meetingInviteCategory =
//              UNNotificationCategory(identifier: "MEETING_INVITATION",
//                                     actions: [acceptAction, declineAction],
//              intentIdentifiers: [],
//              hiddenPreviewsBodyPlaceholder: "",
//              options: .customDismissAction)
//        // Register the notification type.
//        let notificationCenter = UNUserNotificationCenter.current()
//        notificationCenter.setNotificationCategories([meetingInviteCategory])
//    }
//
    
    
//    func createContent(){
//        let content = UNMutableNotificationContent()
//        content.title = "Weekly Staff Meeting"
//        content.body = "Every Tuesday at 2pm"
//        content.userInfo = ["MEETING_ID" : meetingID,
//                            "USER_ID" : userID ]
//        content.categoryIdentifier = "MEETING_INVITATION"
//    }
//    func userNotificationCenter(_ center: UNUserNotificationCenter,
//           didReceive response: UNNotificationResponse,
//           withCompletionHandler completionHandler:
//             @escaping () -> Void) {
//
//       // Get the meeting ID from the original notification.
//       let userInfo = response.notification.request.content.userInfo
//       let meetingID = userInfo["MEETING_ID"] as! String
//       let userID = userInfo["USER_ID"] as! String
//
//       // Perform the task associated with the action.
//       switch response.actionIdentifier {
//       case "ACCEPT_ACTION":
//          sharedMeetingManager.acceptMeeting(user: userID,
//                                        meetingID: meetingID)
//          break
//
//       case "DECLINE_ACTION":
//          sharedMeetingManager.declineMeeting(user: userID,
//                                         meetingID: meetingID)
//          break
//
//       // Handle other actions…
//
//       default:
//          break
//       }
//
//       // Always call the completion handler when done.
//       completionHandler()
//    }
//
}


