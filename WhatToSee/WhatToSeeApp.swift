//
//  WhatToSeeApp.swift
//  WhatToSee
//
//  Created by Andres Aleu on 16/8/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


@main
struct WhatToSeeApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LoginView(viewModel: LoginViewModel(), viewModelHome: HomeViewModel())
            //HomeView(viewModel: HomeViewModel())
        }
    }
}
