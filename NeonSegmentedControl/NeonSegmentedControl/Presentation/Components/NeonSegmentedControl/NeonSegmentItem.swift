//
//  NeonSegmentItem.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Model describing a single item in the neon segmented control
struct NeonSegmentItem: Identifiable, Hashable {
    /// Unique identifier for diffing and list rendering
    let id = UUID()
    /// Display title of the segment item
    let title: String
    /// SF Symbols name used as the segment icon
    let systemImage: String
    
    /// Creates a segment item with a title and system image
    init(_ title: String, systemImage: String) {
        self.title = title
        self.systemImage = systemImage
    }
}
