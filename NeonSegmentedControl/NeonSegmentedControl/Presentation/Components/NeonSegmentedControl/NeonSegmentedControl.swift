//
//  NeonSegmentedControl.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Custom segmented control with neon-style animated selection
struct NeonSegmentedControl: View {

    /// Segment items displayed by the control
    let items: [NeonSegmentItem]
    /// Index of the currently selected segment
    @Binding var selectedIndex: Int

    /// Main control layout and rendering logic
    var body: some View {
        GeometryReader { geo in
            let layout = layout(in: geo.size)
            controlBody(layout: layout)
        }
        .frame(height: Metrics.height)
    }
}
