//
//  AppDelegate.swift
//  BusBusterDemo
//
//  Created by Bob on 13.11.2020.
//  Copyright © 2020 Bob. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

		notificationCenter.requestAuthorization(options: [.alert,.sound, .badge]) { (granted, error) in

            guard granted else { return }
            notificationCenter.getNotificationSettings { (settings) in
                print(settings)
                guard settings.authorizationStatus == .authorized else { return }
            }
        }

        notificationCenter.delegate = self
		return true
	}


	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}
}

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .sound])
        print(#function)
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print(#function)
    }

}

func sendNotificationStart() {

	let content = UNMutableNotificationContent()
	content.title = "Bus Booster"
	content.body = "Автобус вышел на маршрут"
	content.sound = UNNotificationSound.default

	let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)

	let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
	notificationCenter.add(request) { (error) in
		print(error?.localizedDescription)
	}
}

func sendNotificationsCancel() {

	let content = UNMutableNotificationContent()
	content.title = "Bus Booster"
	content.body = "Турист отменил экскурсию"
	content.sound = UNNotificationSound.default

	let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)

	let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
	notificationCenter.add(request) { (error) in
		print(error?.localizedDescription)
	}
}

func sendNotificationsStop20() {

	let content = UNMutableNotificationContent()
	content.title = "Bus Booster"
	content.body = "Остановка 20 минут"
	content.sound = UNNotificationSound.default

	let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)

	let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
	notificationCenter.add(request) { (error) in
		print(error?.localizedDescription)
	}
}

func sendNotificationsStop40() {

	let content = UNMutableNotificationContent()
	content.title = "Bus Booster"
	content.body = "Остановка 40 минут"
	content.sound = UNNotificationSound.default

	let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 0.5, repeats: false)

	let request = UNNotificationRequest(identifier: "notification", content: content, trigger: trigger)
	notificationCenter.add(request) { (error) in
		print(error?.localizedDescription)
	}
}



