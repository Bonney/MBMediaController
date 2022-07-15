//
//  OrientationKey.swift
//  MBMediaController
//
//  Created by Matt Bonney on 7/14/22.
//

import SwiftUI

struct OrientationKey: EnvironmentKey {
    static let defaultValue = OrientationManager()
}

extension EnvironmentValues {
    var orientation: OrientationManager {
        get { return self[OrientationKey.self] }
        set { self[OrientationKey.self] = newValue }
    }
}
