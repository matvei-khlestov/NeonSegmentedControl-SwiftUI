//
//  NeonSegmentedControl+Colors.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Color palette definitions for the neon segmented control
extension NeonSegmentedControl {
    
    /// Centralized color constants used by the segmented control styles
    enum Colors {
        
        /// Starting color of the control background gradient
        static let backgroundStart = Color.black
        /// Ending color of the control background gradient
        static let backgroundEnd = Color(red: 0.05, green: 0.07, blue: 0.12)
        
        /// Stroke color for the glass container outline
        static let glassStroke = Color.white.opacity(0.12)
        /// Glow stroke color applied to the glass container
        static let glassGlowStroke = Color.white.opacity(0.07)
        
        /// Top color of the glass container fill gradient
        static let containerTop = Color.white.opacity(0.11)
        /// Bottom color of the glass container fill gradient
        static let containerBottom = Color.white.opacity(0.035)
        
        /// Starting color of the selected segment gradient
        static let selectedStart = Color(red: 0.05, green: 0.75, blue: 1.0)
        /// Ending color of the selected segment gradient
        static let selectedEnd = Color(red: 0.02, green: 0.35, blue: 0.85)
        
        /// Starting color of underline and glow gradients
        static let underlineStart = Color(red: 0.20, green: 0.85, blue: 1.0)
        /// Ending color of underline and glow gradients
        static let underlineEnd = Color(red: 0.10, green: 0.55, blue: 1.0)
        
        /// Top highlight color overlay for the selected segment
        static let selectedHighlightTop = Color.white.opacity(0.16)
        /// Bottom highlight color overlay for the selected segment
        static let selectedHighlightBottom = Color.white.opacity(0.02)
        
        /// Stroke color for the selected segment outline
        static let selectedStroke = Color(red: 0.20, green: 0.85, blue: 1.0).opacity(0.95)
        
        /// Top fill color for inactive segments
        static let inactiveFillTop = Color.white.opacity(0.06)
        /// Bottom fill color for inactive segments
        static let inactiveFillBottom = Color.white.opacity(0.02)
        /// Stroke color for inactive segment outlines
        static let inactiveStroke = Color.white.opacity(0.16)
        /// Glow stroke color for inactive segments
        static let inactiveGlowStroke = Color.white.opacity(0.06)
    }
}
