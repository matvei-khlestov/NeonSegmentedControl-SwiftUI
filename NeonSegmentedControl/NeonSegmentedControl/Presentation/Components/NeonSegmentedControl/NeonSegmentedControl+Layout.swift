//
//  NeonSegmentedControl+Layout.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Layout calculation logic for the neon segmented control
extension NeonSegmentedControl {
    
    /// Layout-related constants used by the segmented control
    enum Metrics {
        /// Fixed height of the segmented control
        static let height: CGFloat = 55
        /// Corner radius for the outer control shape
        static let outerRadius: CGFloat = 30
        /// Inner padding between control edges and segments
        static let innerPadding: CGFloat = 6
        /// Spacing between individual segments
        static let segmentSpacing: CGFloat = 1
        /// Inset applied to the selection pill inside a segment
        static let pillInset: CGFloat = 3
    }
    
    /// Precomputed layout values used for rendering and animation
    struct Layout: Hashable {
        /// Width of a single segment slot
        let slotWidth: CGFloat
        /// Height of a single segment slot
        let slotHeight: CGFloat
        /// Width of the selection pill
        let pillWidth: CGFloat
        /// Height of the selection pill
        let pillHeight: CGFloat
        /// Clamped horizontal center position of the selection pill
        let clampedCenterX: CGFloat
        /// Vertical center position shared by all segments
        let centerY: CGFloat
    }
    
    /// Calculates layout metrics based on available size and selected segment
    func layout(in size: CGSize) -> Layout {
        let w = size.width
        let countInt = max(items.count, 1)
        let count = CGFloat(countInt)
        
        let totalGaps = Metrics.segmentSpacing * CGFloat(max(countInt - 1, 0))
        let availableWidth = max(0, w - Metrics.innerPadding * 2 - totalGaps)
        
        let scale = UIScreen.main.scale
        let rawSlotWidth = availableWidth / count
        let slotWidth = floor(rawSlotWidth * scale) / scale
        let slotHeight = Metrics.height - Metrics.innerPadding * 2
        
        let pillWidth = max(0, slotWidth - Metrics.pillInset * 2)
        let pillHeight = max(0, slotHeight - Metrics.pillInset * 2)
        
        let rawCenterX = Metrics.innerPadding
        + slotWidth * (CGFloat(selectedIndex) + 0.5)
        + Metrics.segmentSpacing * CGFloat(selectedIndex)
        
        let minCenterX = Metrics.innerPadding + Metrics.pillInset + pillWidth * 0.5
        let maxCenterX = w - Metrics.innerPadding - Metrics.pillInset - pillWidth * 0.5
        let clampedCenterX = min(max(rawCenterX, minCenterX), maxCenterX)
        
        let centerY = Metrics.innerPadding + slotHeight * 0.5
        
        return Layout(
            slotWidth: slotWidth,
            slotHeight: slotHeight,
            pillWidth: pillWidth,
            pillHeight: pillHeight,
            clampedCenterX: clampedCenterX,
            centerY: centerY
        )
    }
}
