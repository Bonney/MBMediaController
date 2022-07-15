//
//  MBMediaControllerApp.swift
//  MBMediaController
//
//  Created by Matt Bonney on 7/14/22.
//

import SwiftUI

@main
struct MBMediaControllerApp: App {
    @StateObject private var mediaController = MediaController()

    var body: some Scene {
        WindowGroup {
            MinimalDrivingView()
                .environmentObject(mediaController)
        }
    }
}
