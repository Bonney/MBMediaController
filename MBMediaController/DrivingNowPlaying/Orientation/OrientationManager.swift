//
//  OrientationManager.swift
//  MBMediaController
//
//  Created by Matt Bonney on 7/14/22.
//

import Combine
import SwiftUI

class OrientationManager: ObservableObject {
    @Published var type: UIDeviceOrientation = .unknown

    static let shared = OrientationManager()

    private var cancellables: Set<AnyCancellable> = []

    init() {
        guard let scene = UIApplication.shared.connectedScenes.first,
              let sceneDelegate = scene as? UIWindowScene else { return }

        let orientation = sceneDelegate.interfaceOrientation

        switch orientation {
        case .portrait: type = .portrait
        case .portraitUpsideDown: type = .portraitUpsideDown
        case .landscapeLeft: type = .landscapeLeft
        case .landscapeRight: type = .landscapeRight

        default: type = .unknown
        }

        NotificationCenter.default
            .publisher(for: UIDevice.orientationDidChangeNotification)
            .sink() { [weak self] _ in
                self?.type = UIDevice.current.orientation
            }
            .store(in: &cancellables)
    }
}
