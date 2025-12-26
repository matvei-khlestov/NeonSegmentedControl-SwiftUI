//
//  Dashboard+Colors.swift
//  NeonSegmentedControl
//
//  Created by Matvei Khlestov on 25.12.2025.
//

import SwiftUI

/// Centralized color palette used across the dashboard UI
enum DashboardColors {
    
    /// Starting color of the dashboard background gradient
    static let backgroundStart = Color.black
    /// Ending color of the dashboard background gradient
    static let backgroundEnd = Color(red: 0.05, green: 0.07, blue: 0.12)
    
    /// Base value used for generating tile tint colors
    static let tintBase: Double = 0.42
    /// Range applied to the base tint value for color variation
    static let tintRange: Double = 0.48
    
    /// Top color of the tile card gradient
    static let cardTop = Color.white.opacity(0.10)
    /// Bottom color of the tile card gradient
    static let cardBottom = Color.white.opacity(0.03)
    
    /// Stroke color used for the tile card border
    static let cardStroke = Color.white.opacity(0.12)
    
    /// Shadow color applied to tile cards
    static let cardShadow = Color.black.opacity(0.25)
    
    /// Opacity multiplier for tile icon shadows
    static let tileShadowMultiplier: Double = 0.26
    /// Opacity multiplier for star icon shadows
    static let starShadowMultiplier: Double = 0.36
}
