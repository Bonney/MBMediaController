//
//  OrientationPropertyWrapper.swift
//  MBMediaController
//
//  Created by Matt Bonney on 7/14/22.
//

import SwiftUI

@propertyWrapper struct Orientation: DynamicProperty {
    @StateObject private var manager = OrientationManager.shared

    var wrappedValue: UIDeviceOrientation {
        manager.type
    }
}
