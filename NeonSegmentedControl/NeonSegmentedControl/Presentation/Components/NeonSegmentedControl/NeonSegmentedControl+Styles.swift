//
//  NeonSegmentedControl+Styles.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Color and gradient helpers used to style the neon segmented control
extension NeonSegmentedControl {
    
    /// Background gradient of the segmented control container
    var backgroundGradient: LinearGradient {
        LinearGradient(
            colors: [Colors.backgroundStart, Colors.backgroundEnd],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    /// Glass-like fill gradient for the control background
    var containerFill: LinearGradient {
        LinearGradient(
            colors: [Colors.containerTop, Colors.containerBottom],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    /// Primary gradient used for the selected segment pill
    var selectedGradient: LinearGradient {
        LinearGradient(
            colors: [Colors.selectedStart, Colors.selectedEnd],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    /// Horizontal gradient used for underline and glow effects
    var underlineGradient: LinearGradient {
        LinearGradient(
            colors: [Colors.underlineStart, Colors.underlineEnd],
            startPoint: .leading,
            endPoint: .trailing
        )
    }
    
    /// Highlight overlay gradient applied to the selected pill
    var selectedHighlightGradient: LinearGradient {
        LinearGradient(
            colors: [Colors.selectedHighlightTop, Colors.selectedHighlightBottom],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    /// Stroke color for the glass container outline
    var glassStroke: Color { Colors.glassStroke }
    /// Glow stroke color for the glass container
    var glassGlowStroke: Color { Colors.glassGlowStroke }
    
    /// Stroke color applied to the selected segment pill
    var selectedStroke: Color { Colors.selectedStroke }
    
    /// Primary glow color for the selected segment
    var selectedGlowPrimary: Color { Colors.underlineStart }
    /// Secondary glow color for the selected segment
    var selectedGlowSecondary: Color { Colors.underlineEnd }
    
    /// Primary glow color for underline effects
    var underlineGlowPrimary: Color { Colors.underlineStart }
    /// Secondary glow color for underline effects
    var underlineGlowSecondary: Color { Colors.underlineEnd }
    
    /// Background gradient for inactive segments depending on selection state
    func inactiveSegmentFill(isSelected: Bool) -> LinearGradient {
        LinearGradient(
            colors: [
                (isSelected ? Color.clear : Colors.inactiveFillTop),
                (isSelected ? Color.clear : Colors.inactiveFillBottom)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
    
    /// Stroke color for inactive segments
    func inactiveSegmentStroke(isSelected: Bool) -> Color {
        isSelected ? .clear : Colors.inactiveStroke
    }
    
    /// Glow stroke color for inactive segments
    func inactiveSegmentGlowStroke(isSelected: Bool) -> Color {
        isSelected ? .clear : Colors.inactiveGlowStroke
    }
}

/// View extensions providing reusable visual effects
extension View {
    
    /// Applies a reusable inset shadow effect inside the given shape
    func insetShadow<S: Shape>(
        _ shape: S,
        top: Double = 0.22,
        bottom: Double = 0.10,
        blur: CGFloat = 10,
        offset: CGFloat = 2
    ) -> some View {
        self
            .overlay(
                LinearGradient(
                    colors: [
                        Color.black.opacity(top),
                        Color.black.opacity(0.0)
                    ],
                    startPoint: .top,
                    endPoint: .center
                )
                .blur(radius: blur)
                .offset(y: -offset)
                .mask(shape)
            )
            .overlay(
                LinearGradient(
                    colors: [
                        Color.white.opacity(0.0),
                        Color.white.opacity(bottom)
                    ],
                    startPoint: .center,
                    endPoint: .bottom
                )
                .blur(radius: blur)
                .offset(y: offset)
                .mask(shape)
                .blendMode(.screen)
            )
    }
}
